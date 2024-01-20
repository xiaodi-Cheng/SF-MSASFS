function f_pre=rbfn(X,data,lambda,gamma,flag)
% input: X: the points whose fitness is to be calculated by rbf 
%           data: the data building the rbf model
%           lambda, gamma: the parameter vector worked out for rbf
%           flag: to indicate which type of rbf to use
% output: the fitness of X
%---------------------------------------------------------------------------

len=size(data,1);
mX=size(X,1);
R=[];
for i=1:len
    R(i)=pdist2(X,data(i,:));
end
%compute pairwise dstances between points in X and S. pdist2 is MATLAB built-in function

switch(flag)
    case 'cubic'
        phi=R.^3; % cubic rbf
    case 'TPS'
        R(R==0)=1;
        phi=R.^2.*log(R); %thin plate spline rbf 
    case 'linear'
        phi=R;%linera rbf 
    case 'gaussian'
        sigma=10;
        phi=exp(-R.^2/2/sigma);
    case 'mittag'
        alpha=3;
        beta=2;
        fi=9;
        phi=mlf(alpha,beta,R,fi);
end   
f_pre1=phi*lambda; %first part of response surface - weighted sum of distances
f_pre2=[X,ones(mX,1)]*gamma; % polynomial tail of response surface
f_pre=f_pre1+f_pre2; %preadicted function value

end 

    