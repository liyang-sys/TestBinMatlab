function b=CFP2bandDecomOdd2(a,tanTheta)
%To reconstruct, use CFP2bandReconSub2.m.

sz=size(a);
tanTheta2=tanTheta*tanTheta; scl2=1/(1+tanTheta2);

b=a;
b(1,:)=a(1,:)-a(2,:)*tanTheta;    b(2,:)=a(1,:)*tanTheta+a(2,:); 

a=b;
%------------------------------------------------------------------------------
b(4:4:sz(1)-5,:) = a(4:4:sz(1)-5,:) - tanTheta*a(6:4:sz(1)-3,:);
b(6:4:sz(1)-3,:) = tanTheta*a(4:4:sz(1)-5,:) + a(6:4:sz(1)-3,:);
a=b;
b(2:4:sz(1)-7,:) = a(2:4:sz(1)-7,:) - tanTheta*a(4:4:sz(1)-5,:);
b(4:4:sz(1)-5,:) = tanTheta*a(2:4:sz(1)-7,:) + a(4:4:sz(1)-5,:);
%------------------------------------------------------------------------------

b=flipud(b); a=b;
%------------------------------------------------------------------------------
b(1:4:sz(1)-4,:) = a(1:4:sz(1)-4,:) - tanTheta*a(3:4:sz(1)-2,:);
b(3:4:sz(1)-2,:) = tanTheta*a(1:4:sz(1)-4,:) + a(3:4:sz(1)-2,:);
a=b;
b(3:4:sz(1)-2,:) = a(3:4:sz(1)-2,:) - tanTheta*a(5:4:sz(1),:);
b(5:4:sz(1),:) = tanTheta*a(3:4:sz(1)-2,:) + a(5:4:sz(1),:);
%------------------------------------------------------------------------------
b=flipud(b);

a=b;

v=b(sz(1),:)*(1+tanTheta)/(1-tanTheta); %b(sz(1),:) is x10 in the paper
w=b(sz(1),:) + tanTheta*v;
u=(1+tanTheta2)*b(sz(1)-1,:) - tanTheta*v; %b(sz(1),:) is x(9) in the paper

b(sz(1)-3,:) = a(sz(1)-3,:) - tanTheta*u;
b(sz(1)-1,:) = tanTheta*a(sz(1)-3,:) + u;


a=b;
b(1:2:sz(1)-1,:) = a(1:2:sz(1)-1,:)+a(2:2:sz(1)-1,:);
b(2:2:sz(1)-1,:) = a(1:2:sz(1)-1,:)-a(2:2:sz(1)-1,:);
b=[b(1:sz(1)-1,:); 2*w];
b=b/sqrt(2);


b=scl2*b;
