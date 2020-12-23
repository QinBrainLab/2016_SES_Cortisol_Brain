# 2016_SES_Cortisol_Brain
## Checklist for Data Analysis Conducted in The Manuscript
Lead author(s): Ting Tian

Created by Ting Tian on May, 2020; Updated by May 14, 2020; Updated by Dec 23, 2020.



## Manuscript path: 
#### Folder: /home/tianting/2016_SES_cortsiol_brain
Cover letter: 1

Main texts: 1

Figures_Legends: 1

Supplement: 1



## Behavioral data


### Behavioral data (outside scanner)
#### Link to the directory: 
/home/tianting/2016_SES_cortsiol_brain/behavioral_data
#### Scripts: 
/home/tianting/2016_SES_cortsiol_brain/behavioral_data/
###### Strategy assessment data: 
>>>бн/behavioral_data / study1.xlsx

>>>бн/behavioral_data / study2.csv
#### Texts in the MS: 2nd & 3rd paragraph in the Methods
#### Figures in the MS: Figure 1; Supplemental Figure 1



## fMRI data quality check and analysis


### Seed-based whole-brain functional connectivity from resting-state fMRI 
#### Link to the directory: 
/home/tianting/2016_SES_cortsiol_brain/seed_based_whole_brain_connectivity_RS
#### Data quality check: 
бн/2016_SES_Cortisol_Brain/Img_quality_check/example_data/MovementStats_RS.txt

бн/behavior_brain/example_data.csv
#### Core scripts & subject list:
бн/seed_based_FC/fconnect_wm_csf_nogs_final.m

бн/seed_based_FC/fconnect_wm_csf_nogs_final_config.m

бн/seed_based_FC/database.mat
#### Preprocessing
бн/2016_SES_cortsiol_brain/preprocess_fmri_RS_EM/Preproc_spm12.m

бн/preprocess_fmri_RS_EM/Dependence/MoveExclu_spm12_Hao.m
#### Individual stats: 
###### Contrast:
>>>бн/seed_based_FC/Contrastbehavior_brain/contrast.mat
###### Group:
>>>бн/behavior_brain/Groupstats_multiple_regression_rsFC.m
#### Texts in the MS: 9th paragraph in the Methods
#### Figures in the MS: Figure 2, plotted by using MRIcron and MRIcroGL



### Brain activation from blocked-design task-evoked fMRI
#### Link to the directory: 
/home/tianting/2016_SES_Cortisol_Brain/univar_activ_EM
#### Data quality check: 
бн/2016_SES_Cortisol_Brain/Img_quality_check/example_data/MovementStats_EM.txt

бн/Group/example_data.csv
#### Core scripts & subject list:
бн/individualstats_EM/Config_Indistats_EM.m

бн/individualstats_EM/IndivStats_EM.m

бн/individualstats_EM/sublist.txt
#### Preprocessing 
бн/2016_SES_cortsiol_brain/preprocess_fmri_RS_EM/Preproc_spm12.m

бн/preprocess_fmri_RS_EM/Dependence/MoveExclu_spm12_Hao.m
#### Individual stats: 
###### Contrast:
>>>бн/individualstats_EM/Contrast/contrasts_EM_XJH.mat
###### Group:
>>>бн/behavior_brainGroup/Groupstats_multiple_regression_gPPI.m
#### Texts in the MS: 11th paragraph in the Methods & Materials
#### Figures in the MS: Figure 3, plotted by MRIcroGL.



### gPPI analysis from task-evoked fMRI 
#### Link to the directory: 
/home/tianting/2016_SES_Cortisol_Brain/gPPI_EM
#### Data quality check: 
бн/2016_SES_Cortisol_Brain/Img_quality_check/example_data/MovementStats_EM.txt

бн/behavior_brain/example_data.csv
#### Core scripts & subject list:
бн/gPPI/EM_gPPI_config.m

бн/gPPI/EM_gPPI.m

бн/gPPI/sublist.txt
#### Preprocessing 
бн/2016_SES_cortsiol_brain/preprocess_fmri_RS_EM/Preproc_spm12.m

бн/preprocess_fmri_RS_EM/Dependence/MoveExclu_spm12_Hao.m
#### Individual stats: 
бн/behavior_brain/Groupstats_multiple_regression_gPPI.m
#### Texts in the MS: 10th paragraph in the Methods & Materials
#### Figures in the MS: Figure 4, plotted by MRIcron and MRIcroGL.



### Structural Equation Model
#### Models conudcted by: 
PROCESS v2.16.3 (Mediation package based on SPSS) 
#### Comparing the indirect effects of two models condcuted by: 
Mplus version 7
#### Link to the directory: 
/home/tianting/2016_SES_Cortisol_Brain/SEM
#### Example data: 
бн/example_data.csv

бн/example_data.sav
#### Analysis and Example results: 
бн/ example_results.doc



## Multiple correction method


### The AFNI Monte Carlo Simulation method was implemented to conduct the multiple correction.

#### 3dFWHMx -mask mask.nii -detrend -input res_map.nii -acf
#### 3dClustSim -mask mask.nii -acf 0.470 4.63 15.11 -pthr 0.005 0.001 

### FDR correction conducted to correct for the number of ROIs.

#### data<-c(0.000306,0.000433,0.000536,0.000783)
#### p.adjust(data,method="fdr",n=length(data))

