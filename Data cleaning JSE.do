
insheet using "/Users/jerosenbaum/OneDrive - Downstate Medical Center/projects/dierker/studentprepostthrough2019_2020update.csv"

* Past experience with coding: 38+56
* No past experience with coding:  87+98


*Students who have low coding confidence despite past experience with code:  38.  
*Students who have high coding confidence despite no past experience with coding:  87.
*Low coding confidence and no past experience with code:  98/
*High coding confidence and past experience with code:  56


tab software

gen fall2018=semester=="fall2018"
gen fall2019=semester=="fall2019"
gen spring2019=semester=="spring2019"
gen summer2019=semester=="summer2019"
gen winter2019=semester=="winter2019"
gen winter2020=semester=="winter2020"


tab pre_progconf_o
destring pre_progconf_o, replace force
gen coding_confidence0=pre_progconf_o==4 |pre_progconf_o==5 
replace coding_confidence0=. if pre_progconf_o==.
gen math_confidence0=math_selfefficacy0==0.75 | math_selfefficacy0==1
replace math_confidence0=. if pre_goodmath_o==.
gen coding_lowconf0=pre_progconf_o==1 |pre_progconf_o==2 
replace coding_lowconf0=. if pre_progconf_o==.
tab pre_expcode


tab pre_progconf_o if schooltype!=2, `mi`ssing
tab coding_confidence0, missing
tab coding_confidence0 if schooltype!=2, missing

gen coding_experience0=pre_expcode==1
replace coding_experience0=. if pre_expcode==.
tab coding_experience0 
tab coding_experience0 coding_confidence0
tab coding_experience0 coding_lowconf0

tab pre_expcode, missing
tab pre_expcode if schooltype!=2, missing


gen conf_exp0=0*(coding_experience0==0 & coding_lowconf0==1) + 1*(coding_experience0==1 & coding_lowconf0==1) +2*(coding_experience0==0 & coding_lowconf0==0) +  3*(coding_experience0==1 & coding_lowconf0==0)

gen learningaccomodation0=pre_ld==1
tab learningaccomodation0 pre_ld

gen stat_anxiety0=(pre_nerv_o-1)/4
replace stat_anxiety0=. if pre_nerv_o==.

tab stat_anxiety0, missing
tab stat_anxiety0 if schooltype!=2, missing

gen stat_anxiety0c=(pre_nerv_o-1)
replace stat_anxiety0c=. if pre_nerv_o==.
tab stat_anxiety0c, missing



* PRE_SCHYEAR_07 
tab pre_schyear_07, missing
tab pre_schyear_07 if schooltype!=2, missing
gen hs_first_second=pre_schyear_07<=3
gen hs_first=pre_schyear_07<=2
gen hs=pre_schyear_07==1
gen freshman=pre_schyear_07==2
gen sophomore=pre_schyear_07==3
gen junior=pre_schyear_07==4
gen senior=pre_schyear_07==5
gen gradstudent=pre_schyear_07==6
gen othergrade=pre_schyear_07==7

replace hs=. if pre_schyear_07==.
replace freshman=. if pre_schyear_07==.
replace sophomore=. if pre_schyear_07==.
replace junior=. if pre_schyear_07==.
replace senior=. if pre_schyear_07==.
replace gradstudent=. if pre_schyear_07==.
replace othergrade=. if pre_schyear_07==.



destring pre_cure_pbl_o_4, replace force

* Alpha = 0.73, 5 items
* Alpha = 0.80, 5 items in newer data
factor pre_cure_pbl_o_1 pre_cure_pbl_o_2 pre_cure_pbl_o_3 pre_cure_pbl_o_4 pre_cure_pbl_o_7 , factors(1)
alpha  pre_cure_pbl_o_1 pre_cure_pbl_o_2 pre_cure_pbl_o_3 pre_cure_pbl_o_4 pre_cure_pbl_o_7
tab1 pre_cure_pbl_o_1 pre_cure_pbl_o_2 pre_cure_pbl_o_3 pre_cure_pbl_o_4 pre_cure_pbl_o_7

