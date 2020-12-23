clear
restoredefaultpath;
clear classes
addpath(genpath('F:/toolbox/spm12'));
% -----------------------------------------------------------------------
datadir1 = 'J:/tt/seed_wholebrain_rs/par_amy/par_cm_bl/';  
datadir2 = '/fmri/resting_state/ROI_L_Amygdala_CM_MNI_bin/stats_spm12/';
[~,subid,~] = xlsread('F:/REST/2nd_spm_code/example_data.csv',1,'A:A'); 
[CAR,~,~]   = xlsread('F:/REST/2nd_spm_code/example_data.csv',1,'D:D');
[SEX,~,~]   = xlsread('F:/REST/2nd_spm_code/example_data.csv',1,'B:B');
[AGE,~,~]   = xlsread('F:/REST/2nd_spm_code/example_data.csv',1,'C:C');
subid=subid'
datadir = 'F:/REST/datacon000/lcm/'% the path keeps all con files
cd(datadir)
for i = 1:50                    
    yearfolder = ['20' subid{i}(1:2)];
    c1{i,1} = fullfile(datadir1, yearfolder, subid{i}, datadir2, ['con_0001','_',subid{i},'.nii',1]);   % rs
end

c1{i,1} = fullfile(datadir,['con_0001_*',subid,'.nii',1]); 

% -------------------GroupStats-------------------
spm_jobman('initcfg');
clear matlabbatch;
%variates
matlabbatch{1}.spm.stats.factorial_design.dir = {'F:/REST/result/PPI/lcm/'};
matlabbatch{1}.spm.stats.factorial_design.des.mreg.scans = c1;
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.c = CAR;
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.cname = 'CAR';
matlabbatch{1}.spm.stats.factorial_design.des.mreg.mcov.iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.des.mreg.incint = 1;
%covariates1
matlabbatch{1}.spm.stats.factorial_design.cov(1).c = SEX;
matlabbatch{1}.spm.stats.factorial_design.cov(1).cname = 'SEX';
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCC = 1;
%covariates2
matlabbatch{1}.spm.stats.factorial_design.cov(2).c = AGE;
matlabbatch{1}.spm.stats.factorial_design.cov(2).cname = 'AGE';
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCC = 1;
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
%2nd level estimation
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run',matlabbatch);