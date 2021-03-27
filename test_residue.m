%load cactus_q5  %delta0=5.99/1.2
%load crowd_q6  %delta0=5.99
clear qcoef

%load cactus_96frames; a=single(a);
%load crowdrun_96frames; a=single(a)/4;

%a=a(1:512,1:512,33:64);  ar=ar(1:512,1:512,33:64);
%a=a(:,:,33:64);  ar=ar(:,:,33:64);

e=a-ar; e0=e;
e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a)); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%


delta0=5.99;

load H3L4
n9=H3cutted(4,9,n)'+1;
n9=[n9(2,:); n9(3,:); n9(1,:)];

%len=numel(e0); hlen=len/2;
%e=single(zeros(1,len));
%for ia=1:hlen
 %  e(ia)=e0(nA(1,ia),nA(2,ia),nA(3,ia));
%end
%for ia=1:hlen
 %  e(ia+hlen)=e0(nA(1,ia),nA(2,ia),nA(3,ia)+16);
%end

%[qe,ctr1]=quanTHD(e,0.55*delta0,delta0);
%z=abs(sign(qe));
%[r,lastBit,p]=Golomb0(z);

whos
bin=cell(1,8); qcoef=cell(1,8);
11
[bin{1},qcoef{1}]=en_residue(e0(1:512,1:512,1:16),n9,delta0);
22
[bin{2},qcoef{2}]=en_residue(e0(1:512,513:1024,1:16),n9,delta0);
33
[bin{3},qcoef{3}]=en_residue(e0(513:1024,513:1024,1:16),n9,delta0);
44
[bin{4},qcoef{4}]=en_residue(e0(513:1024,1:512,1:16),n9,delta0);

55
[bin{5},qcoef{5}]=en_residue(e0(1:512,1:512,17:32),n9,delta0);
66
[bin{6},qcoef{6}]=en_residue(e0(1:512,513:1024,17:32),n9,delta0);
77
[bin{7},qcoef{7}]=en_residue(e0(513:1024,513:1024,17:32),n9,delta0);
88
[bin{8},qcoef{8}]=en_residue(e0(513:1024,1:512,17:32),n9,delta0);


Nbit=0;
for ia=1:8
   Nbit=Nbit+length(bin{ia});
end
bitrate=Nbit/numel(a)

qe=single(zeros(size(e0)));
qe(1:512,1:512,1:16)=qcoef{1};
qe(1:512,513:1024,1:16)=qcoef{2};
qe(513:1024,513:1024,1:16)=qcoef{3};
qe(513:1024,1:512,1:16)=qcoef{4};

qe(1:512,1:512,17:32)=qcoef{5};
qe(1:512,513:1024,17:32)=qcoef{6};
qe(513:1024,513:1024,17:32)=qcoef{7};
qe(513:1024,1:512,17:32)=qcoef{8};
qe=single(qe);

arr=ar+qe;

e=a-arr;
e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a)); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
