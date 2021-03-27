function ldr=hdr2ldr(hdr0,hdr)

mx=max(max(max(hdr0))); hdr(hdr>mx)=mx; hdr(hdr<0)=0;


[h,w,d]=size(hdr0); N=h*w;
%---------------------------TMO色调映射部分------------------------------------------------------------------
[lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( hdr, 1 );
ldr=zeros(h,w,3);
maxm=max(max(max(hdr)));
hdr255=hdr./maxm.*255.0; 

f=1;
for ia=1:3
      ldr(:,:,ia)= tmo_mod2( hdr255(:,:,ia), lav, m, 1, maxm );
end
%-------------------------------------------------------------------------------------------------------------
