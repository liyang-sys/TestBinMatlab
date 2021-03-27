function [r,ptr]=decode_stationary_source_Nsym_lenr(bin,codebook,lenr0,Nsym,ptr)

%codebook ranges from 0 to 15, odd number for class 1, even number for
%class 2

power2s=cumprod([1 2*ones(1,30)]);
sublen=floor(codebook/2);
cls=codebook-2*sublen;

lenb=length(bin);
r=zeros(1,lenb);
lenr=1;  hd=0; 
%ptr=1;
switch cls
   case 0
      sublen=sublen+1;
      %Determine 'hd0':
      n=2^sublen;
      
      if Nsym>n
         hd0=floor((Nsym-0.5)/n)-1; 
         nfrac = Nsym-hd0*n; 
         while lenr<=lenr0
            while bin(ptr)>0.5 && hd<hd0
               hd=hd+1;
               ptr=ptr+1;
            end
            if hd<hd0
               ptr=ptr+1;
               %r(lenr)=n*hd + bin2dec( char(bin(ptr:ptr+sublen-1)+48) ) +1;   ptr=ptr+sublen;
               r(lenr)=n*hd + my_bin2dec(bin(ptr:ptr+sublen-1),sublen,power2s) +1;   ptr=ptr+sublen;
            else
               [code,ptr] = deSFcode(bin,nfrac,ptr);
               r(lenr)= n*hd + code; 
            end
            lenr=lenr+1; hd=0;
         end
      else
         while lenr<=lenr0
            [r(lenr),ptr] = deSFcode(bin,Nsym,ptr);
            lenr=lenr+1;
         end
      end
   case 1
      %Determine 'hd0':
      n=2^sublen;
      if Nsym>n
         hd0=floor((Nsym-0.5-n)/(3*n)) -1; %%%%%%%%%%%%% 
         nfrac = Nsym-hd0*3*n; %%%%%%%%%%%%%%%%%%%
         while lenr<=lenr0
            if hd0>0  %modified Dec. 20, 2013
               while bin(ptr)>0.5 && hd<hd0
                  hd=hd+1;
                  ptr=ptr+1;
               end
               if hd<hd0
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
               else
                  [code,ptr] = deSFcode(bin,nfrac,ptr);
                  r(lenr)= n*3*hd + code; 
               end
            else %modified Dec. 20, 2013
               [code,ptr] = deSFcode(bin,Nsym,ptr);
               r(lenr)= code; 
            end %modified Dec. 20, 2013
            lenr=lenr+1; hd=0;
         end
      else
         while lenr<=lenr0
            [r(lenr),ptr] = deSFcode(bin,Nsym,ptr);
            lenr=lenr+1;
         end
      end
end
r=r(1:lenr-1);