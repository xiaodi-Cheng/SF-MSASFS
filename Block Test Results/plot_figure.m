figure
% x1 = X;
% y1 = F1_M3;
% 
% index_list = 1:8:length(x1);
% plot(x1(index_list),log(y1(index_list)),'k-','linewidth',1)
% hold on
% y2 = F1_SAMSASFS;
% plot(x1(index_list),log(y2(index_list)),'r-*','linewidth',1)
% 
% xlabel('No. of Exact Fitness Evaluation (F1)')
% ylabel('Min Fitness values (log)')
% %ylabel('Min Fitness values ')
% % legend('SACOSO','GSGA','SAMSO','MSODE','SAMPSO','SFS','MSASFS')
% legend('SF-MSASFS-m3','SF-MSASFS')

%%
x1 = X;
y1 = F6_G;
index_list = 1:4:length(x1);
plot(x1(index_list),log(y1(index_list)),'k-','linewidth',1)

hold on
y2 = F6_M3;
plot(x1(index_list),log(y2(index_list)),'g-^','linewidth',1)

hold on
y3 = F6_RBF;
plot(x1(index_list),log(y3(index_list)),'m-x','linewidth',1)

hold on
y4 = F6_SAMSASFS;
plot(x1(index_list),log(y4(index_list)),'r-*','linewidth',1)

xlabel('No. of Exact Fitness Evaluation (F6)')
ylabel('Min Fitness values (log)')
%ylabel('Min Fitness values ')
% legend('SACOSO','GSGA','SAMSO','MSODE','SAMPSO','SFS','MSASFS')
legend('SF-MSASFS-G','SF-MSASFS-M3','SF-MSASFS-RBF','SF-MSASFS')