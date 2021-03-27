function [cf0,dn]=trim_coef_4pix(cf0,sb,delta,T,T2,sb2)

z=sign(cf0);
n0=sum(z); %%%%%%%%%%%%%%%%%%
%T=T*delta;
%T2=[T0*T0 T.*T]; %T0*T0 is the energy directly after thresholding
%sb2=sb.*sb;

len=length(cf0);
[gc,lastBit]=Golomb0(z);

lg=length(gc); 
pos=0; gc0=gc;


ia=1;
pos=pos+gc0(ia);
while lg-ia>=4
   lenp1=gc(ia); lenp2=gc(ia+1); lenp3=gc(ia+2); lenp4=gc(ia+3); lenp5=gc(ia+4);
   lenp=max([lenp2 lenp3 lenp4]);
   if (lenp1>lenp) & (lenp5>lenp)
      posA=pos+lenp2; posB=posA+lenp3; posC=posB+lenp4;
      ssb=sb2(pos)+sb2(posA)+sb2(posB)+sb2(posC);
      th=min([T2(lenp1)+T2(lenp2)+T2(lenp3)+T2(lenp4), T2(lenp5)+T2(lenp2)+T2(lenp3)+T2(lenp4)]);
      if ssb < th
         cf0(pos)=0; cf0(posA)=0; cf0(posB)=0; cf0(posC)=0;
         %gc(ia+4)=gc(ia+4)+lenp2+lenp3+lenp4+lenp5; %<== mistake here, corrected 03/04/2015
         gc(ia+4)=gc(ia+4)+lenp1+lenp2+lenp3+lenp4;
         ia=ia+3; pos=pos+gc0(ia-2)+gc0(ia-1)+gc0(ia);
      end
   end   
   ia=ia+1;   pos=pos+gc0(ia);
end


dn=n0-sum(sign(cf0)); %%%%%%%%%%%%%%%%%%%%%%
