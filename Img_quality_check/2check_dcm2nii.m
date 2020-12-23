clear;clc;
rawpath='/home/qinlab/data/userdata/tianting/Nifiti/nifitidata';
cd(rawpath);
files=dir('Children*');
filenames={files.name};
 
 m=1;
  for    i=filenames(1,58)
     cd(i{:});
     b1=unix(sprintf('ls *emotion*.nii.gz'));
     b2=unix(sprintf('ls *_rest_*.nii.gz'));
     
     run2_check(m,1:2)=[b1,b2];
     m=m+1;
     cd('../');
 end
 