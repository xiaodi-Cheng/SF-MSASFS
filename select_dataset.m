
% if select the sample point as dataset 
% data_x : the data set containing the information of position
% data_y: the data set containinig the info of fitness 
% N is the size of the population 
function [dataset_x,dataset_y] = select_dataset(data_x,data_y,N)
    dataset_x = [];
    dataset_y = [];

    if size(data_x,1) <= 2*N
        dataset_x = data_x;
        dataset_y = data_y;
    else
         [temp,index] = sort(data_y);
        data_temp = data_x(index,:);
        dataset_y = temp(1:2*N);
        dataset_x= data_temp(1:2*N,:);
    end
end
     