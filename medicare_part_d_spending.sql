select * from medicare_part_d_spending;

--Identify Top-Spending Drugs in 2017
--This query will help you identify the top-spending drugs based on average spending per dosage unit.
select a.brnd_name, a.Avg_Spnd_Per_Dsg_Unt_Wghtd_2017 from medicare_part_d_spending a where  a.Avg_Spnd_Per_Dsg_Unt_Wghtd_2017 = (
select max(b.Avg_Spnd_Per_Dsg_Unt_Wghtd_2017) from medicare_part_d_spending b
) group by a.brnd_name,a.Avg_Spnd_Per_Dsg_Unt_Wghtd_2017 ;

--simlary can be done for other years

--Calculating Total Spending Over the Years for a Specific Drug
select brnd_name,SUM(tot_spndng_2017) as totalspending2017,
                 SUM(tot_spndng_2018) as totalspending2018,
                 SUM(tot_spndng_2019) as totalspending2019,
                 SUM(tot_spndng_2020) as totalspending2020,
                 SUM(tot_spndng_2021) as totalspending2021
from medicare_part_d_spending where LOWER(brnd_name)='acarbose' group by  brnd_name;


--Calculate the Average Spending Per Beneficiary for All Drugs in 2017
select brnd_name,avg_spnd_per_bene_2017 from medicare_part_d_spending group by brnd_name,avg_spnd_per_bene_2017;

select avg(avg_spnd_per_bene_2017) from medicare_part_d_spending;

--Identify Outlier Drugs in 2017
--helps us identify drugs in 2017 that are flagged as outliers, potentially indicating unusual spending patterns.

select * from medicare_part_d_spending where outlier_flag_2017=1;

--Analyze Manufacturer Data

select mftr_name,count(distinct brnd_name) as numberofbrands,trunc(avg(nvl(tot_spndng_2017,0)),2) as avgspending2017 
from medicare_part_d_spending group by mftr_name order by avgspending2017 desc;

--Trends in Drug Spending Over the Years:

select brnd_name,tot_spndng_2017,tot_spndng_2018,tot_spndng_2017,tot_spndng_2019,tot_spndng_2020,tot_spndng_2021 from medicare_part_d_spending where brnd_name = 'Abacavir';

select * from medicare_part_d_spending;
--drugs with the Highest Manufacturer Competition
-- identifies drugs with the highest number of manufacturers, which can indicate competition and potential price variations.
select brnd_name,gnrc_name,tot_mftr from  medicare_part_d_spending order by tot_mftr desc;

--drugs that has most benificiaries (Number of Part D beneficiaries utilizing the drug during the benefit year.)
select brnd_name, 
sum(nvl(Tot_Benes_2017,0)) totalbenficary2017
from medicare_part_d_spending group by brnd_name order by totalbenficary2017 desc; 
--Atorvastatin is used along with a proper diet to help lower "bad" cholesterol and fats.


--ranking drugs by spending in 2021

SELECT
    brnd_name,
    tot_spndng_2021,
    DENSE_RANK() OVER (ORDER BY NVL(tot_spndng_2021, 0) DESC) AS Rank_2021
FROM medicare_part_d_spending
ORDER BY Rank_2021;

--tot_clms => Number of prescription fills for each drug. Includes original prescriptions and refills.
--Top Drugs by Claims
--Identify the drugs with the highest number of claims in 2017 and their corresponding claim counts.

select brnd_name,tot_clms_2017 as claims_2017 from medicare_part_d_spending order by nvl(tot_clms_2017,0) desc fetch first row only ;





