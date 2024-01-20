function [ x_label,y_label ] = Get_Points( FES,fbest,x_label,y_label )
%   Save the fbest values for FES 1 to 1000 with increments of 10.
X = 0:10:1000;
X(1) = 1;
if  ismember(FES,X)
    if ismember(FES,x_label)
        return
    else
        x_label = [x_label,FES];
        y_label = [y_label,fbest];
    end
end



end

