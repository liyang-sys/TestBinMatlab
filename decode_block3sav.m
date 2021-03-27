function [zd,ptr]=decode_block3(bin,len,ptr)

N=floor(len/3); len_res=len-3*N;

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
%ptr=1;
for ia=1:N
   code=bin(ptr:ptr+1); ptr=ptr+2;
   if sum(code)~=0
      code=[code bin(ptr)]; ptr=ptr+1;
      sumcode=sum(code);
      if sumcode<3
         zd( (ia-1)*3+1 : ia*3)=codebook{bin2dec(char(code+48))};
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
