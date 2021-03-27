function [a,fL]=transform_time_domainB(a,k)

a=double(a);

ns=4; %<====== cfp4 !!!
L0=size(a,3); L=L0/ns; hL=L/2; qL=L/4;

a=shiftdim(a,2);
for y=1:size(a,3)
   [a(:,:,y),fL]=LFP2sub(a(:,:,y),ns);
   tem=a(:,:,y);
   for ia=1:ns
      a((ia-1)*L+1:ia*L,:,y)=tem(ia:ns:L0,:);
   end   
end

if k==0
   a(1:L,:,:) = Haar(a(1:L,:,:)); a(1:hL,:,:) = Haar(a(1:hL,:,:)); a(1:qL,:,:) = Haar(a(1:qL,:,:));
elseif k==1
   d=1:128;
   a(1:L,d,d) = Haar(a(1:L,d,d)); a(1:hL,d,d) = Haar(a(1:hL,d,d)); a(1:qL,d,d) = Haar(a(1:qL,d,d));
else
   d=1:256;
   a(1:L,d,d) = Haar(a(1:L,d,d)); a(1:hL,d,d) = Haar(a(1:hL,d,d)); a(1:qL,d,d) = Haar(a(1:qL,d,d));
end
      
a=shiftdim(a,1);
