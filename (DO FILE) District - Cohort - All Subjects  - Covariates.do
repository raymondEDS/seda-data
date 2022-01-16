**FILE 1: DISTRICT COVARIATES
use "/Users/lacm/Documents/Stanford/EDS Seminar/EDS Group Project/Data/SEDA/District Level/(COVARIATES) District - Pooled - Cohort.dta"
rename sedalea lea_id
rename gslo min_grade
rename gshi max_grade
rename sedaleaname lea_name
rename stateabb state
rename avgrdall avg_grade_enrollment
rename totenrl total_enrollment
rename perasn percent_asian
rename perblk percent_black
rename perecd percent_ecd
rename perfl percent_fl
rename perfrl percent_frl
rename perhsp percent_hispanic
rename pernam percent_native_american
rename perrl percent_rl
rename perwht percent_white
rename perell percent_ell
rename perspeced percent_sped
rename urban percent_urban
rename suburb percent_suburb
rename town percent_town
rename rural percent_rural
rename locale_city_large percent_city_large
rename locale_city_midsize percent_city_midsize
rename locale_city_small percent_city_small
rename locale_suburb_large percent_suburb_large
rename locale_suburb_midsize percent_suburb_midsize
rename locale_suburb_small percent_suburb_small
rename locale_town_fringe percent_town_fringe
rename locale_town_distant percent_town_distant
rename locale_town_remote percent_town_remote
rename locale_rural_fringe percent_rural_fringe
rename locale_rural_distant percent_rural_distant
rename locale_rural_remote percent_rural_remote

rename single_momavgwht singlemom__rate_white_bayes
rename povertyavgwht poverty_rate_white_bayes
rename snapavgwht snap_rate_white_bayes
rename unempavgwht unemployment_rate_white_bayes
rename baplusavgwht baplus_rate_white_bayes
rename lninc50avgwht log_median_income_white_bayes

rename single_momavghsp singlemom_rate_hsp_bayes
rename povertyavghsp poverty_rate_hsp_bayes
rename snapavghsp snap_rate_hsp_bayes
rename unempavghsp unemployment_rate_hsp_bayes
rename baplusavghsp baplus_rate_hsp_bayes
rename lninc50avghsp log_median_income_hsp_bayes

rename single_momavgblk singlemom_rate_black_bayes
rename povertyavgblk poverty_rate_black_bayes
rename snapavgblk snap_rate_black_bayes
rename unempavgblk unemployment_rate_black_bayes
rename baplusavgblk baplus_rate_black_bayes
rename lninc50avgblk log_median_income_black_bayes

rename single_momavgall singlemom_rate_all_bayes
rename povertyavgall poverty_rate_all_bayes
rename snapavgall snap_rate_all_bayes
rename unempavgall unemployment_rate_all_bayes
rename baplusavgall baplus_rate_all_bayes
rename lninc50avgall log_median_income_all_bayes

rename sesavgwhthsp ses_gap_white_hsp_bayes
rename sesavgwhtblk ses_gap_white_black_bayes
rename sesavgwht ses_white_bayes
rename sesavghsp ses_hsp_bayes
rename sesavgblk ses_black_bayes
rename sesavgall ses_all_bayes


drop diffexpecd_namwht  diffexpecd_asnwht diffexpmin2_namwht diffexpmin2_asnwht sesavgasn sesavgnam lninc50avgasn baplusavgasn unempavgasn snapavgasn povertyavgasn single_momavgasn sesavgwhtnam sesavgwhtasn single_momavgnam povertyavgnam snapavgnam unempavgnam baplusavgnam lninc50avgnam

