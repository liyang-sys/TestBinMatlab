function [bin,codebook]=encode_stationary_source(r, p_or_codebook)

%codebook ranges from 0 to 15, odd number for class 1, even number for class 2

r=double(r);
if p_or_codebook<1 && p_or_codebook~=0
   p=p_or_codebook;
   if p > (1 - 0.5^(1/2.5)) %0.2421
      codebook=0; %p from 2
   elseif p > (1 - 0.5^(1/3.5))
      codebook=1; %p from 3
   elseif p > (1 - 0.5^(1/5))
      codebook=2; %p from 4
   elseif p > (1 - 0.5^(1/7))  %0.0943
      codebook=3; %p from 6

   elseif p > (1 - 0.5^(1/10))
      codebook=4; %p from 8
   elseif p > (1 - 0.5^(1/14))
      codebook=5; %p from 12
   elseif p > (1 - 0.5^(1/20))
      codebook=6; %p from 16
   elseif p > (1 - 0.5^(1/28))  %0.0245
      codebook=7; %p from 24

   elseif p > (1 - 0.5^(1/40))
      codebook=8; %p from 32
   elseif p > (1 - 0.5^(1/56))
      codebook=9; %p from 48
   elseif p > (1 - 0.5^(1/80))
      codebook=10; %p from 64
   elseif p > (1 - 0.5^(1/112))
      codebook=11; %p from 96
   elseif p > (1 - 0.5^(1/160))
      codebook=12; %p from 128
   elseif p > (1 - 0.5^(1/224))
      codebook=13; %p from 192
   elseif p > (1 - 0.5^(1/320))
      codebook=14; %p from 256
   elseif p > (1 - 0.5^(1/448))
      codebook=15; %p from 384

   elseif p > (1 - 0.5^(1/(5*128)))
      codebook=16; %p from 
   elseif p > (1 - 0.5^(1/(7*128)))
      codebook=17; %p from 
   elseif p > (1 - 0.5^(1/(5*256)))
      codebook=18; %p from 
   elseif p > (1 - 0.5^(1/(7*256)))
      codebook=19; %p from 
   elseif p > (1 - 0.5^(1/(5*512)))
      codebook=20; %p from 
   elseif p > (1 - 0.5^(1/(7*512)))
      codebook=21; %p from 
   elseif p > (1 - 0.5^(1/(5*1024)))
      codebook=22; %p from 
   elseif p > (1 - 0.5^(1/(7*1024)))
      codebook=23; %p from 

   elseif p > (1 - 0.5^(1/(5*2048)))
      codebook=24; %p from 
   elseif p > (1 - 0.5^(1/(7*2048)))
      codebook=25; %p from 
   elseif p > (1 - 0.5^(1/(5*4096)))
      codebook=26; %p from 
   elseif p > (1 - 0.5^(1/(7*4096)))
      codebook=27; %p from 
   elseif p > (1 - 0.5^(1/(5*8192)))
      codebook=28; %p from 
   elseif p > (1 - 0.5^(1/(7*8192)))
      codebook=29; %p from 
   elseif p > (1 - 0.5^(1/(5*16384)))
      codebook=30; %p from 
   elseif p > (1 - 0.5^(1/(7*16384)))
      codebook=31; %p from 
      
   else
      codebook=32; %p from 
   end
else
   codebook=p_or_codebook;
end

sublen=floor(codebook/2);
cls=codebook-2*sublen;
bin=uint8(zeros(1,sum(r)+100)); lenb=1;
switch cls
   case 0
      sublen=sublen+1;
      for ia=1:length(r)
         hd=floor((r(ia)-0.5)/2^sublen);
         bin(lenb:lenb+hd)=[ones(1,hd) 0]; lenb=lenb+hd+1;
         bin(lenb:lenb+sublen-1) = uint8( dec2bin(r(ia)-hd*2^sublen-1, sublen) - 48);
         lenb=lenb+sublen;
      end
   case 1
      for ia=1:length(r)
         hd=floor((r(ia)-0.5)/(3*2^sublen));
         bin(lenb:lenb+hd)=[ones(1,hd) 0]; lenb=lenb+hd+1;
         frac=r(ia)-hd*3*2^sublen-1;
         fracA=floor(frac/2^sublen);
         fracB=frac-fracA*2^sublen;
         switch fracA
            case 0
               bin(lenb)=0; lenb=lenb+1;
            case 1
               bin(lenb:lenb+1)=[1 0]; lenb=lenb+2;
            case 2
               bin(lenb:lenb+1)=[1 1]; lenb=lenb+2;
         end
         bin(lenb:lenb+sublen-1) = uint8( dec2bin(fracB, sublen) - 48);
         lenb=lenb+sublen;
      end
end
bin=bin(1:lenb-1);


%L=[2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9; ...
%   2 3 3 3 4 4 4 5 5 5 6 6 6 7 7 7; ...
%   3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6; ...
%   3 3 4 4 4 4 4 4 5 5 5 5 5 5 6 6; ...
%   4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5; ...
%   4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5];
%pp = 0.5 .^L(codebook+1,:); pp=pp/max(pp);
