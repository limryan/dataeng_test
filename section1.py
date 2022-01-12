from os import name
import sys
import pandas as pd
from datetime import date

# read in csv file
filename = sys.argv[1]
namelist = pd.read_csv(filename)

# delete any rows which do not have a name
namelist.dropna(subset=['name'], inplace=True)

# split the name field into first_name and last_name
namelist['name'] = namelist['name'].replace(['Miss ','Mr\. ','Ms\. ','Mrs\. ','Dr\. '],'', regex=True)
namelist['first_name'] = namelist['name'].str.split().str[0]
namelist['last_name'] = namelist['name'].str.split().str[1]

namelist.drop(columns=['name'], inplace=True)
namelist.set_index(['first_name', 'last_name'], inplace=True)
namelist.astype({'price': 'int32'}).dtypes

# create a new field named above_100
namelist["above_100"] = namelist["price"] > 100

# save csv file
today = date.today().strftime("%Y-%m-%d") 
output_filename = "processed_dataset_" + today + ".csv"
namelist.to_csv(output_filename)