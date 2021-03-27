function r=separate_inv(sep,rw,rk)

len=length(sep);  r=zeros(1,len);
ptrk=1; ptrw=1; 
for ia=1:len
    if ia==8045
        ii=ia;
    end
   if sep(ia)<0.5
      r(ia)=rk(ptrk); ptrk=ptrk+1;
   else
      r(ia)=rw(ptrw); ptrw=ptrw+1;
   end
end
