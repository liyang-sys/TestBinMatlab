function [r0,c0,N0]=modifyHilbert2D_BlockDeformation(r,c,idx,H,p2s)

%Find the 'base square': -----------------------------------------------------------
if idx>8
   c{8}=int16(c{8}); r{8}=int16(r{8}); dim=256;
   for ia=9:idx
      h1c=c{ia-1}; h1r=r{ia-1}+dim; h2c=h1c+dim; h2r=h1r; 
      v1c=r{ia-1}; v1r=c{ia-1}; v2r=dim-1-v1r;
      dim=dim+dim;
      v2c=dim-1-v1c;
      c{ia}=[v1c h1c h2c v2c];  r{ia}=[v1r h1r h2r v2r];
   end
else
   dim=p2s(idx+1);
end
c0=int16(c{idx})+1; r0=int16(r{idx})+1;  
%----------------------------------------------------------------------------------

delH=double(H)-dim;
if delH~=0
   [idxinc,inc,len_inc]=find_2s_power(abs(delH),p2s);  inc=sign(delH)*inc;

   %The 'find_2s_inc' below regulizes the inc's found by 'find_2s_power' above, 
   %for example, from inc=[64 32 16 8 1] to inc=[128 -8 1]:
   if length(inc)>=3
      inc=find_2s_inc(dim,delH,inc,p2s); len_inc=length(inc);
   end
   %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   N0=dim*dim; Nsub=N0;
   subdim=abs(inc(1))*2;
   nsub=dim/subdim;  %the number of sub-squares that needs to be stretched.
   st0=ones(1,nsub); nsubtem=1; L=0; %initialization
   for ia=1:len_inc
      [r0,c0,st0,L,Nsub,nsubtem,N0]=modify_Hilbert2D_sub(dim,inc(ia),r0,c0,N0,Nsub,st0,nsubtem,L+1);
   end
else
   N0=length(r0);
end