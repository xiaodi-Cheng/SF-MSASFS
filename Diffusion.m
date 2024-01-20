function [ New_Point,FitVector,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest,time_delay] = Diffusion( positions,SortedFit,Maximum_Diffusion,pbest,fbest,...
                                    FES,lb,ub,func_num,data_set_x,data_set_y,flag,x_label,y_label,dataset_pbest,time_delay,Max_FES )
                                
%The file details the specific steps of the RBF-Based diffusion process, corresponding to Algorithm 2 in the paper.
%g:Current iteration count
%positions£ºCurrent position £»SortedFit£ºFitness value corresponding to the current position£»Maximum_Diffusion£ºNumber of diffusions
%pbest£ºHistorical best position£»fbest£ºFitness value corresponding to the best position £»
%FES£ºCurrent fitness evaluation count

[SortedFit,sort_index] = sort(SortedFit);
positions = positions(sort_index,:);
New_Point = [];%creating new point
FitVector = [];%creating vector of fitness functions
[pop_size,D] =size(positions);

    
%diffusion process occurs for all points in the group
for i = 1 : size(positions,1)
    %creating new points based on diffusion process
    NumDiffiusion = Maximum_Diffusion;
    %New_Positions = positions(i,:);
    New_Positions =[];
    %Train the surrogate model using points near the optimal point
    [dataset_x,dataset_y] = select_dataset(data_set_x,data_set_y,pop_size);
    [lambda,gamma1,params]=RBF(dataset_x,dataset_y,flag);  


%Diffiusing Part*******************************************************
   for j = 1 : NumDiffiusion
    %consider which walks should be selected.
        sigma = (log(FES)/FES)*(abs((positions(i,:) - pbest)));
        GeneratePoint = normrnd(pbest, sigma, [1 size(positions(i,:),2)]) + ...
                (randn*pbest - randn*positions(i,:));
       %Boundary check
       GeneratePoint = check_boundary(GeneratePoint,lb,ub);
       Pre_fit(j) = rbfn(GeneratePoint,dataset_x,lambda,gamma1,flag);
       New_Positions(j,:) = GeneratePoint;
   end

   [Pre_fit_min,ind] = min(Pre_fit);
   createPoint = New_Positions(ind,:); 
   fit = benchmark_func(createPoint,func_num);
   FES = FES+1;

   data_set_x = [data_set_x;createPoint];
   data_set_y = [data_set_y;fit];
  if fit < SortedFit(i)
      New_Point = [New_Point;createPoint];
      FitVector = [FitVector,fit];
  else
      New_Point = [New_Point;positions(i,:)];
      FitVector = [FitVector,SortedFit(i)];
  end
  if fit < fbest
      fbest = fit;
      pbest = createPoint;
  end
  [ x_label,y_label ] = Get_Points( FES,fbest,x_label,y_label );
end

end

