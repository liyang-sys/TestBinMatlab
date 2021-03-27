function [a,fL]=transform_time_domain_cfp(a,ns)

a=double(a);

N=size(a);
L0=N(3); L=L0/ns; 

a=shiftdim(a,2);
for y=1:N(2)
   [a(:,:,y),fL]=LFP2sub(a(:,:,y),ns);
   tem=a(:,:,y);
   for ia=1:ns
      a((ia-1)*L+1:ia*L,:,y)=tem(ia:ns:L0,:);
   end
end
a=shiftdim(a,1);
