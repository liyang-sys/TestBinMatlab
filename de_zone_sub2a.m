function [rz,ptr]=de_zone_sub2a(biny,lastBit,ptr)

thd=zeros(1,2);
[thdd,ptr]=decode_stationary_source_lenr(biny,3,1,ptr); thd(1)=thdd;
[thdd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr); thd(2)=thdd*4;


rsep=cell(1,2);
%decode rsep{2}:
cbook=17;  [rsep{2},ptr]=de_runs_0seps(cbook,biny,ptr);

%decode rsep{1}:
lB1=biny(ptr); ptr=ptr+1;
[codebook,ptr] = deSFcode(biny,5,ptr); codebook=codebook-1; 
lenr1=length(rsep{2}) +double((1-lB1));
[rs1,ptr]=decode_stationary_source_lenr(biny,codebook,lenr1,ptr); 
rsep{1}=GolombInv(rs1,lB1);

%decode rw;
codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
[rrw,ptr]=decode_stationary_source_lenr(biny,codebook,sum(rsep{2}),ptr);

lenk=zeros(1,2);
lenk(1)=length(rsep{1})-sum(rsep{1});
lenk(2)=length(rsep{2})-sum(rsep{2});

rk=cell(1,2);
%decode rk{2}:
flg=biny(ptr); ptr=ptr+1;
if flg==0
   [rk{2},ptr]=de_Kside(biny,thd(2),lenk(2),ptr);
else
   codebook=bin2dec(char(biny(ptr:ptr+3)+48));  ptr=ptr+4;
   [rk{2},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(2),thd(2),ptr);
end

%decode rk{1}:
if thd(1)>1
   [rk{1},ptr]=de_Kside(biny,thd(1),lenk(1),ptr);
else
   rk{1}=ones(1,lenk(1));
end

for nsep=2:-1:1
   rrw=rrw+thd(nsep);
   rrw=separate_inv(rsep{nsep},rrw,rk{nsep});
end

rz=GolombInv(rrw,lastBit);
