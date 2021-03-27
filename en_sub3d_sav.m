function biny=en_sub3d(cf0,cf1,sn,len)

maxcf0=double(max(cf0));

z=sign(cf0);
nc=hist(double(cf0+1),[1:maxcf0+1]); %%%%%%%%%%%%%%%%
p=sum(nc(2:length(nc)))/sum(nc)
len

if nc(1)>len*0.75 %nc(1)/len must be greater than 0.75 to avoid random inefficiency (from en_zone.m)
   [biny,z,cf0,cf1,sn]=en_sub3d_sub1(cf0,z,sn,maxcf0,cf1);
else
   biny=[];
   %biny=en_sub3d_sub2(cf0,len);
end
