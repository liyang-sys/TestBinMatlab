function [c2n,ptr,z]=de_2n_code(bin,len,thd,ptr)

n=log2(thd);

[z,ptr]=de_z0(bin,len,ptr); 
lenw=sum(z); lenk=len-lenw;

if n>=1
   flg=bin(ptr); ptr=ptr+1;
   if flg==1
      %fprintf('\naaaaaaaaaaa\n')
      [zk,ptr]=de_z0(bin,lenk,ptr);
      if n>1
         [ck,ptr]=de_2n_code_sub(bin,n-1,zk,ptr);
      else
         ck=zk+1;
      end
   
      [zw,ptr]=de_z0(bin,lenw,ptr);
      if n>1
         [cw,ptr]=de_2n_code_sub(bin,n-1,zw,ptr); cw=cw+thd;
      else
         cw = zw+1 +thd;
      end

      c2n=separate_inv(z,cw,ck);
   else
      %fprintf('\nbbbbbbbbbbbbbb\n')
      [c2n,ptr,cw,ck]=de_2n_code_sub(bin,n,z,ptr);
   end
else
   c2n=z+1;
end
