function a=transform_time_domainB_inv(a,fL)

ns=4; %<====== cfp4 !!!
L0=size(a,3); L=L0/ns; hL=L/2; qL=L/4;

%a=shiftdim(a,2);
a=single(a); a=shiftdim(a,2); a=double(a); %<== save memery

a(1:qL,:,:)=Haar_inv(a(1:qL,:,:) );
a(1:hL,:,:)=Haar_inv(a(1:hL,:,:) );
a(1:L,:,:)=Haar_inv(a(1:L,:,:) );

for y=1:1024
   tem=a(:,:,y);
   for ia=1:ns
      a(ia:ns:L0,:,y)=tem((ia-1)*L+1:ia*L,:);
   end
   a(:,:,y)=LFP2subInv(a(:,:,y),ns,fL);
end
%a=shiftdim(a,1);
a=single(a); a=shiftdim(a,1); a=double(a);
