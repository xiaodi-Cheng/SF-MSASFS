% function function_plot
% clear;close all
global initial_flag

% Xmin=[-100,-100,-100,-100,-100,-100,0,-32,-5,-5,-0.5,-pi,-3,-100,-5,-5,-5,-5,-5,-5,-5,-5,-5,-5,2];
% Xmax=[100,100,100,100,100,100,600,32,5,5,0.5,pi,1,100,5,5,5,5,5,5,5,5,5,5,5];

for func_num=8:16
    if  func_num==1 x=-5.5:0.1:5.5; y=x;%[-5.12,5.12]
    elseif func_num==2 x=-2.05:0.02:2.05; y=x;%[-2.048,2.048]
    elseif func_num==3 x=-33:1:33; y=x;%[-32.768,32.768]
    elseif func_num==4 x=-350:2:-250; y=-100:2:0;;%[-600,600]
    elseif func_num==5 x=-5:0.1:5; y=x;%[-5,5]
        
    elseif func_num==6 x=-5:0.1:5; y=x;%[-5,5]
        
    elseif func_num==7 x=-5:0.1:5; y=x;%[-5,5]
        
    elseif func_num==8 x=-100:5:100; y=x;%[-100,100]
    elseif func_num==9 x=78:0.05:82; y=-51.3:0.05:-47.3;%[-3,1]
    elseif func_num==10 x=-350:2:-250; y=-100:2:0;;%[-600,600]
    elseif func_num==11 x=-32:1:32; y=x;%[-32,32]
    elseif func_num==12 x=-5:0.1:5; y=x;%[-5,5]
    elseif func_num==13 x=-0.5:0.01:0.5; y=x;%[-0.5,0.5]
    elseif func_num==14 x=-2:0.02:-1; y=x;%[-3,1]
    elseif func_num==15 x=-5:0.1:5; y=x;%[-5,5]
    elseif func_num==16 x=-5:0.1:5; y=x;%[-5,5]
       
    end
    
initial_flag=0;
L=length(x);
f=[];

for i=1:L
for j=1:L
f(i,j)=benchmark_func([x(i),y(j)],func_num);
end
end

figure(func_num)
surfc(x,y,f);
end

