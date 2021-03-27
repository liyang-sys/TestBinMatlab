function [rz,ptr]=de_zone_sub(biny,lastBit,ptr)

thd=zeros(1,3);
[thdd,ptr]=decode_stationary_source_lenr(biny,2,1,ptr); thd(1)=thdd;
[thdd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr); thd(2)=thdd;
[thdd,ptr]=decode_stationary_source_lenr(biny,4,1,ptr); thd(3)=thdd*4;

rsep=cell(1,3);
%decode rsep{3}:
cbook=17;  [rsep{3},ptr]=de_runs_0seps(cbook,biny,ptr);

%decode rsep{2}:
lB2=biny(ptr); ptr=ptr+1;
lenr2=length(rsep{3}) +double((1-lB2));
cbook=4; [rs2,ptr]=de_runs_1sep(biny,lenr2,cbook,ptr);
rsep{2}=GolombInv(rs2,lB2);

%decode rsep{1}:
lB1=biny(ptr); ptr=ptr+1;
lenr1=length(rsep{2}) +double((1-lB1));
cbook=17;  [rs1,ptr]=de_runs_2seps(biny,lenr1,cbook,ptr);
rsep{1}=GolombInv(rs1,lB1);

%decode rw;
codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
[rrw,ptr]=decode_stationary_source_lenr(biny,codebook,sum(rsep{3}),ptr);

lenk=zeros(1,3);
lenk(1)=length(rsep{1})-sum(rsep{1});
lenk(2)=length(rsep{2})-sum(rsep{2});
lenk(3)=length(rsep{3})-sum(rsep{3});

%sumrw=sum(rrw), lenrw=length(rrw) %%%%%%%%%%%%%


rk=cell(1,3);
%decode rk{3} and rk{2}:
for nsep=3:-1:2
   if thd(nsep)>1
      flg=biny(ptr); ptr=ptr+1;
      if flg==0
         [rk{nsep},ptr]=de_Kside(biny,thd(nsep),lenk(nsep),ptr);
      else
         
         codebook=bin2dec(char(biny(ptr:ptr+3)+48));  ptr=ptr+4;
         [rk{nsep},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(nsep),thd(nsep),ptr);
      end
   else
      rk{nsep}=ones(1,lenk(nsep));
   end
   %nsep, rk{nsep}
end


%decode rk{1}:
if thd(1)>1
   [rk{1},ptr]=de_Kside(biny,thd(1),lenk(1),ptr);
else
   rk{1}=ones(1,lenk(1));
end

for nsep=3:-1:1
   %[length(rsep{nsep}),sum(rsep{nsep}), length(rk{nsep})]
   rrw=rrw+thd(nsep);
   rrw=separate_inv(rsep{nsep},rrw,rk{nsep});
end

rz=GolombInv(rrw,lastBit);
