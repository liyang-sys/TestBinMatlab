function spec=FFT_periodic_reverse_extension(x)
%x=1:16;
%x=rand(1,8)*10; 

%xi=[x  x(1)+x(end)-x];   N=length(xi);
%ph=-1i*pi/N;
%fft(xi).*exp(ph*(0:N-1))/sqrt(N) %%%%%%%%%%%%%%%%%%%%
%sdct=dct(x)

%N=length(x);
[N,W]=size(x);
if round(N/2)*2==N
   ext=-x(2:end-1,:);     for ia=1:W, ext(:,ia)=ext(:,ia)+x(1,ia)+x(end,ia); end
   xi=[x; ext];
   s=fft(xi)/sqrt(2*(N-1));
   spec=zeros(N,W);
   spec(1,:)=real(s(1,:)); spec(N,:)=real(s(N,:));
   for ia=2:2:N-2
      spec(ia,:)=real(s(ia,:));
      spec(ia+1,:)=imag(s(ia,:));
   end
else
end
spec(1,:)=spec(1,:)/sqrt(2);
spec(N,:)=spec(N,:)/sqrt(2);
%sum(xi.^2)-2*sum(spec.^2)


%x=[0 0 0 0 0 0 0  0   -0.1  0.25  0.75  1.1   1 1 1 1];  x=x/max(x)*100;
%figure; plot(xi,'r.-'); hold on;  plot(x,'b.-'); grid

