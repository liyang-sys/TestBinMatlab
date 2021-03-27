function [a,fL]=transform_time_domain_cfp4(a)

a=double(a);

ns=4; %<====== cfp4 !!!

N=size(a);
L0=N(3); L=L0/ns; 

a=shiftdim(a,2);
for y=1:N(2)
   [a(:,:,y),fL]=LFP2sub(a(:,:,y),ns);
   tem=a(:,:,y);
   for ia=1:ns
      a((ia-1)*L+1:ia*L,:,y)=tem(ia:ns:L0,:);
   end
   
   %a(1:L,:,y)=Haar(a(1:L,:,y) );
   %a(1:hL,:,y)=Haar(a(1:hL,:,y) );
   %a(1:qL,:,y)=Haar(a(1:qL,:,y) );
end
a=shiftdim(a,1);
