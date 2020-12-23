clear;clc;
load('/home/qinlab/data/userdata/tianting/CPSWU_script/Preparation_for_preprocessing/code/database.mat');
rawpath='/home/qinlab/data/userdata/tianting/Nifit/Nifit2nd/';
datapath='/home/qinlab/data/userdata/tianting/Preprocessed/Preprocessed2nd/2017/';
cd(rawpath);
files=dir('Children*');
filenames={files.name};

   for i=filenames(1,[11]); % participants
      cd(i{:});
     % subid=regexp(i,'0\d+','match','once');
     for ii=1:length(database(:,1))
         
      subid(ii)=ismember(database{ii,1},i(1,1))
     end
      %index=find(ismember(database(:,1),subid));
      file_id=database{subid,2};
      
      S2path1=strcat(datapath,file_id,'/fmri/RS/unnormalized/');
      S2path2=strcat(datapath,file_id,'/fmri/EM/unnormalized/');
      
     disp('==================================================================');
     fprintf('converting %s',i{:});
       mkdir(S2path1);
       mkdir(S2path2); 
     
    REST='*_rest_*.nii';
    S2outpath1=strcat(S2path1,'I.nii');
    unix(sprintf('fslroi %s %s 5 175',REST,S2outpath1));
     
    EM='*_emotion_*.nii';
    S2outpath4=strcat(S2path2,'I.nii');
    unix(sprintf('fslroi %s %s 4 175',EM,S2outpath4)); 
     
   cd('../');
   end

    
    