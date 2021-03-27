function coef=coef_sign_3d_inv(cf,sn,n)

whos 
len=length(n);
N=zeros(1,3); N(1)=max(n(1,:)); N(2)=max(n(2,:)); N(3)=max(n(3,:));

sn=sign(double(sn)-0.5);

coef=zeros(N); ptr=0;
for ia=1:len
   coef(n(1,ia),n(2,ia),n(3,ia))=cf(ia);
   if cf(ia)>0
      ptr=ptr+1;
      coef(n(1,ia),n(2,ia),n(3,ia))=coef(n(1,ia),n(2,ia),n(3,ia))*sn(ptr);
   end
end
