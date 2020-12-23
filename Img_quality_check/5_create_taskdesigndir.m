subname={'16-07-25.1SWUC'};

rtdir='/home/qinlab/data/userdata/tianting/Preprocessed/Preprocessed2nd/';
for i=1:length(subname)
    subdir=fullfile(rtdir,subname(1,i),'fmri','EM','taskdesign');
    mkdir(subdir{1,1})
    
end