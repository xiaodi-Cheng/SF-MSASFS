function [positions,FitVector,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest ] = Update_second_GP_LCB(pop_size,pbest,fbest,lb,ub,func_num,FES,...
   data_set_x,data_set_y,x_label,y_label,dataset_pbest )

%The file corresponds to Algorithm 4 and describes the kriging-based population update process.

[data_set_y,ind_y] = sort(data_set_y);
data_set_x = data_set_x(ind_y,:);
positions = data_set_x(1:pop_size,:);
FitVector = data_set_y(1:pop_size,:);
Start_Point = pop_size;
[SortedFit,SortedIndex] = sort(FitVector);
Pa = sort(SortedIndex/Start_Point, 'descend');

for i = 1 : Start_Point
       if rand > Pa(i)
           %selecting two different points in the group
           R1 = ceil(rand*size(positions,1));
           R2 = ceil(rand*size(positions,1));
            while R1 == R2
                R2 = ceil(rand*size(positions,1));
            end
             step = rand(1,size(positions,2));

            if rand < .5
                ReplacePoint(i,:) = positions(i,:) - ...
                    step .* (positions(R2,:) - pbest);
            else
                ReplacePoint(i,:) = positions(i,:) + ...
                    step .* (positions(R2,:) - positions(R1,:));
            end
       else
           ReplacePoint(i,:) = positions(i,:);
       end
end
ReplacePoint = check_boundary(ReplacePoint,lb,ub);  

%% 
Points = ReplacePoint;
New_points = positions;

[data_set_y,ind] = sort(data_set_y);
data_set_x = data_set_x(ind,:);
if size(data_set_y) <= 2*pop_size
   P_train = data_set_x;
   T_train = data_set_y;
else
   P_train = data_set_x(1:2*pop_size,:);
   T_train = data_set_y(1:2*pop_size);
end
gprMdl = fitrgp(P_train,T_train,'KernelFunction','matern32','BasisFunction','pureQuadratic','Optimizer','fmincon');
  
[posfit,posmse]=predict(gprMdl,Points);  
   
w=2;
f_lcb = posfit - w * posmse;
[min_f_lcb,ind_f_lcb] = min(f_lcb);
sele_pop = Points(ind_f_lcb,:);
temp=benchmark_func(sele_pop,func_num);
FES=FES+1;
data_set_x(end+1,:)=sele_pop;
data_set_y(end+1) = temp;

k = ceil(rand(1)*Start_Point);
if temp < FitVector(k) 
    positions(k,:)=sele_pop;
    FitVector(k) = temp;
end
    
if temp < fbest
    fbest = temp;
    pbest = sele_pop;
end
[ x_label,y_label ] = Get_Points( FES,fbest,x_label,y_label );


end





