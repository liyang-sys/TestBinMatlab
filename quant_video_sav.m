load Cactus_cfp8_3d_transformed_5lev
a=single(a);
%a=double(a);

nn=size(a); nn=nn(1)*nn(2)*nn(3); nn3=nn/3;
ru2=sqrt(2);

delta=1.19; del=single(1.8*delta);  %48.8357
%delta=4.3; del=1.8*delta;
%delta=5; del=1.8*delta;
%delta=6; del=1.8*delta;
%delta=10; del=1.8*delta;
%delta=30; del=2.02*delta;
%delta=100; del=2.36*delta;
delta1=delta*ru2; delta2=delta1*ru2; delta3=delta2*ru2; delta4=delta3*ru2;

qa0=quanTHD_single(a,del,del);
maxamp0=max(max(max(abs(qa0)))) %%%%%%%%%%%%%%%%%
Nnon0=sum(sum(sum(abs(sign(qa0))))) %%%%%%%%%%%%%%%%%%%
qa0=rstTHDctr1_single(qa0,del,del,0.39*del,0.46*del);

e0=a-qa0; e0=e0.*e0; e0=sqrt(sum(sum(sum(e0)))/nn);
SNR0=20*log10(256/e0)

qa=a;
qa(:,:,49:96)=quanTHD_single(a(:,:,49:96),delta,delta);
qa(:,:,25:48)=quanTHD_single(a(:,:,25:48),delta1,delta1);
qa(:,:,13:24)=quanTHD_single(a(:,:,13:24),delta2,delta2);
qa(:,:,7:12)=quanTHD_single(a(:,:,7:12),delta3,delta3);
qa(:,:,1:6)=quanTHD_single(a(:,:,1:6),delta4,delta4);
maxamp=max(max(max(abs(qa)))) %%%%%%%%%%%%%%%%%%%
Nnon=sum(sum(sum(abs(sign(qa))))) %%%%%%%%%%%%%%%%%%%
qa(:,:,49:96)=rstTHDctr1_single(qa(:,:,49:96),delta,delta,0.39*delta,0.46*delta);
qa(:,:,25:48)=rstTHDctr1_single(qa(:,:,25:48),delta1,delta1,0.39*delta1,0.46*delta1);
qa(:,:,13:24)=rstTHDctr1_single(qa(:,:,13:24),delta2,delta2,0.39*delta2,0.46*delta2);
qa(:,:,7:12)=rstTHDctr1_single(qa(:,:,7:12),delta3,delta3,0.39*delta3,0.46*delta3);
qa(:,:,1:6)=rstTHDctr1_single(qa(:,:,1:6),delta4,delta4,0.39*delta4,0.46*delta4);

e=a-qa; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
SNR=20*log10(256/e)


%-------------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:12
   qa(1:qbk(1),1:qbk(2),ia)=LowHigh2block(qa(1:qbk(1),1:qbk(2),ia));
   qa(1:qbk(1),1:qbk(2),ia)=CFP2bandInv(qa(1:qbk(1),1:qbk(2),ia),tanTheta);

   qa0(1:qbk(1),1:qbk(2),ia)=LowHigh2block(qa0(1:qbk(1),1:qbk(2),ia));
   qa0(1:qbk(1),1:qbk(2),ia)=CFP2bandInv(qa0(1:qbk(1),1:qbk(2),ia),tanTheta);
end
for ia=1:96
   qa(1:hbk(1),1:hbk(2),ia)=LowHigh2block(qa(1:hbk(1),1:hbk(2),ia));
   qa(1:hbk(1),1:hbk(2),ia)=CFP2bandInv(qa(1:hbk(1),1:hbk(2),ia),tanTheta);
   qa(1:nbk(1),1:nbk(2),ia)=LowHigh2block(qa(1:nbk(1),1:nbk(2),ia));
   qa(1:nbk(1),1:nbk(2),ia)=CFP2bandInv(qa(1:nbk(1),1:nbk(2),ia),tanTheta);

   qa0(1:hbk(1),1:hbk(2),ia)=LowHigh2block(qa0(1:hbk(1),1:hbk(2),ia));
   qa0(1:hbk(1),1:hbk(2),ia)=CFP2bandInv(qa0(1:hbk(1),1:hbk(2),ia),tanTheta);
   qa0(1:nbk(1),1:nbk(2),ia)=LowHigh2block(qa0(1:nbk(1),1:nbk(2),ia));
   qa0(1:nbk(1),1:nbk(2),ia)=CFP2bandInv(qa0(1:nbk(1),1:nbk(2),ia),tanTheta);
end



%-------------------------------------------------------------------------
qa0=shiftdim(qa0,2);  
qa=shiftdim(qa,2);
for x=1:1024
   x
   for y=1:1024
      qa0(:,x,y)=dyadic_periodic_recon(qa0(:,x,y),5);
      qa(:,x,y)=dyadic_periodic_recon(qa(:,x,y),5);
   end
end
qa0=shiftdim(qa0,1);
qa=shiftdim(qa,1);



%save Cactus_quantized_delta_100 qa0 del qa delta