gen rsch_exp0=(pre_cure_pbl_o_1 + pre_cure_pbl_o_2 + pre_cure_pbl_o_3 + pre_cure_pbl_o_4 + pre_cure_pbl_o_7-5)/4/5
replace rsch_exp0=. if pre_cure_pbl_o_1==9 | pre_cure_pbl_o_2==9 | pre_cure_pbl_o_3==9 | pre_cure_pbl_o_4==9 | pre_cure_pbl_o_7==9
tab rsch_exp0, missing
tab rsch_exp0 if schooltype!=2, missing

* categorical version
gen rsch_exp0c=(pre_cure_pbl_o_1 + pre_cure_pbl_o_2 + pre_cure_pbl_o_3 + pre_cure_pbl_o_4 + pre_cure_pbl_o_7-5)
replace rsch_exp0c=. if pre_cure_pbl_o_1==9 | pre_cure_pbl_o_2==9 | pre_cure_pbl_o_3==9 | pre_cure_pbl_o_4==9 | pre_cure_pbl_o_7==9
tab rsch_exp0c, missing



tab post_urssa_salg_5_1new post_urssa_salg_5_1

destring post_urssa_salg_5_1, replace force
destring post_urssa_salg_5_1new, replace force
destring post_urssa_salg_5_2, replace force 
destring post_urssa_salg_5_3, replace force
destring post_urssa_salg_5_4, replace force 
destring post_urssa_salg_5_4new, replace force
destring post_urssa_salg_5_5, replace force
destring post_urssa_salg_5_6, replace force
 
# Rating relationships
# load with at least 0.6
factor post_urssa_salg_5_1 post_urssa_salg_5_1new post_urssa_salg_5_2 post_urssa_salg_5_3 post_urssa_salg_5_4 post_urssa_salg_5_4new post_urssa_salg_5_5 post_urssa_salg_5_6, factors(1)

destring post_urssa_salg1_o_1, replace force
destring post_urssa_salg1_o_2, replace force
destring post_urssa_salg1_o_3, replace force
destring post_urssa_salg1_o_4, replace force
destring post_urssa_salg1_o_5, replace force 
destring post_urssa_salg1_o_6, replace force
destring post_urssa_salg1_o_7, replace force
destring post_urssa_salg1_o_8, replace force
destring post_urssa_salg2_o_1, replace force
destring post_urssa_salg2_o_2, replace force
destring post_urssa_salg2_o_3, replace force
destring post_urssa_salg2_o_4, replace force
destring post_urssa_salg2_o_5, replace force
destring post_urssa_salg2_o_6, replace force
destring post_urssa_salg2_o_7, replace force
destring post_urssa_salg2_o_8, replace force
destring post_urssa_salg_3_1, replace force
destring post_urssa_salg_3_2, replace force
destring post_urssa_salg_3_3, replace force
destring post_urssa_salg_3_4, replace force
destring post_urssa_salg_3_5, replace force
destring post_urssa_salg_3_6, replace force
destring post_urssa_salg_3_7, replace force
destring post_urssa_salg_3_8, replace force
destring post_urssa_salg_3_8newa, replace force
destring post_urssa_salg_3_8newb, replace force
destring post_urssa_salg_3_9, replace force
destring post_urssa_salg_3_10, replace force
destring post_urssa_salg_3_11, replace force
destring post_urssa_salg_3_12, replace force
destring post_urssa_salg_3_13, replace force

# 28 items, 2 factors?
factor post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5 post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13, factors(2)

tab1 post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb, missing
* 

* 31 items.

factor post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5 post_urssa_salg_3_6 post_urssa_salg_3_7 post_urssa_salg_3_8 post_urssa_salg_3_8newa  post_urssa_salg_3_8newb post_urssa_salg_3_9 post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13, factors(1)

# alpha = 0.96, 16 items.  Left skewed
# alpha =0.97, 31 items
alpha post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5 post_urssa_salg_3_6 post_urssa_salg_3_7 post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_9 post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13

tab1 post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8, missing

tab1 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5 post_urssa_salg_3_6 post_urssa_salg_3_7 post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_9 post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13, missing

