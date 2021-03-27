function x=prefilter_2point(x)

s=3/4; P=-3/16; U=0.5;
%s=1; P=0; U=0;

if size(x,1)~=4
   fprintf('\n The input length is not correct! \n');
end

x(4,:)=x(4,:)-x(1,:);   x(1,:)=x(1,:)+0.5*x(4,:);
x(3,:)=x(3,:)-x(2,:);   x(2,:)=x(2,:)+0.5*x(3,:);

x(3:4,:)=s*x(3:4,:);
x(4,:)=x(4,:)+P*x(3,:);   x(3,:)=x(3,:)+U*x(4,:);

x(2,:)=x(2,:)-0.5*x(3,:);  x(3,:)=x(3,:)+x(2,:);   
x(1,:)=x(1,:)-0.5*x(4,:);  x(4,:)=x(4,:)+x(1,:);   

%Use the following simple method to find the matrix M:
%a=rand(4,4); 
%x=prefilter_2point(a);
%M=x/a;
%
%The obtained M is: 
%   224   -18    18    32
%    48   215    41   -48
%   -48    41   215    48
%    32    18   -18   224
%multiplied by 1/256.
