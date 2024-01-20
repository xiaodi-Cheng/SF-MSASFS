function [New_Point ,fit,pbest,fbest,FES,data_set_x,data_set_y,x_label,y_label,dataset_pbest,R ] = Update_first_1(New_Point,fit,pbest,fbest,Start_Point,lb,ub,func_num,FES ,...
                              data_set_x,data_set_y,flag,x_label,y_label,Mp,K,Ba, dataset_pbest,R )

%The file is the code file for the RBF-based adaptive update process, corresponding to Algorithm 3.                        
[sortVal, sortIndex] = sort(fit);
%Starting The First Updating Process====================================
for i=1:1:Start_Point     
    Pa(sortIndex(i)) = (Start_Point - i + 1) / Start_Point;
end
RandVec1 = randperm(Start_Point);
RandVec2 = randperm(Start_Point);
m = L_Selection(R);
 for i = 1 : Start_Point
    k = ceil(rand(1)*Start_Point);         % Choose k randomly, not equal to i
    while (k==i)
        k = ceil(rand(1)*Start_Point);
    end
    oud_k = ceil(rand(1)*Start_Point);         % Choose k randomly, not equal to i
    while (k==i)
        oud_k = ceil(rand(1)*Start_Point);
    end
    p_k = ceil(rand(1)*Mp); 
    N_D_max = max(Ba(i).D);
    N_index_max = Ba(i).Sec(N_D_max);   
    phi = normrnd(0.7,0.1,size(New_Point,2),2);
    FK=0.7;
    for j = 1 : size(New_Point,2)
        KLLe1 = ceil(rand(1)*Ba(i).D);
        kop1 = Ba(i).Sec(KLLe1);
        KLLe2 = ceil(rand(1)*Ba(i).D);
        kop2 = Ba(i).Sec(KLLe2);
        if kop2==kop1
            KLLe2 = ceil(rand(1)*Ba(i).D);
            kop2 = Ba(i).Sec(KLLe2);
        end

        if rand > Pa(i)
            if m==1
                 P(i,j) = New_Point(kop1,j) - rand * (New_Point(kop2,j) - New_Point(i,j));
            elseif m==2
                P(i,j)= pbest(j)+rand()*(New_Point(kop1,j)-New_Point(i,j)); % save('New_SFS_FES_pbestBA_rand_100.mat')
            else
                    P(i,j) = New_Point(RandVec1(i),j) - rand * (New_Point(RandVec2(i),j) - New_Point(i,j));
            end

        else
            P(i,j)= New_Point(i,j);
        end
    end
end
P = check_boundary(P,lb,ub);%for checking bounds


for f = 1:Start_Point

    [dataset_x,dataset_y] = select_dataset(data_set_x,data_set_y,Start_Point);
    dim = size(dataset_x,2);
   theta = min(sqrt(0.001^2*dim),5.0*10^(-4*dim)*(ub-lb));
    [lambda,gamma1,params]=RBF(dataset_x,dataset_y,flag); 
    Pre_fit(f) = rbfn(P(f,:),dataset_x,lambda,gamma1,flag);

    Distance =pdist2(P(f,:),dataset_x);
    [Min_Distance,Min_index] = min( Distance );
   if Pre_fit(f) <= fit(f) & Min_Distance >  theta
        temp=benchmark_func(P(f,:),func_num);
        FES = FES + 1;
       data_set_x(end+1,:)=P(f,:);
       data_set_y(end+1) = temp;
       if temp < fit(f)
           New_Point(f,:)=P(f,:);
           fit(f)=temp;
       end
       if temp < fbest
           fbest = temp;
           pbest = P(f,:);
       end
       [ x_label,y_label ] = Get_Points( FES,fbest,x_label,y_label );
    end
end


if pbest ~= dataset_pbest(end-1,:) 
    R(m)=R(m)+1;
end

end

