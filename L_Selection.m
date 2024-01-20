function [m] = L_Selection(r)
%Use the roulette wheel selection algorithm to choose the updating formula.

P=sum(r).\r;    %Calculate selection probabilities.
L=length(P);
B(1)=P(1);
for i=2:L
    B(i)=B(i-1)+P(i);
end
r=rand();   
if  r<B(1)
    m=1;
end
for j=1:L-1
    if r>B(j) && r<B(j+1)
        m=j+1;
        break
    elseif r==B(j)
        m=j;
        break
    else
        continue;
    end
end



end

