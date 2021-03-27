function [zd,ptr]=decode_block5_n0s(bin,n0s0,ptr)

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

[sym,ptr]=deSFcode(bin,5,ptr);  nrs=sym-1;
zd=zeros(1,5*n0s0); n0s=0; 
lenbin=length(bin);  ia=1;
while  n0s<=(n0s0-nrs)  &&  n0s<n0s0  &&  ptr+2+nrs<=lenbin %minimum of code is 3, plus 'resid'
   ptr0=ptr; n0ss=n0s;
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
   n0s = n0s  + (5-sum( zd((ia-1)*5+1 : ia*5) ));
   ptr_inc = ptr-ptr0;
   ia=ia+1;
end
ia=ia-1;

if nrs==0 
   if n0s==n0s0
      zd=zd(1:ia*5);
   else
      ia=ia-1;   ptr = ptr -ptr_inc;
      zd=zd(1:ia*5);
   end
else
   nres=0;
   if n0s>n0s0-nrs 
      ia=ia-1;   ptr = ptr -ptr_inc;   n0s=n0ss;
   end
   while n0s<n0s0
      nres=nres+1;
      zd(ia*5+nres) = bin(ptr);
      n0s=n0s+int16(1-bin(ptr));
      ptr=ptr+1;
   end
   zd=zd(1:ia*5+nres);
end
