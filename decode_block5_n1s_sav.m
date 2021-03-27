function [zd,ptr]=decode_block5_n1s(bin,n1s0,ptr)
%for de_KsideSub_ns1s

power2s=cumprod([1 2*ones(1,10)]);

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
flg=bin(ptr); ptr=ptr+1; 
zd=zeros(1,5*n1s0); n1s=0; 
lenbin=length(bin);  ia=1;
while  n1s<=(n1s0-nrs)  &&  n1s<n1s0  &&  ptr+2+nrs<=lenbin && nrs<=sum(bin(ptr:lenbin)) %minimum of code is 3!
   ptr0=ptr; n1ss=n1s;
   idx=my_bin2dec(bin(ptr:ptr+2),3,power2s); ptr=ptr+3;
   if idx~=0  %When idx=0, do nothing (since codebook{1}=[0 0 0 0 0].)
      if bin(ptr)>0, idx = idx+idx+1;  else, idx = idx+idx; end;    ptr=ptr+1;
      if idx<=6
         zd( (ia-1)*5+1 : ia*5)=codebook{idx};
      else
         if bin(ptr)>0, idx = idx+idx+1;  else, idx = idx+idx; end;    ptr=ptr+1;
         if idx<=27
            zd( (ia-1)*5+1 : ia*5)=codebook{idx-7};
         else
            if bin(ptr)>0, idx = idx+idx+1;  else, idx = idx+idx; end;    ptr=ptr+1;
            if idx<=60
               zd( (ia-1)*5+1 : ia*5)=codebook{idx-35};
            else
               if bin(ptr)>0, idx = idx+idx+1;  else, idx = idx+idx; end;    ptr=ptr+1;
               if idx<=126
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
   n1s = n1s  + sum( zd((ia-1)*5+1 : ia*5) );
   ptr_inc = ptr-ptr0;
   ia=ia+1;
end

if flg==1 || nrs>sum(bin(ptr:lenbin))
   ia=ia-2; ptr=ptr-3;
else
   ia=ia-1;
end
if nrs==0 
   if n1s==n1s0
      zd=zd(1:ia*5);
   else
      ia=ia-1;   ptr = ptr -ptr_inc;
      zd=zd(1:ia*5);
   end
else
   nres=0;
   if n1s>n1s0-nrs 
      ia=ia-1;   ptr = ptr -ptr_inc;   n1s=n1ss;
   end
   while n1s<n1s0
      nres=nres+1;
      zd(ia*5+nres) = bin(ptr);
      n1s=n1s+int16(bin(ptr));
      ptr=ptr+1;
   end
   zd=zd(1:ia*5+nres);
end
