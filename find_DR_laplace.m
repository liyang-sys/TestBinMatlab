function DR=find_DR_laplace(alpha,h)

e_ah = exp(-alpha*h);    e_ah2 = sqrt(e_ah);

m0 = 1;
C = alpha/(1-e_ah); %<=== normalization coefficient, "1/probablity", not "center of weight"!!!
Ch=C*h;  Chh=Ch*h;

m1 = (1 -Ch*e_ah)/(alpha);
m2 = (2*m1 -Chh*e_ah)/(alpha);

m01 = C*(1-e_ah2)/alpha;
m11 = (m01 -Ch*0.5*e_ah2)/alpha;
m21 = (2*m11 -Chh*0.25*e_ah2)/alpha;

m02 = 1-m01;
m12 = (m02 - Ch*(e_ah -0.5*e_ah2))/alpha;
m22 = (2*m12 - Chh*(e_ah-0.25*e_ah2))/alpha;

D0=m2-m1*m1/m0;
D1=m21-m11*m11/m01;
D2=m22-m12*m12/m02;
H=-m01*log2(m01)-m02*log2(m02);

delD=D0-(D1+D2);
DR=delD/H;





%checking ========================
%t=[0:0.0001:1]*h; dt=0.0001*h;
%exp_t=exp(-alpha*t)*dt;
%exp_t1=exp_t.*t;  exp_t2=exp_t1.*t;
%I0=sum(exp_t)-0.5*(exp_t(1)+exp_t(10001));
%Cc=1/I0;  %<=== normalization coefficient, "1/probability"

%m0c=Cc*I0;
%m1c=Cc*(sum(exp_t1)-0.5*(exp_t1(1)+exp_t1(10001)));
%m2c=Cc*(sum(exp_t2)-0.5*(exp_t2(1)+exp_t2(10001)));

%m01c=Cc* (sum(exp_t(1:5001) )-0.5*(exp_t(1)+exp_t(5001)));
%m11c=Cc* (sum(exp_t1(1:5001) )-0.5*(exp_t1(1)+exp_t1(5001)));
%m21c=Cc* (sum(exp_t2(1:5001) )-0.5*(exp_t2(1)+exp_t2(5001)));

%m02c=Cc* (sum(exp_t(5001:10001) )-0.5*(exp_t(5001)+exp_t(10001)));
%m12c=Cc* (sum(exp_t1(5001:10001) )-0.5*(exp_t1(5001)+exp_t1(10001)));
%m22c=Cc* (sum(exp_t2(5001:10001) )-0.5*(exp_t2(5001)+exp_t2(10001)));

%dc=(Cc-C)/C, 
%dm1=(m1-m1c)/m1, dm2=(m2-m2c)/m2, dm0=(m0-m0c)/m0
%dm11=(m11-m11c)/m11, dm2=(m21-m21c)/m21, dm01=(m01-m01c)/m01
%dm1=(m12-m12c)/m12, dm22=(m22-m22c)/m22, dm02=(m02-m02c)/m02

