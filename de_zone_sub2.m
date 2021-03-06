function [rz,ptr,rk]=de_zone_sub2(biny,lastBit,ptr)

thd=zeros(1,2);
[thdd,ptr]=decode_stationary_source_lenr(biny,3,1,ptr); thd(1)=thdd;
[thdd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr); thd(2)=thdd*4;
%thd %%%%%%%%%%%%

rsep=cell(1,2);
%decode rsep{2}:
cbook=17;  [rsep{2},ptr]=de_runs_0seps(cbook,biny,ptr);

%decode rsep{1}:
lB1=biny(ptr); ptr=ptr+1;
lenr1=length(rsep{2}) +double((1-lB1));
cbook=4; [rs1,ptr]=de_runs_1sep(biny,lenr1,cbook,ptr);
rsep{1}=GolombInv(rs1,lB1);

%decode rw;
[rrw,inv,ptr]=de_r0(biny,sum(rsep{2}),ptr);

lenk=zeros(1,2);
lenk(1)=length(rsep{1})-sum(rsep{1});
lenk(2)=length(rsep{2})-sum(rsep{2});

rk=cell(1,2);
%decode rk{2}:
flg=biny(ptr); ptr=ptr+1;
if flg==0
%    [rk{2},ptr]=de_Kside(biny,thd(2),lenk(2),ptr);
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [rk{2},ptr]=de_Kside_new(biny,thd(2),lenk(2),ptr);%<====2021年4月27日修改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
   %codebook=bin2dec(char(biny(ptr:ptr+3)+48));  ptr=ptr+4;
   %[codebook,ptr] = deSFcode(biny,24,ptr); codebook=codebook-1;  %modified 25/04/2015
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [codebook,ptr] = deSFcode(biny,17,ptr);  codebook=codebook-1;  %<====2021年4月25日修改
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [rk{2},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(2),thd(2),ptr);
end

%decode rk{1}:
if thd(1)>1
%    [rk{1},ptr]=de_Kside(biny,thd(1),lenk(1),ptr);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [rk{1},ptr]=de_Kside_new(biny,thd(1),lenk(1),ptr);%<====2021年4月27日修改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else
   rk{1}=ones(1,lenk(1));
end

for nsep=2:-1:1
   rrw=rrw+thd(nsep);
   rrw=separate_inv(rsep{nsep},rrw,rk{nsep});
end

rz=GolombInv(rrw,lastBit);
