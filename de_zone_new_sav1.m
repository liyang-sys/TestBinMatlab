function [z,r,ptr]=de_zone_new(bin,ptr)

th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];
cbook=17;
lB=bin(ptr); ptr=ptr+1;

%first sep: ==============================================================
[idx,ptr]=decode_stationary_source_lenr(bin,3,1,ptr); thd1=th(idx); %%%%%%%%%%%%%%%%%%%%%

%decoding sep: ------------------------------------------------------
lBs=bin(ptr); ptr=ptr+1;
flg=bin(ptr); ptr=ptr+1;
if flg==1
   [rs,ptr]=de_zone_sub_new(bin,ptr);
else
   [rs,ptr]=de_runs_2sepsA(bin,cbook,ptr);
end
sep1=GolombInv(rs,lBs);

lenk1=length(sep1)-sum(sep1);
if thd1>1
   flg=bin(ptr);  ptr=ptr+1;
   if flg>0
      codebook=bin2dec(char(bin(ptr:ptr+3)+48));  ptr=ptr+4;
      [rk1,ptr]=decode_stationary_source_Nsym_lenr(bin,codebook,lenk1,thd1,ptr);
   else
      [rk1,ptr]=de_Kside_new(bin,thd1,lenk1,ptr);   
   end
else
   rk1=ones(1,lenk1);
end

%second sep: =============================================================
flg=bin(ptr); ptr=ptr+1;
if flg==1
   [idx,ptr]=decode_stationary_source_lenr(bin,3,1,ptr); thd2=th(idx); 
   %decoding sep2: ------------------------------------------------------
   lBs=bin(ptr); ptr=ptr+1;
   [rs,ptr]=de_zone_sub_new(bin,ptr);

   sep2=GolombInv(rs,lBs);
   %decoding rk2: ------------------------------------------------------
   lenk2=length(sep2)-sum(sep2);
   if thd2>1
      flg=bin(ptr);  ptr=ptr+1;
      if flg>0
         codebook=bin2dec(char(bin(ptr:ptr+3)+48));  ptr=ptr+4;  %modified Nov. 21, 2014
         [rk2,ptr]=decode_stationary_source_Nsym_lenr(bin,codebook,lenk2,thd2,ptr);
      else
         [rk2,ptr]=de_Kside_new(bin,thd2,lenk2,ptr);
      end
   else
      rk2=ones(1,lenk2);
   end
   %decode rw2: -------------------------------------------------------
   [rw2,ptr]=de_zone_sub_new(bin,ptr);
   rw1=separate_inv(sep2,rw2+thd2,rk2);
else
   [rw1,ptr]=de_zone_sub_new(bin,ptr); 
end


%==========================================================
r=separate_inv(sep1,rw1+thd1,rk1);
z=GolombInv(r,lB);
