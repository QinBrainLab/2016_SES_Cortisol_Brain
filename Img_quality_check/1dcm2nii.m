clear;clc;
%rawpath='/lustre/iCAN/backup/CBDP/raw_data/raw_data_new';
rawpath='/brain/iCAN/home/tianting/rawdata/';
cd(rawpath);
files=dir('Children*');
filenames={files.name};
 for i=filenames(1,[1])
 %for i=filenames(1,83:85)
 
     outpath=strcat('/brain/iCAN/home/tianting/Nifit/Nifiti1st/1/',i{:});
     mkdir(outpath)
     unix(sprintf('dcm2niix -x y -z n -o %s %s',outpath,i{:})); 
       % unix(sprintf('dcm2niix -n -g %s',i{:}));
 end