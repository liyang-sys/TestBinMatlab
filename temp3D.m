%function [n0,N0]=modifyHilbert3D_BlockDeformation(n,k0,k,H,p2s)
H=88; k0=3; k=6; W=64;

p2s=[1 2 4 8 16 32 64 128 256 512 1024 2048 4096];


%Find the 'base square': -----------------------------------------------------------
load H3L3
%m=double(H3cutted(3,3,n)+1)'; n=m; 
n=n'; m(1,:)=n(2,:);  m(2,:)=n(3,:);  m(3,:)=n(1,:);
%----------------------------------------------------------------------------------

dim=max(max(max(m)));
delH=double(H)-dim;
if delH~=0
   [idxinc,inc,len_inc]=find_2s_power(abs(delH),p2s);  inc=sign(delH)*inc;

   %The 'find_2s_inc' below regulizes the inc's found by 'find_2s_power' above, 
   %for example, from inc=[64 32 16 8 1] to inc=[128 -8 1]:
   if length(inc)>=3
      inc=find_2s_inc(dim,delH,inc,p2s); len_inc=length(inc);
   end
   inc
   %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   N0=dim*dim*(2^k); Nsub=N0;
   subdim=abs(inc(1))*2;
   nsub=dim/subdim;  %the number of sub-squares that needs to be stretched.
   st0=ones(1,nsub); nsubtem=1; L=0; %initialization
   for ia=1:len_inc
      [r0,c0,st0,L,Nsub,nsubtem,N0]=modify_Hilbert3D_sub(dim,inc(ia),r0,c0,N0,Nsub,st0,nsubtem,L+1);
   end
else
   N0=length(r0);
end
