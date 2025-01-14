import math
import sys
import pandas as pd
from scipy.cluster.hierarchy import leaves_list

import transfer_read

def DT2HDL_P(file_read_path, module_name, input_columns, input_bits=8):
    file_write_path = module_name + '.sv'
    nodes, chains, leaves, benches = transfer_read.readfile(file_read_path)  # get parameters in .dot file

    path_number = leaves['number'].max()  # get the numbers of the nodes
    # print(nodes_number)  # the index and the numbers of the nodes

    input_bits = 8
    # output_bits = 1
    output_number = leaves['class'].max()
    output_bits = math.floor(math.log2(output_number)) + 1  # the output bits width decided by the number of classes

    with open(file_write_path, 'w') as file:  # start to write the file
        # module head and in out definitions
        file.write('`timescale 1ns / 1ps \n\n')
        file.write('module ' + module_name + ' (' + ", ".join(input_columns) + ',cls);\n\n')
        file.writelines('parameter N = \'d' + str(input_bits) + ';\n')  # inputs bits width
        file.writelines('parameter C = \'d' + str(output_bits) + ';\n')  # output bits width
        file.write('input logic[N-1:0]' + ", ".join(input_columns) + ';\n')  # input features
        file.write('output logic [C-1:0] cls;\n\n')

        path_numbers = []  #
        for i in range(path_number+1):
            path_numbers += ('ns' + str(i) + ',')  #
        file.write('logic ')
        file.writelines(path_numbers[:-1])
        file.write(';\n')

        cls_numbers = []  #
        for i in range(output_number+1):
            cls_numbers += ('cls' + str(i) + ',')  #
        file.write('logic ')
        file.writelines(cls_numbers[:-1])
        file.write(';\n')

        file.write('assign ns0 = 1;\n')
        for i in range(nodes.shape[0]):
            file.write('assign ns')
            file.write(str(benches.at[i,'true']) + '= (')
            file.write(nodes.at[i, 'feature'] + '<' )
            file.write(str(nodes.at[i, 'threshold']) + ')? ns')
            file.write(str(nodes.at[i, 'number']) + ': 0;\n')

            file.write('assign ns')
            file.write(str(benches.at[i, 'false']) + '= (')
            file.write(nodes.at[i, 'feature'] + '<')
            file.write(str(nodes.at[i, 'threshold']) + ')? 0:ns')
            file.write(str(nodes.at[i, 'number']) + ';\n')

        for i in range(output_number + 1):
            file.write('assign cls' + str(i) + ' = ')
            leaves_path = []
            for j in range(leaves.shape[0]):
                if leaves.at[j, 'class'] == i:
                    leaves_path += ('ns' + str(leaves.at[j, 'number']) + '|')
            file.writelines(leaves_path[:-1])
            file.write(';\n')


        file.write('always_comb\n')
        file.write('begin\n')
        file.write('casex({')
        file.writelines(cls_numbers[:-1])
        file.write('})\n')
        for i in range(output_number+1):
            file.write(str(output_number+1)  + '\'b' )
            for j in range(output_number + 1):
                if j == i:
                    file.write('1')
                else:
                    file.write('0')
            file.write(': cls = \'d' + str(i))
            file.write(';\n')

        file.write('		default: cls = \'0;\n')
        file.write('	endcase\n')
        file.write('end\n\n')

        file.write('endmodule\n')

# DT2HDL_P('IrisDT.dot', 'IrisDT_p_a', ['SEPAL_LENGTH', 'SEPAL_WIDTH', 'PETAL_LENGTH', 'PETAL_WIDTH'], input_bits=8)
