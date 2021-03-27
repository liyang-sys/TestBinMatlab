function h3 = esti_quant_size_laplace(alpha)
%'alpha' should be less than 16 even with double precision! 

DR0=0.0625; %sub-system with constant pdf p(t)=1 at [0,1]

%h1=1,; h2=1.3;
h1=1.05; h2=1.5; %<======= modified Oct. 29, 2014
DR1=find_DR_laplace(alpha,h1);
DR2=find_DR_laplace(alpha,h2);

rh=1.1;
ia=0;
while abs(rh-1)>0.00001
   h3 = h2 -(h2-h1)/(DR2-DR1) *(DR2-DR0);
   DR3=find_DR_laplace(alpha,h3);
   rh=h3/h2;
   h1=h2; h2=h3; DR1=DR2; DR2=DR3;
   ia=ia+1;
end
%ia, h3, DR3-DR0
