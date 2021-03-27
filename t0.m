   [bin,sep,rk,rw]=en_r1(r,0.8125,[]); %length(bin) 
   [rr,ptr,sepr,rkr,rwr]=de_r1(bin,1); %ptr
   zr=GolombInv(rr,0);
%   whos zr
