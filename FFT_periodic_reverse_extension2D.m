function a=FFT_periodic_reverse_extension2D(a,M)

sz=size(a);
for ia=0:(sz(1)/M-1)
   a(ia*M+1:(ia+1)*M,:)=FFT_periodic_reverse_extension(a(ia*M+1:(ia+1)*M,:));
end
a=a';
for ia=0:(sz(2)/M-1)
   a(ia*M+1:(ia+1)*M,:)=FFT_periodic_reverse_extension(a(ia*M+1:(ia+1)*M,:));
end
a=a';
