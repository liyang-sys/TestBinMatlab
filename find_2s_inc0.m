function inc=find_2s_inc0(H0,dH,inc0,p2s)

inc0=int32(inc0); dH=int32(dH);
n_inc=length(inc0);

%This loop excludes the first a few inc's that are too large (2*inc==H0 or sum(inc)=H0) ---------------
%ia=1; 
%while ia<=n_inc && (H0<=abs(bitshift(dH,1)) || sum(inc0(1:ia-1))+bitshift(inc0(ia),1)+H0 <=0)
 %  dH=dH-inc0(ia);  ia=ia+1; 
%end
%------------------------------------------------------------------------------------------------------

inc=inc0; ia=1;
while  ia<n_inc-1
   if  bitshift(inc0(ia),-1)==inc0(ia+1)   &&   abs(dH)>abs(inc0(ia)+inc0(ia+1))
      inc(ia)=bitshift(inc0(ia),1);
      dH=dH-inc(ia);
      [idx,h,nh]=find_2s_power(abs(dH),p2s); %%%%%%%%%%%%%%%
      n_inc=ia+nh; ia=ia+1; 
      inc(ia:n_inc)=sign(dH)*h;  inc=inc(1:n_inc); inc0=inc;
   else
      dH=dH-inc(ia);
      ia=ia+1;
   end
end

