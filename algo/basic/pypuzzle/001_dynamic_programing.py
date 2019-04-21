
# unit is max members per a table.
unit, guests = 10, 100
# We assign guests to tables.
def assign(leftover, down_limit):
    if leftover < 0 :
        return 0
    if leftover == 0 :
        return 1

    ptn_cnt = 0
    for i in range(down_limit, leftover, 1):
        print(i)
    return ptn_cnt

assign(guests, 2)
