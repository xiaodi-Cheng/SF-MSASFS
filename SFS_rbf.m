function [ pbest,fbest,Convergence_curve,g,x_label,y_label,time_delay,FES] = SFS_rbf( SearchAgents_no,Max_FES,lb,ub,dim ,Maximum_Diffusion,func_num,flag,Mp,K)

% The file encompasses the main steps of the algorithm, corresponding to Algorithm 1 in the paper.

%Creating random points in considered search space=========================
positions = repmat(lb,SearchAgents_no,1) + lhsdesign(SearchAgents_no,dim).*...
repmat(ub-lb,SearchAgents_no,1); 
x_label = [];y_label = [];%"Store FES values and their corresponding optimal values for subsequent plotting."

%==========================================================================
%Calculating the fitness of first created points=========================== 
FirstFit= benchmark_func(positions,func_num); %Calculate the fitness value
FES = size(positions,1);
[Fitness, Indecis] = sort(FirstFit); %Sorting fitness values
positions = positions(Indecis,:);%sorting the points based on obtaind result
data_set_x = positions ; 
data_set_y = Fitness ; 
%==========================================================================
%Finding the Best point in the group=======================================
    pbest=positions(1, :);
    dataset_pbest(1,:) = pbest;
    fbest = Fitness(1);%saving the first best fitness%
    Convergence_curve(1)=fbest;
    [ x_label,y_label ] = Get_Points( FES,fbest,x_label,y_label );
    
%==========================================================================
%% Establish a scale-free network

%Starting Optimizer========================================================
RA = 0; %Indicate whether the updating formula is changed in the first update stage.
R=ones(1,3);
g=2;
T_fail = 0;
time_delay=0;
while FES <= Max_FES  
    old_population = positions;
    Ba=ScaleFree(SearchAgents_no,Mp,K);
      
    %======================================================================
%% diffusion process occurs for all points in the group
    [ positions,Fitness,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest,time_delay ] = Diffusion( positions,Fitness,Maximum_Diffusion,pbest,fbest,...
                                     FES,lb,ub,func_num,data_set_x,data_set_y ,flag,x_label,y_label,dataset_pbest,time_delay,Max_FES);

    dataset_pbest =[dataset_pbest; pbest];

%% Starting The First Updating Process====================================
    [positions ,Fitness,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest,R ] = Update_first_1(positions,Fitness,pbest,fbest,...
                                   SearchAgents_no,lb,ub,func_num,FES,data_set_x,data_set_y,flag,x_label,y_label,Mp,K,Ba, dataset_pbest,R ); 
       
%% Starting The Second Updating Process==================================
     [positions,FitVector,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest] = Update_second_GP_LCB(SearchAgents_no,pbest,fbest,lb,ub,func_num,FES,...
       data_set_x,data_set_y,x_label,y_label,dataset_pbest );
    dataset_pbest =[dataset_pbest; pbest];
   
  
                   
%% Record the optimal solution
    [BestFit,ind]= min(Fitness);
    BestPoint = positions(ind,:);
    Convergence_curve(g)=fbest;
    if Convergence_curve(g) == Convergence_curve(g-1)
        T_fail = T_fail+1;
    end

    g=g+1;
end

 