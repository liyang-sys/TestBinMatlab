function [qcoef,qc]=de_coef(binary,delta)

N=zeros(1,2);
[N(1),ptr] = deSFcode(binary,1024,1);
[N(2),ptr] = deSFcode(binary,1024,ptr);
N=N*8;

qcoef=cell(7,3);

fprintf('\nDecoding level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   bn=binary(ptr); ptr=ptr+1;
   if bn>0
      [qcoef{1,ia},ptr]=de_subband_L1(binary,N/2,ptr);
   else
      qcoef{1,ia}=zeros(N(1)/2,N(2)/2);
   end
   %pos1=ptr %%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Decoding level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{2,ia},ptr]=de_subband_L2(binary,N/4,ptr);   
   %pos2=ptr %%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Decoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{3,ia},ptr]=de_subband_L3(binary,N/8,ptr);   
end

%fprintf('Decoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{4,ia},ptr]=de_subband_L4(binary,N/16,ptr);   
end

%fprintf('Decoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{5,ia},ptr]=de_subband_L5(binary,N/32,ptr);   
end

%fprintf('Decoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{6,ia},ptr]=de_subband_L5(binary,N/64,ptr);   
end

%fprintf('Decoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
maxc=ceil(255 * 2^6 /delta)+1;
sdc=zeros(N/64);
for ia=1:N(1)/64
   for ib=1:N(2)/64
      [sdc(ia,ib),ptr] = deSFcode(binary,maxc,ptr);
   end
end
qcoef{7,1}=sdc-1;

qc=int16(zeros(N));
Nt=N/2;
for ia=1:6
   qc(1:Nt(1),Nt(2)+1:2*Nt(2))=qcoef{ia,1};
   qc(Nt(1)+1:2*Nt(1),1:Nt(2))=qcoef{ia,2};
   qc(Nt(1)+1:2*Nt(1),Nt(2)+1:2*Nt(2))=qcoef{ia,3};
   Nt=Nt/2;
end
Nt=Nt*2;
qc(1:Nt(1),1:Nt(2))=qcoef{7,1};
