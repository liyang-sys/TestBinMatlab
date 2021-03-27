function [r,ptr]=decode_stationary_source_leninvr(bin,codebook,leninvr0,ptr)

%codebook ranges from 0 to 15, odd number for class 1, even number for
%class 2

power2s=cumprod([1 2*ones(1,30)]);
sublen=floor(codebook/2);%%%%%%%%%%%%%%%
cls=codebook-2*sublen;

lenb=length(bin);
r=zeros(1,lenb);
lenr=1; leninvr=0; hd=0;
switch cls
   case 0
      sublen=sublen+1;
      while leninvr<leninvr0-1
         while bin(ptr)>0.5
            hd=hd+1;
            ptr=ptr+1;
         end
         ptr=ptr+1;
         %r(lenr)=2^sublen*hd + bin2dec( char(bin(ptr:ptr+sublen-1)+48) ) +1;   ptr=ptr+sublen;
         r(lenr)=power2s(sublen+1)*hd + my_bin2dec(bin(ptr:ptr+sublen-1),sublen,power2s) +1;   ptr=ptr+sublen;

         leninvr=leninvr +r(lenr) -1;
         lenr=lenr+1; hd=0;
      end
   case 1
      while leninvr<leninvr0-1
         while bin(ptr)>0.5
            hd=hd+1;
            ptr=ptr+1;
         end
         ptr=ptr+1;
         if bin(ptr)==0
            r(lenr)=3*hd + 1;   ptr=ptr+1;
         elseif bin(ptr+1)==0
            r(lenr)=3*hd + 2;   ptr=ptr+2;
         else
            r(lenr)=3*hd + 3;   ptr=ptr+2;
         end
         
         if sublen>0
            %r(lenr)=2^sublen*(r(lenr)-1) + bin2dec( char(bin(ptr:ptr+sublen-1)+48) ) +1;
            r(lenr)=power2s(sublen+1)*(r(lenr)-1) + my_bin2dec(bin(ptr:ptr+sublen-1),sublen,power2s) +1;
            ptr=ptr+sublen;
         end
         
         leninvr=leninvr +r(lenr) -1;
         lenr=lenr+1; hd=0;
      end
      
end
%r=r(1:lenr-1); <=== corrected (cancelled) 10/07/2013 

%Corrected (added) 10/07/2013: 
lenr=lenr-1; 

flg=bin(ptr); ptr=ptr+1;
if flg==1
   while bin(ptr)==1
%      ptr, bin(ptr)
      lenr=lenr+1; r(lenr)=1;
      ptr=ptr+1;
   end
   ptr=ptr+1; %<===== added 2013/08/02
   lenr=lenr+1; r(lenr)=1;
end
r=r(1:lenr);