tempfile covariates
save `covariates'
clear

**FILE 2: NO SUBJECTS (COHORT, DISTRICT)

use "/Users/lacm/Documents/Stanford/EDS Seminar/EDS Group Project/Data/SEDA/District Level/District - Pooled - Cohort.dta"

rename sedalea lea_id
rename tot_asmts total_math_reading_tests
drop if subcat =="gender" | subgroup =="mtr" | subgroup =="nam" | subgroup == "asn" | subgroup =="wag" | subgroup =="wmg" | subgroup =="wng"
replace subgroup = "black" if subgroup =="blk"
replace subgroup = "hispanic" if subgroup =="hsp"
replace subgroup = "non_ecd" if subgroup =="nec"
replace subgroup ="white" if subgroup =="wht"
replace subgroup ="white_hispanic_gap" if subgroup =="whg"
replace subgroup ="ecd_non_ecd_gap" if subgroup =="neg"
replace subgroup ="white_black_gap" if subgroup =="wbg"

//learning rates, all subjects
rename cs_mn_grd_ol lr_all_ols
rename  cs_mn_grd_ol_se lr_se_all_ols

rename  cs_mn_grd_eb lr_all_bayes
rename  cs_mn_grd_eb_se lr_se_all_bayes

//achievement scores, all subjects
rename cs_mn_avg_ol achievement_all_ols
rename cs_mn_avg_ol_se achievement_se_all_ols

rename cs_mn_avg_eb achievement_all_bayes
rename cs_mn_avg_eb_se achievement_se_all_bayes

drop cs_mn_coh_ol cs_mn_coh_ol_se cs_mn_coh_eb cs_mn_coh_eb_se sedaleaname cs_mn_mth_ol_se cs_mn_mth_ol cs_mn_mth_eb_se cs_mn_mth_eb fips stateabb subcat gradecenter gap cellcount mn_asmts

tempfile districts_no_subjects
save `districts_no_subjects'
clear

**FILE 3: MATH AND ENGLISH SUBJECTS (COHORT, DISTRICT)

use "/Users/lacm/Documents/Stanford/EDS Seminar/EDS Group Project/Data/SEDA/District Level/District - Pooled - Cohort - Subjects.dta"
rename sedaleaname lea_name
rename sedalea lea_id
rename stateabb state
drop if subcat =="gender" | subgroup =="mtr" | subgroup =="nam" | subgroup == "asn" | subgroup =="wag" | subgroup =="wmg" | subgroup =="wng"
replace subgroup = "black" if subgroup =="blk"
replace subgroup = "hispanic" if subgroup =="hsp"
replace subgroup = "non_ecd" if subgroup =="nec"
replace subgroup ="white" if subgroup =="wht"
replace subgroup ="white_hispanic_gap" if subgroup =="whg"
replace subgroup ="ecd_non_ecd_gap" if subgroup =="neg"
replace subgroup ="white_black_gap" if subgroup =="wbg"

//raw test counts
rename tot_asmts_mth total_math_tests
rename tot_asmts_rla total_english_tests

//learning rates, math
rename  cs_mn_grd_mth_ol lr_math_ols
rename  cs_mn_grd_mth_ol_se lr_se_math_ols

rename  cs_mn_grd_mth_eb lr_math_bayes
rename  cs_mn_grd_mth_eb_se lr_se_math_bayes

//learning rates, english
rename  cs_mn_grd_rla_ol lr_english_ols
rename  cs_mn_grd_rla_ol_se lr_se_english_ols

rename  cs_mn_grd_rla_eb lr_english_bayes
rename  cs_mn_grd_rla_eb_se lr_se_english_bayes

//achievement scores, math

rename cs_mn_avg_mth_ol achievement_math_ols
rename cs_mn_avg_mth_ol_se achievement_se_math_ols

rename cs_mn_avg_mth_eb achievement_math_bayes
rename cs_mn_avg_mth_eb_se achievement_se_math_bayes

//achievement scores, english_average_score_bayes

rename cs_mn_avg_rla_ol achievement_english_ols
rename cs_mn_avg_rla_ol_se achievement_se_english_ols

rename cs_mn_avg_rla_eb achievement_english_bayes
rename cs_mn_avg_rla_eb_se achievement_se_english_bayes

drop cs_mn_coh_rla_eb_se cs_mn_coh_rla_eb cs_mn_coh_rla_ol_se cs_mn_coh_rla_ol cs_mn_coh_mth_eb_se cs_mn_coh_mth_eb cs_mn_coh_mth_ol_se cs_mn_coh_mth_ol gap mn_asmts_mth mn_asmts_rla subcat

**merging two files
merge 1:1 lea_id subgroup using `districts_no_subjects'
drop _merge


**merging covariates with covariate data
merge m:1 lea_id using `covariates'
drop if _merge == 2
drop _merge

