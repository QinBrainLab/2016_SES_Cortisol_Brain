clc;
clear;

load('/brain/iCAN_admin/home/tianting/script/seed_whole_brain/get_roivalue_after_whole_brain_fc/50database.mat');

%%%% ROI %%%%%%    
  mask=strcat('/brain/iCAN_admin/home/tianting/script/lcmvmpfc.img');
%it can be nii or img, you can use mriclone to convert img into nii file.
     
    vol_mask=spm_vol(mask);
    array_mask=spm_read_vols(vol_mask);
    
    for i=1:50
        out_f=strcat('/brain/iCAN_admin/home/tianting/result/seed_wholebrain_rs/par_amy/par_cm_bl/',Database{i});
        cd(out_f);

 trial=strcat(out_f,'/fmri/resting_state/ROI_L_Amygdala_CM_MNI_bin/stats_spm12/','spmT_0001','.nii');
            vol_trial=spm_vol(trial);
            array_trial=spm_read_vols(vol_trial);
            PL_hipvalue{1,i}=array_trial(find(array_mask(:)==1));           
    end


 
