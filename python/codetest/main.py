

def remove_dups(list):
    out_list = []
    for item in list:
        if item not in out_list:
            out_list.append(item)
    return out_list

print(remove_dups([1,1,2,2,3,4,5,6,6]))
