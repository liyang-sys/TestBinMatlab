function bin=en_sep_cr(r,lB,nr,maxcr)

if maxcr>30
   bin=en_zone_new(r,[1 lB],nr);
else
   bin=en_zone_sub2(r,[0 lB]);
end