# Too many missing observations.
# Many missing Calibrating instruments needed for measurement --- 3_9
# Keeping a detailed lab notebook , Conducting observations in the lab or field
gen efficacy_gain= (post_urssa_salg1_o_1 + post_urssa_salg1_o_2 +post_urssa_salg1_o_3 + post_urssa_salg1_o_4 + post_urssa_salg1_o_5 + post_urssa_salg1_o_6 + post_urssa_salg1_o_7+ post_urssa_salg1_o_8 + post_urssa_salg2_o_1 + post_urssa_salg2_o_2 + post_urssa_salg2_o_3 + post_urssa_salg2_o_4 + post_urssa_salg2_o_5 + post_urssa_salg2_o_6 + post_urssa_salg2_o_7 + post_urssa_salg2_o_8 + post_urssa_salg_3_1 + post_urssa_salg_3_2  + post_urssa_salg_3_3 + post_urssa_salg_3_4 + post_urssa_salg_3_5 + post_urssa_salg_3_6 + post_urssa_salg_3_7 + post_urssa_salg_3_8 + post_urssa_salg_3_8newa +  post_urssa_salg_3_8newb + post_urssa_salg_3_9 + post_urssa_salg_3_10 + post_urssa_salg_3_11 + post_urssa_salg_3_12 + post_urssa_salg_3_13 -31)/31/4

# Missing data
tab1  post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5  post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13, missing

# Reduce number of items in the factor?  They all load really well.
factor  post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5  post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13, factors(1) 
rotate




# alpha =0.97, 28 items both in full data and US only data: omitting 3-6 (Keeping a detailed lab notebook, loading 0.68), 3-7 (Conducting observations in the lab or field, 0.70), 3-9 (Calibrating instruments needed for measurement, 0.66)
alpha post_urssa_salg1_o_1 post_urssa_salg1_o_2 post_urssa_salg1_o_3 post_urssa_salg1_o_4 post_urssa_salg1_o_5 post_urssa_salg1_o_6 post_urssa_salg1_o_7 post_urssa_salg1_o_8 post_urssa_salg2_o_1 post_urssa_salg2_o_2 post_urssa_salg2_o_3 post_urssa_salg2_o_4 post_urssa_salg2_o_5 post_urssa_salg2_o_6 post_urssa_salg2_o_7 post_urssa_salg2_o_8 post_urssa_salg_3_1 post_urssa_salg_3_2 post_urssa_salg_3_3 post_urssa_salg_3_4 post_urssa_salg_3_5  post_urssa_salg_3_8 post_urssa_salg_3_8newa post_urssa_salg_3_8newb post_urssa_salg_3_10 post_urssa_salg_3_11 post_urssa_salg_3_12 post_urssa_salg_3_13


gen efficacy_gain28= (post_urssa_salg1_o_1 + post_urssa_salg1_o_2 +post_urssa_salg1_o_3 + post_urssa_salg1_o_4 + post_urssa_salg1_o_5 + post_urssa_salg1_o_6 + post_urssa_salg1_o_7+ post_urssa_salg1_o_8 + post_urssa_salg2_o_1 + post_urssa_salg2_o_2 + post_urssa_salg2_o_3 + post_urssa_salg2_o_4 + post_urssa_salg2_o_5 + post_urssa_salg2_o_6 + post_urssa_salg2_o_7 + post_urssa_salg2_o_8 + post_urssa_salg_3_1 + post_urssa_salg_3_2  + post_urssa_salg_3_3 + post_urssa_salg_3_4 + post_urssa_salg_3_5 + post_urssa_salg_3_8 + post_urssa_salg_3_8newa +  post_urssa_salg_3_8newb + post_urssa_salg_3_10 + post_urssa_salg_3_11 + post_urssa_salg_3_12 + post_urssa_salg_3_13 -28)/28/4

