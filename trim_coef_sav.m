load Threshold
T=T*delta; T2=T2*delta; T3=T3*delta;

n0=sum(z)

[gc,lastBit]=Golomb0(z);

lg=length(gc); 
pos=0; gc0=gc;
for ia=1:lg-1
   pos=pos+gc0(ia);
   if gc(ia)>1
      lenp=min([gc(ia) gc(ia+1)]);
      if lenp>1
         if sb(pos)<T(lenp)
            %cf0trim=cf0(pos)
            %[lenp, sb(pos), T(lenp)]
            cf0(pos)=0;
            gc(ia+1)=gc(ia+1)+gc(ia);
         end
      end
   end
end

dn=n0-sum(sign(cf0))

cf0=fliplr(cf0); sb=fliplr(sb);
z=sign(cf0);
[gc,lastBit]=Golomb0(z);

lg=length(gc); 
pos=0; gc0=gc;
for ia=1:lg-1
   pos=pos+gc0(ia);
   if gc(ia)>1
      lenp=min([gc(ia) gc(ia+1)]);
      if lenp>1
         if sb(pos)<T(lenp)
            %cf0trim=cf0(pos)
            %[lenp, sb(pos), T(lenp)]
            
            if cf0(pos)>1
               [lenp, sb(pos), T(lenp)]
            end
            
            cf0(pos)=0;
            gc(ia+1)=gc(ia+1)+gc(ia);
         end
      end
   end
end

dn=n0-sum(sign(cf0))
