clear all; close all; clc;
PL = load('F:\EM_brain\FC_value\FC_value\50common\em_lcm_dlpfc_fc.mat');%
PL = struct2cell(PL);
% for mat files that are not deleted NA values.
for i=1:50
    PL_neg=PL{1,1}{1,i}(:,1);
    FC(i,1)=mean(PL_neg);
end