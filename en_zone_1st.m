function [bin,xx]=en_zone_1st(r,lB,cr,nc,cri,bin)

th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

%When 1st level p=0.5, There is no need to set p1 for the first separation of z lower than 0.7,
%becuase only for random situation, n(1)/sum(n)=0.5! For severe non-random, n(1)/sum(n) is
%MUCH larger than 0.7!

p1=0.7;
idx=find_thd_idx_round(nc,p1,th); thd1=th(idx)
bin_idx1=encode_stationary_source(idx, 3); 

[sep,rw,rk]=separate(r,thd1);   rw=rw-thd1;

if thd1>1
   bink1=en_Kside_new(rk,thd1,nc(1:thd1));
end


%aaaa=[length(rw) length(rk)]

[crw,k]=k_criterion(rw);
%[crs,k]=k_criterion(Golomb0(sep));
%shist(sep),shist(1-sep)
%crw=0;
if crw<10
   bin_lenr = encode_stationary_source(length(rw),17);
   [binr]=en_r0(rw); %%%%%%%%%%%%%%
   %[rr,ptr]=de_r0(binr,length(rw),1); %<===================
   binw=[bin_lenr binr];
elseif crw<30
   bin_lenr = encode_stationary_source(length(rw),17);
   cbook=4; p=0.8; [binr,sep,rwk,rww]=en_r1(rw,p,cbook);
   %[rr,ptr,sepr,rkr,rwr]=de_r1(binr,length(rw),cbook,1);
   binw=[bin_lenr binr];
else
   [binw,sp]=en_zone_1st_sub(rw,crw,[]);
   fprintf('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n')
   [binww,ssp]=en_zone_sub_new(rw,crw,[]);
   %[rr,ptr]=de_zone_1st_sub(binw,1);
   %length(binw),ptr%%%%%%%%%%%%%
end

%whos rr r

%figure; plot(double(sepr)-double(sep)); %axis([-5000 length(rr+5000) -2 2])
%figure; plot(double(rkr)-double(rwk)); %axis([-5000 length(rr+5000) -2 2])
%figure; plot(double(rwr)-double(rww)); %axis([-5000 length(rr+5000) -2 2])
%figure; plot(double(rr)-double(rw)); %axis([-5000 length(rr+5000) -2 2])

[length(binw), length(binww)]

%[cr,k]=k_criterion(sep)
%shist(sep)

bin=[];

xx=0;