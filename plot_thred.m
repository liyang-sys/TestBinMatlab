p=1./[2:2^17];

T0=zeros(1,length(p)); T=T0; h=T;
for ia=1:length(p)
   %[T0(ia),h(ia)]=find_thred_laplace(-log(p(ia)));
   T(ia)=plot_thred_sub(p(ia));
end

T2=T/1.375; T3=T/1.625;
figure; plot(T); hold on; plot(T2);  plot(T3); plot(T0,'r'); %figure; plot(h)

%save Threshold T 
