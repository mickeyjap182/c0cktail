
ITEM_ID = 'GLOBAL'

def disp_global():
    # ITEM_ID += " => modify in func." # UnboundLocalError
    global ITEM_ID # require define as global at head of the current scope.
    print("scope:func     proccess:start       GLOBAL ITEM_ID:{}".format(ITEM_ID))
    ITEM_ID += " => modify in func."
    print("scope:func     proccess:end         GLOBAL ITEM_ID:{}".format(ITEM_ID))

# 1
disp_global()
print("scope:global   proccess:exited func GLOBAL ITEM_ID:{}".format(ITEM_ID))
