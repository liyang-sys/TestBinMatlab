function [biny]=en_sub3d_sub2(cf0,sn,maxcf0)

cf0=cf0+1; %<=== treat cf0 as runs!
maxcf=double(maxcf0+1);
nc=hist(double(cf0),[1:maxcf]);

thd_arr=[1 2 3 5 9 17 33 65 129 257];
nn=1; thd=thd_arr(nn); len=length(cf0);
while sum(nc(1:thd))/len<0.7, nn=nn+1; thd=thd_arr(nn); end
%thdd=thd %%%%%%%%%%%%

if thd>=3 %thd=2 condition should not be included, because '0' can be less compared with '1' ('+1' and '-1'!)
   thdh=ceil(thd/2);
   p_decay=sum(nc(thdh+1:thd))/sum(nc(2:thdh)); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   if p_decay>0.5,    nn=nn+1; thd=thd_arr(nn);    end
end
%thd %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fprintf('\n000000000000\n');

[z1,cf1,cf1k]=separate(cf0,thd);   cf1=cf1-thd;  nc1k=nc(1:thd); nc1=nc(thd+1:length(nc));
[r1,lB]=Golomb0(z1); lB=uint8(lB);  [bin1,sep]=en_zone_sub(r1,lB);  %<== encoding z1 

if thd==2
   [r1k,lB,p]=Golomb0(cf1k-1); lB=uint8(lB); %p%%%%%%%%%%%%%%%%  
   c=cf1k-1; p=sum(c)/length(c);
   if p<0.33
      [rc,lB]=Golomb0(c); lB=uint8(lB);  [bin1b,sep]=en_zone_sub(rc,[0 lB]);  %<== encoding cf1kk
   elseif p<0.36
      [rc,lB]=Golomb0(c); lB=uint8(lB);  [bin1b,sep]=en_zone_sub2(rc,[1 0 lB]);  %<== encoding cf1kk
   else
      bin1b=en_z0(c); bin1b=[1 1 bin1b]; %<== encoding cf1kk
   end
   bin1=[bin1 bin1b];
elseif thd==3
   [z1k,cf1kw,cf1kk]=separate(cf1k,2);  %all 3's in cf1kw 
   [r1k,lB,p]=Golomb0(z1k); lB=uint8(lB);  [bin1b1,sep]=en_zone_sub(r1k,lB);  %<== encoding z1k, it is assumed p<0.3

   c=cf1kk-1; p=sum(c)/length(c)
   if p<0.33
      [rc,lB]=Golomb0(c); lB=uint8(lB);  [bin1b2,sep]=en_zone_sub(rc,[0 lB]);  %<== encoding cf1kk
   elseif p<0.36
      [rc,lB]=Golomb0(c); lB=uint8(lB);  [bin1b2,sep]=en_zone_sub2(rc,[1 0 lB]);  %<== encoding cf1kk
   else
      bin1b2=en_z0(c); bin1b2=[1 1 bin1b2]; %<== encoding cf1kk
   end
   bin1=[bin1 bin1b1 bin1b2];   %length(bin1b)
elseif thd>=5
   thdh=ceil(thd/2);
   [z1k,cf1kw,cf1kk]=separate(cf1k,thdh);  cf1kw=cf1kw-thdh; 
   [r1k,lB,p]=Golomb0(z1k); lB=uint8(lB); 
   [bin1b1,sep]=en_zone_sub(r1k,lB);  %<== encoding z1k
   
   [z1kk,cf1kkw,cf1kkk]=separate(cf1kk,1); cf1kkw=cf1kkw-1; %separate "1" out to code
   bin1b2=en_z0(z1kk);

   bin1b3=en_2n_code(cf1kw,nc1k(thdh+1:thd));
   bin1b4=en_2n_code(cf1kkw,nc1k(2:thdh));
   
   bin1=[bin1 bin1b1 bin1b2 bin1b3 bin1b4];
end

%-------------------------------------------------------------------------------------
if nn<=3
   thd2=2^(nn-1);
else
   thd2=2^(nn-2);
end


biny=[uint8(SFcode(nn,10)) bin1 sn];

cfw=cf1; ncw=nc1; decomp=0; thdn=thd2;

while  ( length(cfw)>100 )   &   ( 1.6*thdn<max(cfw) )   &   ( sum(ncw(thdn+1:length(ncw)))>20 )
   %if decomp==0, cfw0=cfw; end %<=============== ?????????????????
   if decomp==0
      cs=1; [bin,cfw,ncw,thdn,cf2k]=en_sub3d_sub2v1_sub(cfw,ncw,thdn,cs); %shist(cf2k);
   elseif decomp==1
      cs=2; [bin,cfw,ncw,thdn,cf2ka]=en_sub3d_sub2v1_sub(cfw,ncw,thdn,cs); %shist(cf2ka);
   else
      cs=3; [bin,cfw,ncw,thdn,cf2kb]=en_sub3d_sub2v1_sub(cfw,ncw,thdn,cs); %shist(cf2kb);
   end
   biny = [biny 1 bin];
   thdn=2*thdn; 
   decomp=decomp+1;
end


biny=[biny 0 en_cfw2(cfw)];
