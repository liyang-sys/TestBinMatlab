function b=CFP2bandDecomOdd1(a,tanTheta)
%To reconstruct, use CFP2bandReconSub1a.m.

sz=size(a);
tanTheta2=tanTheta*tanTheta; scl2=1/(1+tanTheta2);

b=a;
%------------------------------------------------------------------------------
%b(2:4:sz(1)-2,:) = a(2:4:sz(1)-2,:) - tanTheta*a(4:4:sz(1),:);
%b(4:4:sz(1),:) = tanTheta*a(2:4:sz(1)-2,:) + a(4:4:sz(1),:);
b(2:4:sz(1)-5,:) = a(2:4:sz(1)-5,:) - tanTheta*a(4:4:sz(1)-3,:);
b(4:4:sz(1)-3,:) = tanTheta*a(2:4:sz(1)-5,:) + a(4:4:sz(1)-3,:);
a=b;
%b(4:4:sz(1)-2,:) = a(4:4:sz(1)-2,:) - tanTheta*a(6:4:sz(1),:);
%b(6:4:sz(1),:) = tanTheta*a(4:4:sz(1)-2,:) + a(6:4:sz(1),:);
b(4:4:sz(1)-3-4,:) = a(4:4:sz(1)-3-4,:) - tanTheta*a(6:4:sz(1)-1-4,:);
b(6:4:sz(1)-1-4,:) = tanTheta*a(4:4:sz(1)-3-4,:) + a(6:4:sz(1)-1-4,:);
%------------------------------------------------------------------------------


b=flipud(b); a=b;
%------------------------------------------------------------------------------
%b(2:4:sz(1)-2,:) = a(2:4:sz(1)-2,:) - tanTheta*a(4:4:sz(1),:);
%b(4:4:sz(1),:) = tanTheta*a(2:4:sz(1)-2,:) + a(4:4:sz(1),:);
b(1:4:sz(1)-2,:) = a(1:4:sz(1)-2,:) - tanTheta*a(3:4:sz(1),:);
b(3:4:sz(1),:) = tanTheta*a(1:4:sz(1)-2,:) + a(3:4:sz(1),:);
a=b;
%b(4:4:sz(1)-2,:) = a(4:4:sz(1)-2,:) - tanTheta*a(6:4:sz(1),:);
%b(6:4:sz(1),:) = tanTheta*a(4:4:sz(1)-2,:) + a(6:4:sz(1),:);
b(3:4:sz(1)-4,:) = a(3:4:sz(1)-4,:) - tanTheta*a(5:4:sz(1)-2,:);
b(5:4:sz(1)-2,:) = tanTheta*a(3:4:sz(1)-4,:) + a(5:4:sz(1)-2,:);
%------------------------------------------------------------------------------
b=flipud(b);

a=b;
if sz(1)>3,   b(1,:)=a(1,:)-a(2,:)*tanTheta;    b(2,:)=a(1,:)*tanTheta+a(2,:);   end

v=b(sz(1),:)*(1+tanTheta)/(1-tanTheta); %b(sz(1),:) is x10 in the paper
w=b(sz(1),:) + tanTheta*v;
u=(1+tanTheta2)*b(sz(1)-1,:) - tanTheta*v; %b(sz(1),:) is x(9) in the paper
%w = (1 + tanTheta*(1+tanTheta)/(1-tanTheta) )*b(sz(1),:); %b(sz(1),:) is x10 in the paper

if sz(1)>3
   idx=sz(1)-3;
else
   idx=1;
end
%b(sz(1)-3,:) = a(sz(1)-3,:) - tanTheta*u;
%b(sz(1)-1,:) = tanTheta*a(sz(1)-3,:) + u;
b(idx,:) = a(idx,:) - tanTheta*u;
b(sz(1)-1,:) = tanTheta*a(idx,:) + u;


a=b;
b(1:2:sz(1)-1,:) = a(1:2:sz(1)-1,:)+a(2:2:sz(1)-1,:);
b(2:2:sz(1)-1,:) = a(1:2:sz(1)-1,:)-a(2:2:sz(1)-1,:);
b=[b(1:sz(1)-1,:); 2*w];
b=b/sqrt(2);


b=scl2*b;