gen efficacy_gain28p= (post_urssa_salg1_o_1 + post_urssa_salg1_o_2 +post_urssa_salg1_o_3 + post_urssa_salg1_o_4 + post_urssa_salg1_o_5 + post_urssa_salg1_o_6 + post_urssa_salg1_o_7+ post_urssa_salg1_o_8 + post_urssa_salg2_o_1 + post_urssa_salg2_o_2 + post_urssa_salg2_o_3 + post_urssa_salg2_o_4 + post_urssa_salg2_o_5 + post_urssa_salg2_o_6 + post_urssa_salg2_o_7 + post_urssa_salg2_o_8 + post_urssa_salg_3_1 + post_urssa_salg_3_2  + post_urssa_salg_3_3 + post_urssa_salg_3_4 + post_urssa_salg_3_5 + post_urssa_salg_3_8 + post_urssa_salg_3_8newa +  post_urssa_salg_3_8newb + post_urssa_salg_3_10 + post_urssa_salg_3_11 + post_urssa_salg_3_12 + post_urssa_salg_3_13 -28)
tab efficacy_gain28p
* 28 item factor uses all or nearly all items in the following variable series:
* post_urssa_salg1_o_, post_urssa_salg2_o_, post_urssa_salg_3_


tab efficacy_gain28, missing
tab efficacy_gain28 if schooltype!=2, missing

# Alpha = 0.84, 8 items, full data; 0.83 US only
* Only using post_urssa_salg_5_ variables
alpha post_urssa_salg_5_1 post_urssa_salg_5_1new post_urssa_salg_5_2 post_urssa_salg_5_3 post_urssa_salg_5_4 post_urssa_salg_5_4new post_urssa_salg_5_5 post_urssa_salg_5_6

gen post_rating=(post_urssa_salg_5_1 +post_urssa_salg_5_1new + post_urssa_salg_5_2 + post_urssa_salg_5_3 + post_urssa_salg_5_4 + post_urssa_salg_5_4new + post_urssa_salg_5_5 + post_urssa_salg_5_6 - 8)/3/8

gen overall_rating=(post_urssa_salg_5_6 -1)/3




destring post_excited_q5, force replace
destring post_collaborate_q5, force replace
destring post_challen_o, force replace
destring post_reward_o, force replace
destring post_worthit_o, force replace
destring post_hardwork_o, force replace
destring post_cocchall_c3, replace force
destring post_cocinterest_c3, replace force
destring post_cocuseful_c3, replace force
destring post_coclearn_o, replace force
destring post_accomplish_o, replace force
destring post_conresearch_o, replace force
destring post_conproject_o, replace force
destring post_useskills_o, replace force
destring post_recomm_o, replace force
destring post_intastat_o, replace force
destring post_futstat_o, replace force
destring post_usestatsch_o, replace force
destring post_usestatemp_o, replace force
destring post_workgrade_q5, replace force
destring post_askquest_q5, replace force
destring post_tryhard_q5, replace force
destring post_feedback_q5, replace force


* Not used:  post_collaborate_q5 post_challen_o post_hardwork_o    post_coclearn_o post_accomplish_o
* post_workgrade_q5 post_askquest_q5 post_tryhard_q5 post_feedback_q5
* These are below 0.6: post_cocinterest_c3 post_cocuseful_c3 post_conproject_o

factor post_excited_q5  post_reward_o post_worthit_o post_conresearch_o post_conproject_o post_useskills_o post_recomm_o post_intastat_o post_futstat_o post_usestatsch_o post_usestatemp_o post_cocinterest_c3 post_cocchall_c3 post_cocuseful_c3 , factors(1) 
rotate

* Reorder:

factor post_excited_q5 post_reward_o post_worthit_o post_conresearch_o post_conproject_o post_useskills_o post_recomm_o post_intastat_o post_futstat_o post_usestatsch_o post_usestatemp_o post_cocinterest_c3 post_cocchall_c3  post_cocuseful_c3 post_collaborate_q5 post_challen_o post_hardwork_o  post_coclearn_o post_accomplish_o  post_workgrade_q5 post_askquest_q5 post_tryhard_q5 post_feedback_q5, factors(2) 
rotate

* These items were chosen as consecutive items on page 5-



factor post_excited_q5 post_collaborate_q5 post_challen_o post_reward_o post_worthit_o post_hardwork_o post_cocchall_c3 post_cocinterest_c3 post_cocuseful_c3 post_coclearn_o post_accomplish_o post_conresearch_o post_conproject_o post_useskills_o post_recomm_o post_intastat_o post_futstat_o post_usestatsch_o post_usestatemp_o post_workgrade_q5 post_askquest_q5 post_tryhard_q5 post_feedback_q5, factors(2) 
rotate

