clc
clear
warning('off');
ttttt=clock;
format long;
format compact;
func_num=1;

% Paper: “Multi-Surrogate-Assisted Stochastic Fractal Search Based on Scale-free Network for High-Dimensional Expensive Optimization”
%the main execution file

addpath('E:\论文相关\SF_MSASFS\SF-MSASFS最终上传代码文件\test function matlab files')%Set Corresponding Path
pop_size=40;
dim=50; 
Max_FES = 1000;

runs =10;
Maximum_Diffusion = 3;   % maximum considered number of diffusion for SFS
flag='cubic';
index = 1;
alpha = 0.1;
RBF_NUM = [];
% BA Settings 
Mp=10;  %Initial Number of Nodes in Scale-Free Network
K=5; %New nodes in the scale-free network connect to K nodes in the network.


for i=1:7
    %run
    func_num=i;
    lu=boundary(func_num,dim);  
    lb=lu(1,:);
    ub=lu(2,:);
    X_Label = [];  
    Y_Label = [];

    
    for j=1:runs
        disp(['Function ' num2str(i) ', Number of Runs: ' num2str(j)]);
        [ gbest,gbestval,Convergence_curve1,g,x_label,y_label,time_delay,FES ] = SFS_rbf( pop_size,Max_FES,lb,ub,dim ,Maximum_Diffusion,func_num,flag,...
  Mp,K);
        xbest(j,:)=gbest;
        fbest(i,j)=gbestval;
        G(j)=g; 
        X_Label = [X_Label; x_label] ; 
        Y_Label = [Y_Label; y_label] ; 
        disp([' Optimal Solution: ' num2str(gbestval)]);
     
    end
    G_run(i) = mean(G);
    X_Label_min(i,:) = min(X_Label);
    Y_Label_min(i,:) = min(Y_Label);
   
    figure  
    if i==5
        plot(X_Label_min(i,:),Y_Label_min(i,:),'-' ) 
    else
         set(gca,'yscale','log');
         plot(X_Label_min(i,:),log(Y_Label_min(i,:)),'-' )
    end
    f_mean(i)=mean(fbest(i,:));
    f_std(i)=std(fbest(i,:));
    f_min(i) = min(fbest(i,:));
end
X_Label_min=X_Label_min';
Y_Label_min=Y_Label_min';
eeeee=etime(clock,ttttt)

