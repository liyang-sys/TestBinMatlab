load H2ext

n1=4; n2=2;

sub=subqcoef{n1,n2};
sub0a=subqcoef{n1-1,n2};   sub0b=subqcoef{n1,n2-1};   sub0c=subqcoef{n1-1,n2-1};

sz=size(sub); len=sz(1)*sz(2); qlen=len/4;

thd=1;
cfA=zeros(1,len); cfB=cfA; cfX=cfA;
ptA=0; ptX=0;
for ny=1:sz(1)
   for nx=1:sz(2)
      %if (  (abs(cf0a(n))>=1 && abs(cf0b(n))>=1)  ||  abs(cf0a(n))>=3  ||  abs(cf0b(n))>=3 )
      %if (  (abs(cf0a(n))>=1 && abs(cf0b(n))>=1)  ||  abs(cf0a(n))>=3  ||  abs(cf0b(n))>=3  ||  abs(cf0c(n))>=3 )
      %if (  (abs(cf0a(n))>=1 && abs(cf0b(n))>=1 && abs(cf0c(n))>=1)  ||  abs(cf0a(n))>=3  ||  abs(cf0b(n))>=3 )
      
      if (abs(sub0a(ny,nx))>=thd || abs(sub0b(ny,nx))>=thd || abs(sub0c(ny,nx))>=thd)
         ptA=ptA+1;
         cfA(ptA)=sub(ny,nx);
      else
         ptX=ptX+1;
         cfX(ptX)=sub(ny,nx);
      end
   end
end
cfA=cfA(1:ptA);
cfX=cfX(1:ptX);

lenA=length(cfA)
Nnon=sum(sum(abs(sign(sub))))
Nnon_in=sum(abs(sign(cfA)))
Nnon_out=sum(abs(sign(cfX)))

per = [Nnon_in/lenA   Nnon_in/Nnon   Nnon_out/length(cfX)]
max_min=[max(max(sub)) min(min(sub)) max(cfA) min(cfA) max(cfX) min(cfX)]
mag_in_out=[sum(cfA.*cfA) sum(cfX.*cfX)]
energy=sum(cfX.*cfX)/sum(cfA.*cfA)

