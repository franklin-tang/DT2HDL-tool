import ast
import sys
import pandas as pd


def readfile(filename):
    with open(filename, "r") as file:
        text = file.readlines()

    nodes = pd.DataFrame(columns=['number', 'feature', 'threshold'])
    chains = pd.DataFrame(columns=['previous', 'next'])
    leaves = pd.DataFrame(columns=['number', 'class'])
    benches = pd.DataFrame(columns=['node', 'true', 'false'])

    for line in text[3:-1]:
        sign_node = line.find('<=')   # the sign that only the node lies have
        sign_chain = line.find('->')  # the sign that only the chain lies have
        if sign_node != -1:           # for the node line , e.g. 4 [label="Ib <= 57.0\nsamples = 28\nvalue = [0, 28]"] ;
            node_number = line.find('[')  # which is after "4" in the e.g.
            node_con = line.find('"')     # which is before "Ib" in the e.g.
            node_th = line.find('\\')     # which is after "57.0" in the e.g.
            new_row = pd.DataFrame({'number': [int(line[:node_number])],
                                    'feature': [line[(node_con+1):sign_node]],
                                    'threshold': [int(float(line[(sign_node+2):node_th])+1.0)]
                                    })
            nodes = pd.concat([nodes, new_row], ignore_index=True)

        elif sign_chain != -1:    # for the chain line, e.g. 1 -> 2 ;
            end = line.find('[')  # the first line has some extra descriptions
            if end != -1:  # the other line
                chain = line[:end]
             else:          # the first line
                end = line.find(';')
                chain = line[:end]
            new_row = pd.DataFrame({'previous': [int(chain[:sign_chain])],
                                    'next': [int(chain[(sign_chain + 2):])]
                                    })  # add a new row to the chains with separate values
            chains = pd.concat([chains, new_row], ignore_index=True)

        else:  # for the leaf line, e.g. 5 [label="samples = 1\nvalue = [0, 1]"] ;
            leaf_number = line.find('[')
            class_start = line.find('[', (leaf_number+1))
            class_end = line.find(']')
            class_amounts = ast.literal_eval(line[class_start:(class_end + 1)])  # transfer str'[]' to list
            class_number = class_amounts.index(max(class_amounts))  # get the max number of class
            new_row = pd.DataFrame({'number': [int(line[:leaf_number])],
                                    'class': [class_number]
                                    })
            leaves = pd.concat([leaves, new_row], ignore_index=True)

    # transfer the chains to benches
    chains_sorted = chains.sort_values(by='previous', ignore_index=True)  # get the sequence by the previous node number
    for node_group in range(0, chains_sorted.shape[0], 2):  # in chains, every two nodes, which should be the same, are in group
        node_a = chains_sorted.at[node_group, 'previous']   # get the two node number
        node_b = chains_sorted.at[(node_group + 1), 'previous']
        if node_a != node_b:  # check the similarity of the nodes
            print("DT export structure error")
            sys.exit(1)
        leaf_a = chains_sorted.at[node_group, 'next']     # get the two leaves after a node
        leaf_b = chains_sorted.at[(node_group+1), 'next']
        if leaf_a < leaf_b:  # the smaller number of the leaf is the true state.
            new_row = pd.DataFrame({'node': [node_a],
                                    'true': [leaf_a],
                                    'false': [leaf_b]
                                    })
        else:
            new_row = pd.DataFrame({'node': [node_a],
                                    'true': [leaf_b],
                                    'false': [leaf_a]
                                    })
        benches = pd.concat([benches, new_row], ignore_index=True)

    return nodes, chains, leaves, benches
