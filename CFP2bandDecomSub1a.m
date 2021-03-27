function b=CFP2bandDecomSub1a(a,tanTheta)
%The only difference from "Sub1" is the order, which makes the
%implementation easier for the "Odd1".

sz=size(a);
scl2=1/(1+tanTheta*tanTheta);

b=a;
%------------------------------------------------------------------------------
b(2:4:sz(1)-2,:) = a(2:4:sz(1)-2,:) - tanTheta*a(4:4:sz(1),:);
b(4:4:sz(1),:) = tanTheta*a(2:4:sz(1)-2,:) + a(4:4:sz(1),:);
a=b;
b(4:4:sz(1)-2,:) = a(4:4:sz(1)-2,:) - tanTheta*a(6:4:sz(1),:);
b(6:4:sz(1),:) = tanTheta*a(4:4:sz(1)-2,:) + a(6:4:sz(1),:);
%------------------------------------------------------------------------------


b=flipud(b); a=b;
%------------------------------------------------------------------------------
b(2:4:sz(1)-2,:) = a(2:4:sz(1)-2,:) - tanTheta*a(4:4:sz(1),:);
b(4:4:sz(1),:) = tanTheta*a(2:4:sz(1)-2,:) + a(4:4:sz(1),:);
a=b;
b(4:4:sz(1)-2,:) = a(4:4:sz(1)-2,:) - tanTheta*a(6:4:sz(1),:);
b(6:4:sz(1),:) = tanTheta*a(4:4:sz(1)-2,:) + a(6:4:sz(1),:);
%------------------------------------------------------------------------------
b=flipud(b);


a=b;
b(1,:)=a(1,:)-a(2,:)*tanTheta;    b(2,:)=a(1,:)*tanTheta+a(2,:); 
b(sz(1),:)=a(sz(1),:)-tanTheta*a(sz(1)-1,:);    b(sz(1)-1,:)=a(sz(1),:)*tanTheta+a(sz(1)-1,:); 


a=b;
b(1:2:sz(1),:) = a(1:2:sz(1),:)+a(2:2:sz(1),:);
b(2:2:sz(1),:) = a(1:2:sz(1),:)-a(2:2:sz(1),:);
b=b/sqrt(2);

b=scl2*b;
