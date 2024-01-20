clc
clear

a = load('ND=2.mat')
SFMSASFS_100_2_mean = a.f_mean;
SFMSASFS_100_2_std = a.f_std;
SFMSASFS_100_2_min = a.f_min;

b = load('ND=3.mat')
SFMSASFS_100_3_mean = b.f_mean;
SFMSASFS_100_3_std = b.f_std;
SFMSASFS_100_3_min = b.f_min;

c = load('ND=4.mat')
SFMSASFS_100_4_mean = c.f_mean;
SFMSASFS_100_4_std = c.f_std;
SFMSASFS_100_4_min = c.f_min;

d = load('ND=5.mat')
SFMSASFS_100_5_mean = d.f_mean;
SFMSASFS_100_5_std = d.f_std;
SFMSASFS_100_5_min = d.f_min;

e = load('ND=6.mat')
SFMSASFS_100_6_mean = e.f_mean;
SFMSASFS_100_6_std = e.f_std;
SFMSASFS_100_6_min = e.f_min;

f = load('ND=7.mat')
SFMSASFS_100_7_mean = f.f_mean;
SFMSASFS_100_7_std = f.f_std;
SFMSASFS_100_7_min = f.f_min;

g = load('ND=8.mat')
SFMSASFS_100_8_mean = g.f_mean;
SFMSASFS_100_8_std = g.f_std;
SFMSASFS_100_8_min = g.f_min;
A_mean = [SFMSASFS_100_2_mean;SFMSASFS_100_3_mean;SFMSASFS_100_4_mean;SFMSASFS_100_5_mean;SFMSASFS_100_6_mean;SFMSASFS_100_7_mean;SFMSASFS_100_8_mean];
A_std = [SFMSASFS_100_2_std;SFMSASFS_100_3_std;SFMSASFS_100_4_std;SFMSASFS_100_5_std;SFMSASFS_100_6_std;SFMSASFS_100_7_std;SFMSASFS_100_8_std];
A_min = [SFMSASFS_100_2_min;SFMSASFS_100_3_min;SFMSASFS_100_4_min;SFMSASFS_100_5_min;SFMSASFS_100_6_min;SFMSASFS_100_7_min;SFMSASFS_100_8_min];

[p_1,tbl_1,stats_1]= friedman(A_mean');
 rank_1=stats_1.meanranks';
 [p_2,tbl_2,stats_2]= friedman(A_std');
 rank_2=stats_2.meanranks';
 [p_3,tbl_3,stats_3]= friedman(A_min');
 rank_3=stats_3.meanranks';


