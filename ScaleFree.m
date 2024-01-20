
% build the scale free network by the BA model

function Ba=ScaleFree(N,M,K)
%M£ºInitial number of nodes
%N£ºTotal number of nodes after addition of new nodes

for i = 1 : M
   Ba( i ).Sec = [ 1 : i - 1 , i + 1 : M ]; %Indices of nodes connected to the i-th node: Fully connected network
   Ba( i ).D = M - 1;  %The degree of the i-th node.
end

T = M * ( M - 1 );  %The sum of degrees of all nodes in the scale-free network.

for i = M : N - 1
   for num = 1 : i
      P( num ) = Ba( num ).D / T; %Calculate the selection probability of nodes.
   end
   %Connect the new node to K existing nodes.
   for k=1:K
       r = rand;
       s = 0;    %Roulette wheel selection algorithm.
       for num = 1 : i
          s = s + P( num );
          if r < s
             break;
          end
       end
       Ba( num ).Sec = [ Ba( num ).Sec,i + 1 ];
       Ba( num ).D = Ba( num ).D + 1;
       Ba( i + 1 ).Sec = [ num ];
       Ba( i + 1 ).D = 1;
       T = T + 2;
   end
end
end