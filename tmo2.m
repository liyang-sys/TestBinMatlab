function [ outarray ] = tmo2( img, ldrtohdrname, tohdr, f )
%��imgӳ�䵽hdr����ldr
%   tohdr���ж���ӳ�䵽hdr����ldr
fid1=fopen(ldrtohdrname,'r');
ldrtohdr=fread(fid1,'uint16');
ldrtohdr=ldrtohdr';
fclose(fid1);

ml=Linearization(ldrtohdr);
mh=0:32767;
mh=mh/32767*255;
m=f*mh+(1-f)*ml;

[h,w,d]=size(img);
outarray=zeros(h,w,d);
if tohdr == 0   %%�ָ�ldrͼ��
    img2ldr=Linearization4_mod(ldrtohdr, m, ml);
    for ii=1:h
        for jj=1:w
            for kk=1:d
              x=img(ii,jj,kk);
              idx=x*32767/255;
              a1=floor(idx)+1; b1=img2ldr(a1);
              a2=a1+1; b2=img2ldr(a2);
              y0=(b2-b1)*(idx+1)+b1*a2-b2*a1;
              outarray(ii,jj,kk)=y0;
            end
        end
    end
else                %%�ָ�hdrͼ��
   [img2hdr, MAX]=Linearization3(m);
   for ii=1:h
       for jj=1:w
           for kk=1:d
               t=img(ii,jj,kk);
               v=img2hdr(round((t*32767)/MAX)+1);
               outarray(ii,jj,kk)=v;
           end
       end
   end
end

