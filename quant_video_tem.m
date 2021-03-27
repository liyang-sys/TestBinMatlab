%load Cactus_cfp8_3d_transformed_5lev
a=single(a);
%a=double(a);

nn=size(a); nn=nn(1)*nn(2)*nn(3); nn3=nn/3;
ru2=sqrt(2);

delta=1.2; del=1.8*delta;
%delta=2.28; del=1.8*delta;
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

