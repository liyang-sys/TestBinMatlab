function [idx,h,nidx]=find_2s_power(H,p2s)

dH=H; ib=1; h=int32(zeros(1,10)); idx=h;
while dH>0
   ia=1;
   while p2s(ia)<dH
      ia=ia+1;
   end
   if p2s(ia)>dH
      ia=ia-1;
   end
   idx(ib)=ia-1; h(ib)=p2s(ia);
   dH=dH-h(ib); ib=ib+1;
end
nidx=ib-1; idx=idx(1:nidx); h=h(1:nidx);
