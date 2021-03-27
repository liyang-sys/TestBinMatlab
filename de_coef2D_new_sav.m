function [qcoef,qc]=de_coef(binary,delta)

load H2ext

N=zeros(1,2);
[N(1),ptr] = deSFcode(binary,1024,1);
[N(2),ptr] = deSFcode(binary,1024,ptr);
N=N*8;
len0=N(1)*N(2);

qcoef=cell(7,3);

fprintf('\nDecoding level 1: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{1,ia},ptr]=de_sub2d(binary,len0/4,delta,routxy,ptr);
   %pos1=ptr %%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Decoding level 2: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{2,ia},ptr]=de_sub2d(binary,len0/16,delta,routxy,ptr);
   %pos2=ptr %%%%%%%%%%%%%%%%%%%%%%%%%
end

fprintf('Decoding level 3: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{3,ia},ptr]=de_sub2d(binary,len0/64,delta,routxy,ptr);
end

%fprintf('Decoding level 4: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for ia=1:3
   [qcoef{4,ia},ptr]=de_sub2d(binary,len0/256,delta,routxy,ptr);
end

%fprintf('Decoding level 5: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [qcoef{5,ia},ptr]=de_sub2d(binary,len0/1024,delta,routxy,ptr);
%end
[tem,ptr]=de_sub2d(binary,3*len0/1024,delta,routxy,ptr);
nn=sqrt(len0/1024);  for ia=1:3, qcoef{5,ia}=tem(:,(ia-1)*nn+1:ia*nn);  end

%fprintf('Decoding level 6: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
%for ia=1:3
 %  [qcoef{6,ia},ptr]=de_sub2d(binary,len0/4096,delta,routxy,ptr);
%end
[tem,ptr]=de_sub2d(binary,3*len0/4096,delta,routxy,ptr);
nn=sqrt(len0/4096);  for ia=1:3, qcoef{6,ia}=tem(:,(ia-1)*nn+1:ia*nn);  end



%fprintf('Decoding the DC band: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ \n');
%maxc=ceil(255 * 2^6 /delta)+1; <==== changed below, but why? non-orthogonal?
maxc=255 * 2^6 /delta; maxc=round(1.1*maxc);
sdc=zeros(N/64);
for ia=1:N(1)/64
   for ib=1:N(2)/64
      [sdc(ia,ib),ptr] = deSFcode(binary,maxc,ptr);
   end
end
qcoef{7,1}=(sdc-1)*delta;

qc=zeros(N);
Nt=N/2;
for ia=1:6
   qc(1:Nt(1),Nt(2)+1:2*Nt(2))=qcoef{ia,1};
   qc(Nt(1)+1:2*Nt(1),1:Nt(2))=qcoef{ia,2};
   qc(Nt(1)+1:2*Nt(1),Nt(2)+1:2*Nt(2))=qcoef{ia,3};
   Nt=Nt/2;
end
Nt=Nt*2;
qc(1:Nt(1),1:Nt(2))=qcoef{7,1};
