%load Cactus_96frames
%load ParkScene_96frames
load Kimono_96frames

%a=a(:,:,1:48);

a=shiftdim(a,2);
for x=1:1024
   x
   for y=1:1024
      a(:,x,y)=dyadic_periodic_decom(a(:,x,y),5);
   end
end
a=shiftdim(a,1);

%save Cactus_time_domain_26filter_transformed a
%save ParkScene_time_domain_26filter_transformed a
save Kimono_time_domain_26filter_transformed a
