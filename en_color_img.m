function [fsz,binary]=en_color_img(a,delta,filename)

%inc=10000^(1/511);  nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
inc=100000^(1/511);  nn=round(log(delta/0.001)/log(inc)); nn(nn>511)=511;  delta=0.001*inc^nn; 
nn=dec2bin(nn,9); binary=uint8(abs(nn)-48);

N=int16(size(a)); H0=bitshift(N(1),-3); W0=bitshift(N(2),-3); %Nsub=bitshift(int32(numel(a)),-2);
binary=[binary SFcode(H0,1536) SFcode(W0,1536)];


M=8; lev=3;  tanTheta=1/8;
for ia=1:3
   fprintf('COLOR = %d\n',ia);
   coef=LFP2(a(:,:,ia),M); coef=block2bd(coef,M,lev,tanTheta);
   binary=en_coef2D_new(coef,H0,W0,delta,binary); %L=length(binary) %%%%%%%%%%%%%%%%
end
fsz=binOut(filename, binary);
