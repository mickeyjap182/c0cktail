import sys
import math
import random
import openpyxl
import numpy as np
import matplotlib.pyplot as plt

def savehist(data, file_name='result.png'):
    """ ヒストグラム保存 """
    plt.hist(data)
    plt.xlabel('Value')
    plt.ylabel('Frequency')
    plt.title('Histogram')
    # plt.show()
    plt.savefig(file_name)

book = openpyxl.load_workbook('pademister.xlsx')
worksheet = book.worksheets[0]
MAX = 6
sheets = []
# cells = worksheet['A2:C7']

# data = worksheet.cell(column=3, row=10)
# for i, row in enumerate(worksheet.rows):
for i, row in enumerate(worksheet['A2:B7']):
    record = []
    for j, cell in enumerate(row):
        print(j)
        print(cell.value)
        record.append(cell.value)
    sheets.append(tuple(record))
print(sheets)
savehist(sheets, file_name='hist.png')
