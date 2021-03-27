function [sep, rw, rk]=separate(r,thd)

len=length(r);

sep=zeros(1,len);
rw=[]; ptr=1; rk=r;
for ia=1:len
   if r(ia)>thd
      sep(ia)=1;
      rw=[rw r(ia)];
      rk=[rk(1:ptr-1) rk(ptr+1:length(rk))];
   else
      ptr=ptr+1;
   end
end
