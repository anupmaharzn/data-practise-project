# Medicare Part D Spending by Drug

The Medicare Part D by Drug dataset presents information on spending for drugs prescribed to Medicare beneficiaries enrolled in Part D by physicians and other healthcare providers. Drugs prescribed in the Medicare Part D program are drugs patients generally administer themselves.

The dataset focuses on average spending per dosage unit and change in average spending per dosage unit over time. It also includes spending information for manufacturer(s) of the drugs as well as consumer-friendly information of drug uses and clinical indications.

Drug spending metrics for Part D drugs are based on the gross drug cost, which represents total spending for the prescription claim, including Medicare, plan, and beneficiary payments. The Part D spending metrics do not reflect any manufacturers’ rebates or other price concessions as CMS(Centers for Medicare & Medicaid Services) is prohibited from publicly disclosing such information.

# column data dictionary

brnd_name - brand name (both brand names and trademarked name)

gnrc_name - generic name (chemical ingredient of drug)

tot_mftr - number of manufacturers for each drug

mftr_name - name of the maufaturer of the drug.

tot_spndng_2017 - aggeragte drug spending for the medicare part d program during the benefit year.

tot_dsg_unts_2017 - total dosage units ( the sum of the dosage units of medication dispensed across the calendar year (tablets,grams,millimetes or other units) )

Tot_Clms_2017 - 2017 Total Claims Number of prescription fills for each drug. Includes original prescriptions and
refills

Tot_Benes_2017 - 2017 Total Beneficiaries Number of Part D beneficiaries utilizing the drug during the benefit year

Avg_Spnd_Per_Dsg_Unt_Wghtd_2017 - 2017 Average Total Spending Per Dosage Unit (Weighted)
Medicare Part D drug spending divided by the number of dosage units, which
is weighted by the proportion of total claims.

Avg_Spnd_Per_Clm_2017 - 2017 Average Total Spending Per
Claim
Part D drug spending divided by the number of prescription fills.

Avg_Spnd_Per_Bene_2017 - 2017 Average Spending Per
Beneficiary
Total Part D drug spending divided by the number of unique beneficiaries
utilizing the drug during the benefit year.

Outlier_Flag_2017 - 2017 Outlier Flag
Yearly outlier flag variable, which is set to “1” when a drug’s Average
Spending per Dosage Unit is substantially impacted by outlier records in a
given year. These potentially anomalous drugs are identified as outliers so
that users can exercise caution when interpreting results.

similarly for 2018,2019,2020,2021 columns

# data source

-> https://catalog.data.gov/dataset/medicare-part-d-spending-by-drug-401d2
