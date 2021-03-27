function a=transform_time_domain(a)

a=shiftdim(a,2);
for y=1:1024
   a(:,:,y)=dyadic_symmetric_decom(a(:,:,y),5);
end
a=shiftdim(a,1);
