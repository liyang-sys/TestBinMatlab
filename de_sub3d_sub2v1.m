function [cf0,sn,ptr,cfk]=de_sub3d_sub2(biny,lenz,ptr)

[nn,ptr]=deSFcode(biny,10,ptr); 
if nn==1
   thd=1;
else
   n=nn-2;
   thd=2^n+1;
end
%thdd=thd %%%%%%%%%%%%%%%%%%%%%%%%%%

%decoding cf1k -------------------------------------------------
lB=biny(ptr); ptr=ptr+1;
[z1,ptr]=de_zone_sub(biny,lB,ptr);
len1=length(z1); lenw1=sum(z1); lenk1=len1-lenw1;
if thd==2
   flg=biny(ptr); ptr=ptr+1;
   if flg==0 %p<0.33
      lB=biny(ptr); ptr=ptr+1;
      [c,ptr]=de_zone_sub(biny,lB,ptr); cf1k=c+1;
   else
      flg=biny(ptr); ptr=ptr+1;
      if flg==0  %p<0.36
         lB=biny(ptr); ptr=ptr+1;
         [c,ptr]=de_zone_sub2(biny,lB,ptr); cf1k=c+1;
      else %p>0.36
         [c,ptr]=de_z0(biny,lenk1,ptr); cf1k=c+1;
      end
   end
elseif thd==3
   lB=biny(ptr); ptr=ptr+1;
   [z1k,ptr]=de_zone_sub(biny,lB,ptr); 
   len=length(z1k); lenw=sum(z1k); lenk=len-lenw;
   
   flg=biny(ptr); ptr=ptr+1;
   if flg==0 %p<0.33
      lB=biny(ptr); ptr=ptr+1;
      [c,ptr]=de_zone_sub(biny,lB,ptr); cf1kk=c+1;
   else
      flg=biny(ptr); ptr=ptr+1;
      if flg==0  %p<0.36
         lB=biny(ptr); ptr=ptr+1;
         [c,ptr]=de_zone_sub2(biny,lB,ptr); cf1kk=c+1;
      else %p>0.36
         [c,ptr]=de_z0(biny,lenk,ptr); cf1kk=c+1;
      end
   end
   cf1kw=3*ones(1,lenw);
   cf1k=separate_inv(z1k,cf1kw,cf1kk);
elseif thd>=5
   
   thdh=ceil(thd/2);
   lB=biny(ptr); ptr=ptr+1;
   [z1k,ptr]=de_zone_sub(biny,lB,ptr);    
   len=length(z1k); lenw=sum(z1k); lenk=len-lenw;
   
   [z1kk,ptr]=de_z0(biny,lenk,ptr);
   lenkw=sum(z1kk); lenkk=lenk-lenkw;
   
   [cf1kw,ptr]=de_2n_code(biny,lenw,floor(thd/4),ptr);
   [cf1kkw,ptr]=de_2n_code(biny,lenkw,floor(thd/4),ptr);
   
   cf1kk=separate_inv(z1kk,cf1kkw+1,ones(1,lenkk));
   cf1k=separate_inv(z1k,cf1kw+thdh,cf1kk);
end

%decoding sn ---------------------------------------------------
lencf1w=sum(z1);
if thd>1
   lensn=lencf1w+sum(sign(cf1k-1));
else
   lensn=lencf1w;
end
sn=biny(ptr:ptr+lensn-1); ptr=ptr+lensn;
%sn=sign(double(sn)-0.5);

%decoding cf2k -------------------------------------------------
if nn<=3
   thd2=2^(nn-1);
else
   thd2=2^(nn-2);
end

cfk=cell(1,20); zz=cell(1,20); thdn=cell(1,20);
flg=biny(ptr); ptr=ptr+1;
decomp=1; thdd=thd2;
while flg>0
   if decomp==1
      cs=1; [zz{decomp},cfk{decomp},ptr,thdn{decomp}]=de_sub3d_sub2v1_sub(biny,thdd,ptr,cs,lencf1w);
   elseif decomp==2
      cs=2; [zz{decomp},cfk{decomp},ptr,thdn{decomp}]=de_sub3d_sub2v1_sub(biny,thdd,ptr,cs);
   else
      cs=3; [zz{decomp},cfk{decomp},ptr,thdn{decomp}]=de_sub3d_sub2v1_sub(biny,thdd,ptr,cs);
   end
   flg=biny(ptr); ptr=ptr+1; 
   thdd=thdn{decomp}*2;
   decomp=decomp+1; 
end
decomp=decomp-1;
if decomp>=1
   lencfw=sum(zz{decomp});
else
   lencfw=sum(z1);
end

[cfw,inv,ptr]=de_cfw2(biny,lencfw,ptr);

%--------------------------------------------------------------------------
if decomp>=1
   for dec=decomp:-1:1
      cfw=separate_inv(zz{dec},cfw+thdn{dec},cfk{dec});
      %if dec==1, cfw0=cfw; end %<=============== ?????????????????
   end
end
if thd>1
   cf0=separate_inv(z1,cfw+thd,cf1k) -1;
else
   cf0=separate_inv(z1,cfw+thd,ones(1,lenk1)) -1;
end
