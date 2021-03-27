function [m0,N0]=modify_Hilbert3D_BlockDeformation(n,k0,k,H,p2s)
 
%Find the 'base square': --------------------------------------------------------------------------------------
if k>k0,
   m0=int32(H3cutted(k0,k,n)'+1);
   tem=m0; m0(2,:)=tem(2,:);  m0(1,:)=tem(3,:);  m0(3,:)=tem(1,:);
else
   m0=n'+1;
   tem=m0; m0(1,:)=tem(2,:);  m0(2,:)=tem(1,:); m0(3,:)=tem(3,:);
end
%--------------------------------------------------------------------------------------------------------------

d0=2^double(k0);
H0=int32(ceil(double(H)/d0)*d0); dic=H-H0;
dim=max(max(max(m0)));
delH=double(H0)-dim;
if delH~=0
   [idxinc,inc,len_inc]=find_2s_power(abs(delH),p2s);  inc=sign(delH)*inc;

   %The 'find_2s_inc' below regulizes the inc's found by 'find_2s_power' above, 
   %for example, from inc=[64 32 16 8 1] to inc=[128 -8 1]:
   if length(inc)>=3
      inc0=inc;
      inc=find_2s_inc(dim,delH,inc0,p2s); len_inc=length(inc);
      MaxDel=0; ia=1;
      while ia<=len_inc && inc(ia)>0
         MaxDel=MaxDel+inc(ia);
         ia=ia+1;
      end
      if MaxDel==dim, inc=inc0; len_inc=length(inc); end
   end
   
   %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   N0=dim*dim*(2^k0); Nsub=N0;
   subdim=abs(inc(1))*2;
   %nsub=dim/subdim  %the number of sub-squares that needs to be stretched.
   nsub=ceil(double(dim)/double(subdim));  %the number of sub-squares that needs to be stretched.
   st0=int32(ones(1,nsub)); nsubtem=1; L=0; %initialization
   for ia=1:len_inc
      [m0,st0,L,Nsub,nsubtem,N0]=modify_Hilbert3D_sub(dim,inc(ia),m0,N0,Nsub,st0,nsubtem,L+1);
   end
else
   nsub=dim/(2^k0);  %the number of sub-squares that will deform.
   st0=int32(ones(1,nsub)); nsubtem=1; L=0; %initialization
   N0=length(m0); Nsub=N0;
end

if dic~=0
   [m0,stnew,L,Nsub,nsubtem,len]=modify_Hilbert3D_sub3D(dim,dic,m0,N0,Nsub,st0,nsubtem,L+1,k0);
end
