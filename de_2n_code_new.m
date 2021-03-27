function [c2n,ptr,ck,c1k]=de_2n_code_new(bin,len,maxc,typ,ptr)

if typ==1
   thd=maxc/2; n=log2(thd); 
   if n>0.5
      flg=bin(ptr); ptr=ptr+1;
      if flg==0
         thdh=thd/2;
         [z,ptr]=de_z0(bin,len,ptr);
         [z1,ptr]=de_z0(bin,sum(z),ptr);
         [z2,ptr]=de_z0(bin,sum(z1),ptr);
         if n>1.5
            [ck,ptr]=de_2n_code_sub1(bin,n-1,length(z)-sum(z),ptr);
            [c1k,ptr]=de_2n_code_sub1(bin,n-1,length(z1)-sum(z1),ptr); c1k=c1k+thdh;
            [c2,ptr]=de_2n_code_sub(bin,n-1,z2,ptr); c2=c2+thd;
         else
            ck=ones(1,length(z)-sum(z));
            c1k=ones(1,length(z1)-sum(z1))+1;
            c2=z2+3;
         end
         c1=separate_inv(z1,c2,c1k);
         c2n=separate_inv(z,c1,ck);
      else
         [z,ptr]=de_z0(bin,len,ptr); 
         lenw=sum(z); lenk=len-lenw;
         [zk,ptr]=de_z0(bin,lenk,ptr);
         [zw,ptr]=de_z0(bin,lenw,ptr);
         if n>1.5
            [ck,ptr]=de_2n_code_sub(bin,n-1,zk,ptr);
            [cw,ptr]=de_2n_code_sub(bin,n-1,zw,ptr); cw=cw+thd;
         else
            ck=zk+1;
            cw = zw+1 +thd;
         end
         c2n=separate_inv(z,cw,ck);
      end
   else
      [z,ptr]=de_z0(bin,len,ptr); 
      c2n=z+1;
   end
else
   thd=maxc/3; n=log2(thd);
   [z,ptr]=de_z0(bin,len,ptr); 
   lenw=sum(z); lenk=len-lenw;
   if n>0.5
      [zk,ptr]=de_z0(bin,lenk,ptr);
      [zw,ptr]=de_z0(bin,lenw,ptr);
      if n>1.5
         [ck,ptr]=de_2n_code_sub(bin,n-1,zk,ptr);
         [cw,ptr]=de_2n_code_sub(bin,n,zw,ptr); cw=cw+thd;
      else
         ck=zk+1;
         [cw,ptr]=de_2n_code_sub(bin,n,zw,ptr); cw=cw+thd;
      end   
      c2n=separate_inv(z,cw,ck);
   else
      [zw,ptr]=de_z0(bin,lenw,ptr); cw=zw+2;
      ck=ones(1,lenk);
      c2n=separate_inv(z,cw,ck);
   end
end
