function [rrw,ptr,rk]=de_zone_sub_new(biny,ptr)

%power2s=cumprod([1 2*ones(1,10)]);
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

[sym,ptr] = deSFcode(biny,5,ptr);  nsep=sym+1;

thd=zeros(1,nsep);
for nsp=1:nsep
   [idx,ptr]=decode_stationary_source_lenr(biny,3,1,ptr); 
   thd(nsp)=th(idx);
end

rsep=cell(1,nsep);

%decode rsep{nsep}: ------------------------------------------------
cbook=17;  [rsep{nsep},ptr]=de_runs_0seps(cbook,biny,ptr);

%decode rsep{k} (k from 2 to nsep-1):
for nsp=nsep-1:-1:2
   lB2=biny(ptr); ptr=ptr+1;
   lenr2=length(rsep{nsp+1}) +double((1-lB2));
   cbook=4; [rs2,ptr]=de_runs_1sep(biny,lenr2,cbook,ptr);
   rsep{nsp}=GolombInv(rs2,lB2);
end

%decode rsep{1}: ---------------------------------------------------
lB1=biny(ptr); ptr=ptr+1;
lenr1=length(rsep{2}) +double((1-lB1));
cbook=17;  [rs1,ptr]=de_runs_2seps(biny,lenr1,cbook,ptr);
rsep{1}=GolombInv(rs1,lB1);


%decode rw: --------------------------------------------------------
[rrw,inv,ptr]=de_r0(biny,sum(rsep{nsep}),ptr); 

%codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
%[rrw,ptr]=decode_stationary_source_lenr(biny,codebook,sum(rsep{nsep}),ptr);

%decoding rk's: ----------------------------------------------------
lenk=zeros(1,nsep);
for nsp=1:nsep
   lenk(nsp)=length(rsep{nsp})-sum(rsep{nsp});
end

rk=cell(1,nsep);
%decode rk{3} and rk{2}:
for nsp=nsep:-1:1
   if thd(nsp)>1
      flg=biny(ptr); ptr=ptr+1;
      if flg==0
         [rk{nsp},ptr]=de_Kside_new(biny,thd(nsp),lenk(nsp),ptr);
      else
         %[codebook,ptr] = deSFcode(biny,20,ptr);  codebook=codebook-1;    %<==== modified Jan 20, 2015
       
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [codebook,ptr] = deSFcode(biny,17,ptr);  codebook=codebook-1;  %<====2021年4月25日修改
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         
        [rk{nsp},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(nsp),thd(nsp),ptr);
      end
   else
      rk{nsp}=ones(1,lenk(nsp));
   end
   %nsp, rk{nsp}
end

%decode rk{1}:  %<===== modified Dec 14/15, 2014
%if thd(1)>1
 %  [rk{1},ptr]=de_Kside_new(biny,thd(1),lenk(1),ptr);
%else
 %  rk{1}=ones(1,lenk(1));
% %end
% 
%      fid=fopen('mRk1.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%      fwrite(fid,uint32(rk{1}),'uint32');
%      fclose(fid);
%      fid=fopen('mRk2.txt','w'); %写的方式打开文件（若不存在，建立文件）；
%      fwrite(fid,uint32(rk{2}),'uint32');
%      fclose(fid);
%synthesize r ------------------------------------------------------------------
for nsp=nsep:-1:1
   rrw=rrw+thd(nsp);
   rrw=separate_inv(rsep{nsp},rrw,rk{nsp});
end
