function [ img ] = tmo( hdr, ldrtohdrname, f )
%��hdrͨ��tmoӳ�䵽��Ӧ��img
%   ldrtohdrname��ԭʼldrtohdrӳ�䣬ͨ��f������mh��ml��Ȩ�أ��õ���Ӧ��tmo��

fid1=fopen(ldrtohdrname,'r');
ldrtohdr=fread(fid1,'uint16');
ldrtohdr=ldrtohdr';
fclose(fid1);

ml=Linearization(ldrtohdr);
mh=0:32767;
m=f*mh+(1-f)*ml;

[h,w,d]=size(hdr);
img=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            t=hdr(ii,jj,kk);
            v=m(t+1);
            img(ii,jj,kk)=v;
        end
    end
end

end

