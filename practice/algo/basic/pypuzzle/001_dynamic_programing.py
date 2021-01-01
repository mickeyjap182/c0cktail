
# unit is max members per a table.
# unit, guests = 10, 100
unit, guests = 5, 13
# We assign guests to tables.
def assign(leftover, down_limit):
    if leftover < 0 :
        return 0
    if leftover == 0 :
        return 1

    ptn_cnt = 0
    for i in range(down_limit, unit+1, 1):
        print('==start==')
        print(i)
        print(leftover)
        print('==end==')
        ptn_cnt += assign(leftover - i, i)
        print(ptn_cnt)
    return ptn_cnt

print([s for s in range(2, 10, 1)])
# ret = assign(guests, 2)

# print(ret)
