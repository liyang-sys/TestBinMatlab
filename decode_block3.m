function [zd,ptr]=decode_block3(bin,len,ptr)

N=floor(len/3); len_res=len-3*N;
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

zd=zeros(1,len);
for ia=1:N
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
end

resd=double(bin(ptr:ptr+len_res-1));  ptr=ptr+len_res;
zd(3*N+1:len)=resd;
