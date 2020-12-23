clc;
clear;

load('/brain/iCAN_admin/home/tianting/script/seed_whole_brain/get_roivalue_after_whole_brain_fc/50database.mat');

%%%% ROI %%%%%%    
  mask=strcat('/brain/iCAN_admin/home/tianting/script/em_lcm_dlpfc.img');
%it can be nii or img, you can use mriclone to convert img into nii file.
     
    vol_mask=spm_vol(mask);
    array_mask=spm_read_vols(vol_mask);
    
    for i=1:50
        out_f=strcat('/brain/iCAN_admin/home/tianting/firstlevel/firstlevel_ses/2016/',Database{i});
        cd(out_f);
%         for k=1:2
            %k means the number of condition;for rest there is only one condition;
%             trial=strcat(out_f,'/fmri/stats_spm8/PL_emotion_2s/stats_spm8_swcar/','spmT_000',num2str(k),'.nii');

 %trial=strcat(out_f,'/fmri/stats_spm12/EM/stats_spm8_swcar_gPPI/PPI_ROI_L_Amygdala_CM_MNI/','spmT_PPI_emovscon_',Database{i,1},'.img');
   trial=strcat(out_f,'/fmri/stats_spm12/EM/stats_spm8_swcar/','spmT_0003.nii');

            vol_trial=spm_vol(trial);
            array_trial=spm_read_vols(vol_trial);
            PL_hipvalue{1,i}=array_trial(find(array_mask(:)==1));
              
    end
    
 