* Three categories: factor 1, factor 2, not loaded enough.
* factor 1: post_excited_q5 post_reward_o post_worthit_o
* factor 2: 
* No factor: post_collaborate_q5 post_challen_o



* Alpha = 0.93, 13 items
* Alpha = 0.92 in newer
alpha post_excited_q5  post_reward_o  post_worthit_o  post_cocinterest_c3 post_cocuseful_c3  post_conresearch_o  post_conproject_o  post_useskills_o post_recomm_o post_intastat_o  post_futstat_o  post_usestatsch_o  post_usestatemp_o

* interest in using skills in the future. 
* Called Statistical intentions in paper: would have been 0 to 52
gen reward1= ((post_excited_q5 + post_reward_o + post_worthit_o + post_conresearch_o +  post_useskills_o + post_recomm_o + post_intastat_o + post_futstat_o + post_usestatsch_o + post_usestatemp_o-10)/4 + (post_cocinterest_c3 +post_cocuseful_c3 + post_conproject_o -3)/2)/13
tab reward1 if schooltype!=2, missing
* Poisson version 0-52
gen reward1p= (post_excited_q5 + post_reward_o + post_worthit_o + post_conresearch_o +  post_useskills_o + post_recomm_o + post_intastat_o + post_futstat_o + post_usestatsch_o + post_usestatemp_o-10) + 2*(post_cocinterest_c3 +post_cocuseful_c3 + post_conproject_o -3)


*Here's a third factor
*tab1  post_challen_o post_hardwork_o post_cocchall_c3 
* course challenging, learned a lot, accomplished, alpha = 0.6966
factor  post_challen_o post_hardwork_o post_cocchall_c3 post_coclearn_o post_accomplish_o post_tryhard_q5, factors(2)

alpha post_challen_o post_hardwork_o post_cocchall_c3 
alpha post_coclearn_o post_accomplish_o post_tryhard_q5

* Here it is.  
gen hardwork1=(post_challen_o + post_hardwork_o + post_cocchall_c3) 
gen accomplish1=( post_coclearn_o + post_accomplish_o + post_tryhard_q5)

* post_collaborate_q5  post_workgrade_q5 post_askquest_q5  post_feedback_q5


** Pre course intentions
nervous about statistics, likely to take course if not required, interest in advanced coursework, future coursework intentions, intention to use statistics in the rest of college, intention to use statistics in employment

factor pre_ltnr_o pre_intastat_o pre_futstat_o pre_usestatsch_o pre_usestatemp_o, factors(1) rotate
alpha  pre_ltnr_o pre_intastat_o pre_futstat_o pre_usestatsch_o pre_usestatemp_o

gen statintentions0 = (pre_ltnr_o +pre_intastat_o +pre_futstat_o +pre_usestatsch_o +pre_usestatemp_o-5)/4/5
tab statintentions0, missing

gen course_required_gened0=pre_preason_c ==1 
replace course_required_gened0=. if  pre_preason_c==.
replace course_required_gened0=1 if  pre_reasons_c22_1==1

gen course_required_major0=pre_preason_c ==2 
replace course_required_major0=. if pre_preason_c ==.
replace course_required_major0=1 if pre_reasons_c22_2 ==1

gen course_useful0=pre_preason_c >2 
replace course_useful0=. if pre_preason_c ==. 
replace course_useful0=1 if pre_reasons_c22_3 ==1 | pre_reasons_c22_4 ==1 | pre_reasons_c22_5 ==1 | pre_reasons_c22_6 ==1 | pre_reasons_c22_7 ==1 | pre_reasons_c22_8 ==1 | pre_reasons_c22_9 ==1 | pre_reasons_c22_10 ==1 | pre_reasons_c22_11 ==1 | pre_reasons_c22_12 ==1 | pre_reasons_c22_13 ==1 | pre_reasons_c22_14 ==1 | pre_reasons_c22_15 ==1 | pre_reasons_c22_16 ==1 


gen interest_advstat10=post_intastat_o - pre_intastat_o
gen fut_stat10=post_futstat_o - pre_futstat_o

gen exp0_urm=coding_experience0*urm
gen conf0_urm=coding_confidence0*urm

