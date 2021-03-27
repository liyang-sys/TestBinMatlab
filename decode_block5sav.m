function [zd,ptr]=decode_block5(bin,len,ptr)

N=floor(len/5);   len_res=len-5*N;

codebook=cell(32,1);
codebook{1}=[0 0 0 0 0];
codebook{2}=[0 0 0 0 1];
codebook{3}=[0 0 0 1 0];
codebook{4}=[0 0 1 0 0];
codebook{5}=[0 1 0 0 0];
codebook{6}=[1 0 0 0 0];
codebook{7}=[0 0 0 1 1];
codebook{8}=[0 0 1 1 0];
codebook{9}=[0 0 1 0 1];
codebook{10}=[0 1 1 0 0];
codebook{11}=[0 1 0 1 0];
codebook{12}=[0 1 0 0 1];
codebook{13}=[1 1 0 0 0];
codebook{14}=[1 0 1 0 0];
codebook{15}=[1 0 0 1 0];
codebook{16}=[1 0 0 0 1];
codebook{17}=[1 1 1 0 0];
codebook{18}=[1 1 0 0 1];
codebook{19}=[1 1 0 1 0];
codebook{20}=[0 0 1 1 1];
codebook{21}=[0 1 0 1 1];
codebook{22}=[0 1 1 0 1];
codebook{23}=[0 1 1 1 0];
codebook{24}=[1 0 0 1 1];
codebook{25}=[1 0 1 1 0];
codebook{26}=[1 0 1 0 1];
codebook{27}=[1 1 1 1 0];
codebook{28}=[1 1 1 0 1];
codebook{29}=[1 0 1 1 1];
codebook{30}=[0 1 1 1 1];
codebook{31}=[1 1 0 1 1];
codebook{32}=[1 1 1 1 1];

zd=zeros(1,len);
%ptr=1;
for ia=1:N
   code=bin(ptr:ptr+2); ptr=ptr+3;
   if sum(code)~=0  %When sum(code)=0, do nothing (since codebook{1}=[0 0 0 0 0].)
      code=[code bin(ptr)]; ptr=ptr+1;  idx=bin2dec(char(code+48));
      if idx<7
         zd( (ia-1)*5+1 : ia*5)=codebook{idx};
      else
         code=[code bin(ptr)]; ptr=ptr+1;  idx=bin2dec(char(code+48));
         if idx<28
            zd( (ia-1)*5+1 : ia*5)=codebook{idx-7};
         else
            code=[code bin(ptr)]; ptr=ptr+1;  idx=bin2dec(char(code+48));
            if idx<61
               zd( (ia-1)*5+1 : ia*5)=codebook{idx-35};
            else
               code=[code bin(ptr)]; ptr=ptr+1;  idx=bin2dec(char(code+48));
               if idx<127
                  zd( (ia-1)*5+1 : ia*5)=codebook{idx-96};
               else
                  if bin(ptr)==0
                     zd( (ia-1)*5+1 : ia*5)=codebook{31};
                  else
                     zd( (ia-1)*5+1 : ia*5)=codebook{32};
                  end
                  ptr=ptr+1;
               end
            end
         end
      end
   end
end
%ptrsub=ptr-length(bin);
resd=double(bin(ptr:ptr+len_res-1));  ptr=ptr+len_res;
zd(5*N+1:len)=resd;
