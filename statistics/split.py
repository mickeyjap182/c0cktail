import os
import sys
cur_path = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.join(cur_path, 'modules'))

from modules.imagehandler import Separator

# input file
i = Separator(input_file='split/m001.JPG')
# output separated files.(3 × 3)
i.separate(3, 3,out_file=os.path.join("split", "splitted", "m_file_{:010}.png"))