gen past_R_experience=pre_expcode_c_15==1
gen past_Stata_experience=pre_expcode_c_20==1
gen past_SAS_experience=pre_expcode_c_16==1
gen past_html_experience=pre_expcode_c_5==1
gen past_java_experience=pre_expcode_c_6==1
gen past_matlab_experience=pre_expcode_c_10==1
gen past_python_experience=pre_expcode_c_14==1
gen past_matlab_experience=pre_expcode_c_10==1
gen past_SPSS_experience=pre_exppac_c2__2==1

replace past_R_experience=. if pre_expcode_c_15==.
replace past_Stata_experience=. if pre_expcode_c_20==.
replace past_SAS_experience=. if pre_expcode_c_16==.
replace past_html_experience=. if pre_expcode_c_5==.
replace past_java_experience=. if pre_expcode_c_6==. 
replace past_matlab_experience=. if pre_expcode_c_10==.
replace past_python_experience=. if pre_expcode_c_14==.
replace past_matlab_experience=. if pre_expcode_c_10==.
replace past_SPSS_experience=. if pre_exppac_c2__2==.



* Precollege math and science: 0 for none, 1 for precollege college science or math, 2 = for both precollege math and science

tab  pre_collmath_c2 pre_collscience_c2, missing
gen coll_math_sci=0*(pre_collmath_c2==2 & pre_collscience_c2==2) + 1*(pre_collmath_c2==1 | pre_collscience_c2==1)+1*(pre_collmath_c2==1 & pre_collscience_c2==1)
replace coll_math_sci=. if pre_collmath_c2==. & pre_collscience_c2==.


pre_stat_c_1 AP high school stat
pre_stat_c_2 high school stat
pre_stat_c_3 college stat
pre_stat_c_4 first statistics course


gen apstat0=pre_stat_c_1 ==1
gen hsstat0=pre_stat_c_2 ==1
gen collstat0=pre_stat_c_3==1
gen firstcourse0=pre_stat_c_4==1
tab pre_stat_c_4, missing

tab pre_goodmath_o, missing
tab pre_goodmath_o if schooltype!=2, missing

gen math_selfefficacy0=(pre_goodmath_o -1)
tab math_selfefficacy0, missing
gen math_selfefficacy0_urm=math_selfefficacy0*urm

gen math_selfefficacy0c=(pre_goodmath_o -1)
tab math_selfefficacy0c, missing


gen R_software=software=="R"
gen SAS=software=="SAS"
gen SPSS=software=="SPSS"
gen StatCrunch=software=="StatCrunch"
gen Stata=software=="STATA"

tab  coursename software
tab  coursename software if cc==1

1. Private Liberal Arts 	449 	50.91 	449 	50.91
2. Private Business or Technical 	116 	13.15 	565 	64.06
3. Flagship State University 	91 	10.32 	656 	74.38
4. Regional City or State University 	190 	21.54 	846 	95.92
5. Community College 	36 	4.08 	882 	100.00

tab semester, missing
tab semester if schooltype!=2, missing

foreach k in 1 2 3 4 5 {
	tab coursename software if schooltype==`k'
}

foreach k in "fall2018" "fall2019" "spring2019" "summer2019" "winter2019" {
	tab coursename software if semester==`k'
}
	tab coursename software  if schooltype==1, row

foreach k in 1 2 3 4 5 {
tab coursename software if semester=="fall2019" & schooltype==`k'
}

foreach k in 1 2 3 4 5 {
tab coursename software if semester=="fall2019" & schooltype==`k'
}


foreach k in 1 2 3 4 5 {
tab coursename software if semester=="spring2019" & schooltype==`k'
}

foreach k in 1 2 3 4 5 {
tab coursename software if semester=="summer2019" & schooltype==`k'
}

foreach k in 1 2 3 4 5 {
tab coursename software if semester=="winter2019" & schooltype==`k'
}

foreach k in 1 2 3 4 5 {
tab coursename software if semester=="fall2018" & schooltype==`k'
}


gen software_code=R_software==1 | SAS==1 | Stata==1


