function [cf0,dn]=trim_coef(cf0,sb,delta,T)

z=sign(cf0);
n0=sum(z); %%%%%%%%%%%%%%%%%%
T=T*delta;

len=length(cf0);
[gc,lastBit]=Golomb0(z);

lg=length(gc); 
pos=0; gc0=gc;
for ia=1:lg-1
   pos=pos+gc0(ia);
   if gc(ia)>1
      lenp=min([gc(ia) gc(ia+1)]);
      if lenp>1
         if sb(pos)<T(lenp-1) %<==== T(1) corresponds to 'p=1/2' !!!
            %trim=[double(cf0(pos)) lenp, sb(pos), T(lenp)] %%%%%%%%%%%%%%%%
            cf0(pos)=0;
            gc(ia+1)=gc(ia+1)+gc(ia);
         end
      end
   end
end

if cf0(len)>0
   lenp=gc(lg);
   if lenp>1
      if sb(len)<T(lenp-1) %<==== T(1) corresponds to 'p=1/2' !!!
         cf0(len)=0;
      end
   end
end   

dn=n0-sum(sign(cf0)); %%%%%%%%%%%%%%%%%%%%%%
