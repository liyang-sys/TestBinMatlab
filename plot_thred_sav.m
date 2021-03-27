p=1./[2:3000];


alpha=-log(p);

T=zeros(1,length(p)); h=T;
for ia=1:length(p)
   [T(ia),h(ia)]=find_thred_laplace(alpha(ia));
end

figure; plot(T); %figure; plot(h)
