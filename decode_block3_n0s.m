function [zd,ptr]=decode_block3_n0s(bin,n0s0,ptr)
%for de_KsideSub_ns1s

power2s=cumprod([1 2*ones(1,6)]);

codebook=cell(8,1);
codebook{1}=[0 0 0];
codebook{2}=[0 0 1];
codebook{3}=[0 1 0];
codebook{4}=[1 0 0];
codebook{5}=[1 1 0];
codebook{6}=[0 1 1];
codebook{7}=[1 0 1];
codebook{8}=[1 1 1];

[sym,ptr]=deSFcode(bin,3,ptr);  nrs=sym-1;
zd=zeros(1,5*n0s0); n0s=0; 
lenbin=length(bin); ia=1;
while  n0s<=(n0s0-nrs)  &&  n0s<n0s0  &&  ptr+1+nrs<=lenbin %<= modified 12/07/13
   ptr0=ptr; n0ss=n0s;
   idx=my_bin2dec(bin(ptr:ptr+1),2,power2s); ptr=ptr+2;
   if idx~=0  %When idx=0, do nothing (since codebook{1}=[0 0 0].)
      if bin(ptr)>0, idx = idx+idx+1;  else, idx = idx+idx; end;    ptr=ptr+1;
      if idx<=6
         zd( (ia-1)*3+1 : ia*3)=codebook{idx};
      else
         if bin(ptr)==0
            zd( (ia-1)*3+1 : ia*3)=codebook{7};
         else
            zd( (ia-1)*3+1 : ia*3)=codebook{8};
         end
         ptr=ptr+1;
      end                  
   end
   n0s = n0s  + (3-sum( zd((ia-1)*3+1 : ia*3) )); 
   ptr_inc = ptr-ptr0;
   ia=ia+1;
end
ia=ia-1;

if nrs==0 
   if n0s==n0s0
      zd=zd(1:ia*3);
   else
      ia=ia-1;   ptr = ptr -ptr_inc;
      zd=zd(1:ia*3);
   end
else
   nres=0;
   if n0s>n0s0-nrs 
      ia=ia-1;   ptr = ptr -ptr_inc;   n0s=n0ss;
   end
   while n0s<n0s0
      nres=nres+1;
      zd(ia*3+nres) = bin(ptr);
      n0s=n0s+double(1-bin(ptr));
      ptr=ptr+1;
   end
   zd=zd(1:ia*3+nres);
end
