function [ x, y ] = GetTmoCurve( hdri, ldri )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
[h,w,count]=size(hdri);
tmo=zeros(1,65536); 
tempy=zeros(1,65536); tempx=zeros(1,65536); num=0;
for ii=1:h
    for jj=1:w
        for kk=1:count
            t=hdri(ii,jj,kk);
            tmo(t+1)=ldri(ii,jj,kk);
        end
    end
end
for ia=1:65536
    if tmo(ia)~=0
        num=num+1;
        tempy(num)=tmo(ia);
        tempx(num)=ia;
    end
end
y=tempy(1:num);
x=tempx(1:num);

end

