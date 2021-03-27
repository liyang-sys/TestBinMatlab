function a=DeRe_using_matrix(a,Mat1,Mat2)

M=length(Mat1);
[H,W]=size(a);
for ia=1:H/M
   idx=(ia-1)*M+1:ia*M;
   a(idx,:)=Mat1*a(idx,:);
end
a=a';

for ia=1:W/M
   idx=(ia-1)*M+1:ia*M;
   a(idx,:)=Mat2*a(idx,:);
end
a=a';
