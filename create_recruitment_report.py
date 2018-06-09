import pandas as pd
import os
from collections import defaultdict
import saspy
# Create a dictionary to map SITE number to NODE
# For each enrollment table create a running tally of number of participant enrolled in a node
# Combine into a csv

# Get Site and Node info
site_and_node_df = pd.read_sas(r'G:\NIDADSC\spitts\SAS_Projects\SiteInfo\all_site_info.sas7bdat', format='sas7bdat')

site_and_node_info = dict()
for idx, row in site_and_node_df.iterrows():
    site = row.loc['SITECODE']
    node =row.loc['Node_name']

    if type(node) is not float:
        site_and_node_info[site.decode('utf-8')] = node.decode('utf-8')

print(site_and_node_info.keys())

# Get enrollment tables
base_dir = r'C:\Users\spitts\PycharmProjects\recruitment_report\enrollment_tables'
data_tables = os.listdir(base_dir)
enrollment_tables = [table for table in data_tables
                     if table.endswith('.csv')]

# Find numbers for each table
all_enrollment_numbers = dict()

for enrollment_table in enrollment_tables:
    table_pathway = os.path.join(base_dir, enrollment_table)
    enrollment_table_df = pd.read_csv(table_pathway)
    if enrollment_table_df is not None:
        sites_in_table = enrollment_table_df.groupby(['SITE'])['SITE'].count()
        all_enrollment_numbers[enrollment_table[2:6]] = sites_in_table.to_dict()

enrollment_by_node = defaultdict(dict)
for prot, prot_info in all_enrollment_numbers.items():
    enrollment_by_node[prot] = defaultdict(dict)
    for site, number_enrolled in prot_info.items():
        site = str(site)
        if not site.startswith("0"):
            site = "0" + site
        enrollment_by_node[prot][site_and_node_info[site]] = number_enrolled

for prot, prot_info in enrollment_by_node.items():
    print(prot)
    print(prot_info)

all_node_info_df = pd.DataFrame.from_dict(enrollment_by_node)

excel_writer = pd.ExcelWriter(r'C:\Users\spitts\PycharmProjects\recruitment_report\report.xlsx')

all_node_info_df.to_excel(excel_writer)
excel_writer.save()
