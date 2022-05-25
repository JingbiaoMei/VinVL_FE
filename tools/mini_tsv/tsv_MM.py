# Copyright (c) 2021 Microsoft Corporation. Licensed under the MIT license. 
import os
import os.path as op
import json
import cv2
import base64
import time
from maskrcnn_benchmark.structures.tsv_file_ops import tsv_reader, tsv_writer
from maskrcnn_benchmark.structures.tsv_file_ops import generate_linelist_file
from maskrcnn_benchmark.structures.tsv_file_ops import generate_hw_file
from maskrcnn_benchmark.structures.tsv_file import TSVFile
from maskrcnn_benchmark.data.datasets.utils.image_ops import img_from_base64

# To generate a tsv file:
data_path = "/home/jm2245/rds/hpc-work/Documents/MMHS150k_DataManipulation/data/img_resized/"
img_list = os.listdir(data_path)
tsv_file = "tools/mini_tsv/data_MM/test.tsv"
label_file = "tools/mini_tsv/data_MM/test.label.tsv"
hw_file = "tools/mini_tsv/data_MM/test.hw.tsv"
linelist_file = "tools/mini_tsv/data_MM/test.linelist.tsv"

rows = []
rows_label = []
rows_hw = []
start = time.time()
for index, img_p in enumerate(img_list):
    img_key = img_p.split('.')[0]
    img_path = op.join(data_path, img_p)
    img = cv2.imread(img_path)
    img_encoded_str = base64.b64encode(cv2.imencode('.jpg', img)[1])

    # Here is just a toy example of labels.
    # The real labels can be generated from the annotation files
    # given by each dataset. The label is a list of dictionary 
    # where each box with at least "rect" (xyxy mode) and "class"
    # fields. It can have any other fields given by the dataset.
    labels = []
    labels.append({"rect": [1, 1, 30, 40], "class": "Dog"})
    #labels.append({"rect": [2, 3, 100, 100], "class": "Cat"})

    row = [img_key, img_encoded_str]
    rows.append(row)

    row_label = [img_key, json.dumps(labels)]
    rows_label.append(row_label)

    height = img.shape[0]
    width = img.shape[1]
    row_hw = [img_key, json.dumps([{"height":height, "width":width}])]
    rows_hw.append(row_hw)
    if index % 1000 == 0: 
        print("Loaded %d images, time taken: %.2f" % (index, time.time()-start))
finish = time.time()
print("Time taken to load images:", finish-start)
print("All iamge loaded, started to write tsv")
tsv_writer(rows, tsv_file)
tsv_writer(rows_label, label_file)
tsv_writer(rows_hw, hw_file)

# generate linelist file
generate_linelist_file(label_file, save_file=linelist_file)

'''
# To access a tsv file:
# 1) Use tsv_reader to read dataset in given order
rows = tsv_reader("tools/mini_tsv/data/train.tsv")
rows_label = tsv_reader("tools/mini_tsv/data/train.label.tsv")
for row, row_label in zip(rows, rows_label):
    img_key = row[0]
    labels = json.loads(row_label[1])
    img = img_from_base64(row[1])

# 2) use TSVFile to access dataset at any given row.
tsv = TSVFile("tools/mini_tsv/data/train.tsv")
row = tsv.seek(1) # to access the second row 
img_key = row[0]
img = img_from_base64(row[1])

'''