destring pre_uscitizen_t, replace force
gen uscitizen=pre_uscitizen_t==1
gen uscitizen_missing=pre_uscitizen_t==.
replace uscitizen=. if uscitizen_missing==1
tab uscitizen, missing
tab uscitizen if schooltype!=2, missing 

gen firstgen=pre_firstgen_c2==1
replace firstgen=. if pre_firstgen_c2==.
tab firstgen, missing
tab firstgen if schooltype!=2, missing

destring pre_gender_c, force replace
gen male=pre_gender_c==1

gen freereducedlunch=pre_free_c2==1
replace freereducedlunch=. if pre_free_c2==.
tab freereducedlunch, missing
tab freereducedlunch if schooltype!=2, missing


gen progconf0=(pre_progconf_o -1)/4
gen progconf0c=(pre_progconf_o -1)


*** Post survey measures POST_1O1COC1_O

destring post_1o1coc1_o, force gen(one_on_one1) 
destring post_1o1coc1_o_a, force gen(one_on_one1a)
replace one_on_one1=0 if one_on_one1==9
replace one_on_one1a=0 if one_on_one1a==9

destring post_urssa_salg_3_8newb, force replace
replace post_urssa_salg_3_8newb=0 if post_urssa_salg_3_8newb==.

gen code_gains1=post_urssa_salg_3_8newb

factor one_on_one1 one_on_one1a post_aengage_1_q5 post_aengage_2_q5 post_aengage_3_q5 post_aengage_4_q5 post_aengage_5_q5 post_aengage_6_q5 post_aengage_7_q5 post_aengage_8_q5 post_aengage_9_q5 post_excited_q5 post_collaborate_q5 post_challen_o post_reward_o post_worthit_o post_hardwork_o post_cocchall_c3 post_cocinterest_c3 post_cocuseful_c3

* Support in course
factor post_1o1coc1_o post_1o1coc1_o_a
gen one_on_one1=post_1o1coc1_o + post_1o1coc1_o_a

gen code_gains1_progconf0=code_gains1*progconf0


tab school



gen liberalarts=schooltype==1
gen privatebusinesstech=schooltype==2
gen flagship=schooltype==3
gen regional=schooltype==4
gen cc=schooltype==5


gen hispanic=pre_ethnic_c6_1==1
gen black=pre_ethnic_c6_2==1
gen asian=pre_ethnic_c6_3==1
gen white=pre_ethnic_c6_4==1
gen pacificislander=pre_ethnic_c6_5==1
gen amerindian=pre_ethnic_c6_6==1
replace hispanic=. if schooltype==2 | pre_ethnic_c6_1==.
replace black=. if schooltype==2 | pre_ethnic_c6_2==.
replace asian=. if schooltype==2 | pre_ethnic_c6_3==.
replace white=. if schooltype==2 | pre_ethnic_c6_4==.
replace pacificislander=. if schooltype==2 | pre_ethnic_c6_5==.
replace amerindian=. if schooltype==2 | pre_ethnic_c6_6==.

gen urm=black==1 | hispanic==1 | amerindian==1 | pacificislander==1
replace urm=. if black==. | hispanic==. | amerindian==. | pacificislander==.
tab urm, missing

gen age=pre_age_q
replace age=. if pre_age_q==.
destring pre_age_q, force  replace
gen age17_22=pre_age_q>=17 & pre_age_q<=22
replace age17_22=. if pre_age_q==.
tab age18_22 pre_age_q
tab age17_22
tab age, missing
tab age if schooltype!=2, missing

tab pre_schyear_07 age17_22 , col

tab1 hispanic black asian white pacificislander amerindian
tab hispanic black
tab urm black
gen black_hispanic=black==1 | hispanic==1

*** Create table
tab semester
tab software
tab urm
tab uscitizen, missing
tab1 rsch_exp0 progconf0 math_selfefficacy0 urm male firstgen freereducedlunch firstcourse0  SAS SPSS StatCrunch code_gains1 school
tab pre_major
tab1  apstat0 hsstat0  collstat0

tab school SAS
tab school R
tab school SPSS
tab school Stata
tab school StatCrunch
tab software if school=="Wesleyan University"
summ age

tab coding_confidence0 math_confidence0, chi2

** 
gen SAS_Stata_R=SAS==1 | Stata==1 | R_software==1
