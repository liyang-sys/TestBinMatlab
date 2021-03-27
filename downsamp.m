function A=downsamp(A)

sz=ceil(size(A)/2);

A=A(:,1:sz(2));
for ia=1:sz(1)
   A(ia,:) = A(2*ia-1,:);
end
A=A(1:sz(1),:);