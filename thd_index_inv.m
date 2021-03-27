function thd=thd_index_inv(idx)

a=cumprod(2*ones(1,11)); b=3*cumprod([1 2*ones(1,10)]);  c=5*cumprod([1 2*ones(1,9)]); d=7*cumprod([1 2*ones(1,9)]);
th=[a(2:11); c; b(2:11); d]; th=reshape(th,1,40); thd_arr=[1 2 3 th(1:37)]; 

thd=thd_arr(idx);
