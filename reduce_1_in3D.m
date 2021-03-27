function nd=reduce_1_in3D(n,d)

nd=n; len=length(n); lend=len; id=1;
for ia=1:len
   if n(3,ia)>d
      lend=lend-1;
      nd(:,id:lend)=n(:,ia+1:len);
   else
      id=id+1;
   end
end
nd=nd(:,1:id-1);
