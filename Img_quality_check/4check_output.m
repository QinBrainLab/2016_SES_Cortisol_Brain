rawpath='/lustre/iCAN/backup/CBDP/raw_data/raw_data_new';
datapath='/lustre/iCAN/data/2016/';
load('database.mat')

cd(rawpath);
files=dir('SWU*');
filenames={files.name};
for i= filenames(1,1:2:100)
%     cd(i{:});
    subid=regexp(i,'0\d+','match','once');
    index=find(ismember(database(:,1),subid));
    file_id=database{index,2};
    S2path1=strcat(datapath,file_id,'/fmri/REST/unnormalized/I.nii.gz');
    S2path2=strcat(datapath,file_id,'/fmri/EM/unnormalized/I.nii.gz');
    
    disp('==================================================================');
    fprintf('checking %s',file_id);

    unix(sprintf('fslinfo %s',S2path1))
    unix(sprintf('fslinfo %s',S2path2))

end