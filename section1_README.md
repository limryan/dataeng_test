# Section 1
There are 5 files included for this section.

## `section1.py`
The csv file to be processed is passed in through the system arguments. Using pandas, the script then removes any rows that have null values in the `name` column. Then any salutations (Mr., Mrs., Ms., Miss, Dr.) found are removed before the names are split into the first and last name. This is done by calling the `split()` method and taking the first and second items. Any suffixes (e.g. MD, DDS) will not be included. The price column is set to numeric; this will remove any prepended '0'. Then a new column `above_100` is created: the value will be `True` if the price is above 100, `False` otherwise.

To run this script at regular intervals, `cron` can be used. 
If the dataset will be available by 1am everyday, this is an example cron command to run the script at 1am everyday:

`0 1 * * * python3 FILEPATH/section1.py FILEPATH/dataset1.csv`

## `dataset1.csv` & `dataset2.csv`
These are the original datasets from https://github.com/hanselblack/dataeng_test

## `processed_dataset1.csv` & `processed_dataset2.csv`
These are the processed datasets produced by `section1.py` from `dataset1.csv` and `dataset2.csv` respectively