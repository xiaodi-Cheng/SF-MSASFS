function [lambda,gamma,params]=RBF(data,f,flag)
%1. the algo is used to build the rbf model, find out the lambda and gamma
%2. Update function: [\phi,P; P',0]* [lambda, gamma]=[f,0] objectif : find out lambda and
% gamma
%3. Parameter declare: 
%    data is the dataset
%    f is the fitness values corresponding to the points in data set 
[m,n]=size(data);
P=[data,ones(m,1)];
R=pdist2(data,data);% pdist2 is a matlab built-in function to calcule the distance between points in data
%switch the different type of \phi
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
        alpha=1.5;
        beta=1.5;
        fi=9;
        [m1,n1]=size(R);
        phi=zeros(m1,n1);
        for i=1:m1
            for j=1:n1
                phi(i,j)=mlf(alpha,beta,R(i,j),fi);
            end
        end
end
A=[phi,P;P',zeros(n+1,n+1)] ;
B=[f;zeros(n+1,1)]; 
params=A\B; 
lambda=params(1:m);
gamma=params(m+1:end);
end

