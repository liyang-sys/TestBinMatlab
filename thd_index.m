function [idx,thd]=thd_index(thd)

a=cumprod(2*ones(1,11)); b=3*cumprod([1 2*ones(1,10)]);  c=5*cumprod([1 2*ones(1,9)]); d=7*cumprod([1 2*ones(1,9)]);
th=[a(2:11); c; b(2:11); d]; th=reshape(th,1,40); thd_arr=[1 2 3 th(1:37)]; 

%modified 29/10/2017 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if thd>2048, thd=2048; end
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

idx=1;
while thd_arr(idx)<thd
   idx=idx+1;
end

%idx
if idx>6
   if thd_arr(idx)-thd > thd-thd_arr(idx-1)
      idx=idx-1;
   end
end
%idx
thd=thd_arr(idx);
