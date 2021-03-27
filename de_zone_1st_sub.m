function [rrw,ptr]=de_zone_1st_sub(biny,ptr)

power2s=cumprod([1 2*ones(1,10)]);
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

nsep=biny(ptr)*2+biny(ptr+1)+3;  ptr=ptr+2;

thd=zeros(1,nsep);
for nsp=1:nsep
   [idx,ptr]=decode_stationary_source_lenr(biny,3,1,ptr); 
   thd(nsp)=th(idx);
end

rsep=cell(1,nsep);
%decode rsep{k} k>=3:
for nsp=nsep:-1:2
   cbook=17;  [rsep{nsp},ptr]=de_runs_0seps(cbook,biny,ptr);
end

%decode rsep{1}:
lB1=biny(ptr); ptr=ptr+1;
lenr1=length(rsep{2});
cbook=4; [rs1,ptr]=de_runs_1sep(biny,lenr1,cbook,ptr);
rsep{1}=GolombInv(rs1,lB1);

%decode rw;
codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
[rrw,ptr]=decode_stationary_source_lenr(biny,codebook,sum(rsep{nsep}),ptr);

lenk=zeros(1,nsep);
for nsp=1:nsep
   lenk(nsp)=length(rsep{nsp})-sum(rsep{nsp});
end

rk=cell(1,nsep);
%decode rk{3} and rk{2}:
for nsp=nsep:-1:2
   if thd(nsp)>1
      flg=biny(ptr); ptr=ptr+1;
      if flg==0
         [rk{nsp},ptr]=de_Kside_new(biny,thd(nsp),lenk(nsp),ptr);
      else
         
         codebook=bin2dec(char(biny(ptr:ptr+3)+48));  ptr=ptr+4;
         [rk{nsp},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(nsp),thd(nsp),ptr);
      end
   else
      rk{nsp}=ones(1,lenk(nsp));
   end
   %nsp, rk{nsp}
end

%decode rk{1}:
if thd(1)>1
   [rk{1},ptr]=de_Kside_new(biny,thd(1),lenk(1),ptr);
else
   rk{1}=ones(1,lenk(1));
end

for nsp=nsep:-1:1
   %[length(rsep{nsp}),sum(rsep{nsp}), length(rk{nsp})]
   rrw=rrw+thd(nsp);
   rrw=separate_inv(rsep{nsp},rrw,rk{nsp});
end
