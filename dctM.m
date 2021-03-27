function a=dctM(a,M)
% M by M dct of matix a

sz=size(a);
for ia=0:(sz(1)/M-1)
   a(ia*M+1:(ia+1)*M,:)=dct(a(ia*M+1:(ia+1)*M,:));
end
a=a';
for ia=0:(sz(2)/M-1)
   a(ia*M+1:(ia+1)*M,:)=dct(a(ia*M+1:(ia+1)*M,:));
end
a=a';