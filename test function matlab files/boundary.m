function lu = boundary(func_num,D)
% Basic func 
%if func_num==1
%    lu = [-100*ones(1,D);100*ones(1,D)]; %[-100,100]  Shifted Sphere Function 
if func_num==1
    lu=[-5.12*ones(1,D); 5.12*ones(1,D) ]; %[-5.12,5.12] Ellipsoid Problem
elseif func_num==2
    lu=[-2.048*ones(1,D); 2.048*ones(1,D) ]; %[-2.048,2.048]  Rosenbrock Problem
elseif func_num==3
    lu=[-32.768*ones(1,D); 32.768*ones(1,D) ]; %[-32.768,32.768]  Ackley¡¯s Function
elseif func_num==4
    lu=[-600*ones(1,D); 600*ones(1,D) ]; %[-600,600]  Griewank Problem
elseif func_num==5
    lu = [-5.12*ones(1,D);5.12*ones(1,D)];  %[-5.12,5.12] rastrigin_rot_func
elseif func_num==6
    lu = [-5*ones(1,D);5*ones(1,D)];  %[-5.12,5.12] hybrid_rot_func1  
elseif func_num==7
    lu = [-5*ones(1,D);5*ones(1,D)];  % Rotated Hybrid Composition Function 2 with a Narrow Basin for the Global Optimum  


elseif func_num==8
    lu = [-5*ones(1,D);5*ones(1,D)];   %rastrign
elseif func_num==9
    lu=[-600*ones(1,D); 600*ones(1,D) ]; %[-600,600]  Shifted Rosenbrock's  Function
elseif func_num==10
    lu = [0*ones(1,D);600*ones(1,D)]; %[-100,100] step 
elseif func_num==11
    lu = [-32*ones(1,D);32*ones(1,D)]; %[-10,10] exponential 
%elseif func_num==10
 %   lu = [-5*ones(1,D);10*ones(1,D)];   %[-5,10] rosenbrock 
elseif func_num==12
    lu = [-5*ones(1,D);5*ones(1,D)];   %[-1.28,1.28] quartic  
elseif func_num==13
    lu = [-0.5*ones(1,D);0.5*ones(1,D)];  %[-5.12,5.12] rastrigin 
elseif func_num==14
    lu = [-3*ones(1,D);1*ones(1,D)];  %[-3,1] griewank
elseif func_num==15
     lu = [-5*ones(1,D);5*ones(1,D)];  %[-50,50] ackley 
elseif func_num==16
    lu=[-5*ones(1,D); 5*ones(1,D) ]; %[-5.12,5.12] SR rastrigin


    

end
