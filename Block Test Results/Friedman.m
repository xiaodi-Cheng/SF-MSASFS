clc
clear
% 
% a = load('F1-F7_50-1000.mat')
% SFMSASFS_50_mean = a.f_mean;
% SFMSASFS_50_std = a.f_std;
% SFMSASFS_50_min = a.f_min;
% 
% b = load('F1-F7-50_firstupdate_m3_1000.mat')
% SFMSASFS_m3_50_mean = b.f_mean;
% SFMSASFS_m3_50_std = b.f_std;
% SFMSASFS_m3_50_min = b.f_min;
% A_mean = [SFMSASFS_50_mean;SFMSASFS_m3_50_mean];
% A_std = [SFMSASFS_50_std;SFMSASFS_m3_50_std];
% A_min = [SFMSASFS_50_min;SFMSASFS_m3_50_min];
% 
% [p_1,tbl_1,stats_1]= friedman(A_mean');
%  rank_1=stats_1.meanranks';
%  [p_2,tbl_2,stats_2]= friedman(A_std');
%  rank_2=stats_2.meanranks';
%  [p_3,tbl_3,stats_3]= friedman(A_min');
%  rank_3=stats_3.meanranks';
%  
%  %%
%  a100 = load('F1-F7_100-1000.mat')
% SFMSASFS_100_mean = a100.f_mean;
% SFMSASFS_100_std = a100.f_std;
% SFMSASFS_100_min = a100.f_min;
% 
% b100 = load('F1-F7-100_firstupdate_m3_1000.mat')
% SFMSASFS_m3_100_mean = b100.f_mean;
% SFMSASFS_m3_100_std = b100.f_std;
% SFMSASFS_m3_100_min = b100.f_min;
% A100_mean = [SFMSASFS_100_mean;SFMSASFS_m3_100_mean];
% A100_std = [SFMSASFS_100_std;SFMSASFS_m3_100_std];
% A100_min = [SFMSASFS_100_min;SFMSASFS_m3_100_min];
% 
% [p_4,tbl_4,stats_4]= friedman(A100_mean');
%  rank_4=stats_4.meanranks';
%  [p_5,tbl_5,stats_5]= friedman(A100_std');
%  rank_5=stats_5.meanranks';
%  [p_6,tbl_6,stats_6]= friedman(A100_min');
%  rank_6=stats_6.meanranks';
%  
  %%
 a200 = load('F1-F7_200-1000.mat')
SFMSASFS_200_mean = a200.f_mean;
SFMSASFS_200_std = a200.f_std;
SFMSASFS_200_min = a200.f_min;

b200 = load('F1-F7-200_diffusion_g_1000.mat')
SFMSASFS_m3_200_mean = b200.f_mean;
SFMSASFS_m3_200_std = b200.f_std;
SFMSASFS_m3_200_min = b200.f_min;
A200_mean = [SFMSASFS_200_mean;SFMSASFS_m3_200_mean];
A200_std = [SFMSASFS_200_std;SFMSASFS_m3_200_std];
A200_min = [SFMSASFS_200_min;SFMSASFS_m3_200_min];

[p_7,tbl_7,stats_7]= friedman(A200_mean');
 rank_7=stats_7.meanranks';
 [p_8,tbl_8,stats_8]= friedman(A200_std');
 rank_8=stats_8.meanranks';
 [p_9,tbl_9,stats_9]= friedman(A200_min');
 rank_9=stats_9.meanranks';

