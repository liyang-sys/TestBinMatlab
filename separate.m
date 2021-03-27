function [sep, rw, rk]=separate(r,thd)

len=length(r);

sep=zeros(1,len);
rw=r; ptrw=1;    rk=r; ptrk=1;
for ia=1:len
   if r(ia)>thd
      sep(ia)=1;
      rw(ptrw)=r(ia);  ptrw=ptrw+1;
   else
      rk(ptrk)=r(ia);  ptrk=ptrk+1;
   end
end

rw=rw(1:ptrw-1);  rk=rk(1:ptrk-1);
