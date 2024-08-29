import math
import sys
import pandas as pd
import transfer_read

# file_read_path = 'detectionDT.dot'
# file_write_path = 'DT_d_a.sv'
# module_name = 'DT_d_a'
file_read_path = 'classificationDT.dot'
file_write_path = 'DT_c_a.sv'
module_name = 'DT_c_a'

nodes, chains, leaves, benches = transfer_read.readfile(file_read_path)  # get parameters in .dot file

input_bits = 8
# output_bits = 1
output_bits = math.ceil(math.sqrt(leaves['class'].max()))  # the output bits width decided by the number of classes

nodes_number = nodes['number']  # get the numbers of the nodes

with open(file_write_path, 'w') as file:  # start to write the file
    # module head and in out definitions
    file.write('`timescale 1ns / 1ps \n\n')
    file.write('module ' + module_name + ' (Va,Vb,Vc,Ia,Ib,Ic,cls);\n\n')
    file.writelines('parameter N = \'d' + str(input_bits) + ';\n')   # inputs bits width
    file.writelines('parameter C = \'d' + str(output_bits) + ';\n')  # output bits width
    file.write('input logic[N-1:0] Va,Vb,Vc,Ia,Ib,Ic;\n')  # input features
    file.write('output logic [C-1:0] cls;\n\n')

    nodes_numbers = []  # the str of the numbers of nodes
    for i in range(nodes.shape[0]):
        nodes_numbers += ('ns' + str(nodes_number[i]) + ',')  # gets the serial numbers of every node, same as it in .dot

    # nodes states statement
    file.write('logic ')
    file.writelines(nodes_numbers[:-1])
    file.write(';\n')

    # thresholds statement, e.g. parameter logic[N-1:0] t1 = 8'd136;
    threshold_head = 'parameter logic[N-1:0] t'
    threshold_mid  = ' = ' + str(input_bits) + '\'d'
    threshold_tail = ';\n'
    for i in range(nodes.shape[0]):
        file.write(threshold_head + str(nodes_number[i]) + threshold_mid
                   + str(nodes.at[i, 'threshold']) + threshold_tail)
    file.write('\n')

    # nodes states comparators, e.g. assign ns4 = (Ib < t4)? 1:0;
    node_head = 'assign ns'
    node_mid1 = ' = ('
    node_mid2 = '< t'
    node_tail = ')? 1:0;\n'
    for i in range(nodes.shape[0]):
        file.write(node_head + str(nodes_number[i]) + node_mid1
                   + str(nodes.at[i, 'feature']) + node_mid2
                   + str(nodes_number[i]) + node_tail)
    file.write('\n')

    # get look up tables for every class
    luts = pd.DataFrame(columns=['LUT', 'class'])  # DataFrame for Look Up Table
    lut_len = len(nodes_number)  # same as the number of nodes
    # for every leaf, there is a set of LUT
    for i in range(leaves.shape[0]):
        leaf = leaves.at[i, 'number']  # get the leaf number
        conditions = pd.DataFrame(columns=['number', 'value'])
        end = False
        while not end:
            chain = chains.index[chains['next'] == leaf].tolist()  # get the number of the chain with the behind the leaf
            if len(chain) != 1:  # if have the two same nodes
                print("DT export structure error")
                sys.exit(1)
            node = chains.at[chain[0], 'previous']  # get the node before the leaf
            bench = benches.index[benches['node'] == node].tolist()  # get the bench of the node
            if leaf == benches.at[bench[0], 'false']:  # get condition of true or false
                value = 0
            elif leaf == benches.at[bench[0], 'true']:
                value = 1
            else:
                print("DT export structure error")
                sys.exit(1)

            new_row = pd.DataFrame({'number': [node], 'value': [value]})  # add a new row
            conditions = pd.concat([conditions, new_row], ignore_index=True)
            leaf = node  # set the node as leaf

            if node == 0:  # run until the root node
                end = True

        # for each set of LUT
        lut = []  # for the content in the LUT
        for j in range(len(nodes_number)):  # the length of it is same as the number of nodes
            x = conditions.index[conditions['number'] == nodes_number[j]].tolist()  # check the condition for every node
            if x:  # has a condition
                if conditions.at[x[0], 'value']:  # with the condition of true
                    lut.append('1')
                else:
                    lut.append('0')  # with the condition of false
            else:  # with no condition
                lut.append('?')
        new_row = pd.DataFrame({'LUT': [''.join(lut)], 'class': [leaves.at[i, 'class']]})  # add a new row to LTUs
        luts = pd.concat([luts, new_row], ignore_index=True)
    print(luts)

    # write the LTUs
    file.write('always_comb\n')
    file.write('begin\n')
    file.write('    casex({')
    file.writelines(nodes_numbers[:-1])
    file.write('})\n')
    # write the LTUs, e.g. 9'b1111?????: cls = 'd1;
    for i in range(luts.shape[0]):
        file.write('		' + str(lut_len) + '\'b' +
                   str(luts.at[i, 'LUT']) + ': cls = \'d' +
                   str(luts.at[i, 'class']) + ';\n')
    file.write('		default: cls = \'0;\n')
    file.write('	endcase\n')
    file.write('end\n\n')

    file.write('endmodule\n')
