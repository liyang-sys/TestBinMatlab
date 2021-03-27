function statistics_video(qcoef)

zn=abs(sign(qcoef));
mag=abs(qcoef);
Nnon=[sum(sum(zn(:,:,2))) sum(sum(zn(:,:,5)))  sum(sum(sum(zn(:,:,9:10)))) ...
    sum(sum(sum(zn(:,:,17:20)))) sum(sum(sum(zn(:,:,33:40)))) sum(sum(sum(zn(:,:,65:80))))]/1024^2 %%%%%%%%%%%%%%%%%%%
Nnon0=sum(Nnon) %%%%%%%%%%%%%%%%%%%

znn1=zn(:,:,65:80); non1=zeros(8,8,16); mag1=mag(:,:,65:80); max_mag1=non1; w=1024/8; 
for ic=1:16
   for ia=1:8
      for ib=1:8
         non1(ia,ib,ic)=sum(sum(znn1((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
         max_mag1(ia,ib,ic)=max(max(mag1((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
      end
   end
end
non1,max_mag1 %%%%%%%%%%%%%%%%%%%%%%%%%

znn2=zn(:,:,33:40); non2=zeros(8,8,8); mag2=mag(:,:,33:40); max_mag2=non2;
for ic=1:8
   for ia=1:8
      for ib=1:8
         non2(ia,ib,ic)=sum(sum(znn2((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
         max_mag2(ia,ib,ic)=max(max(mag2((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
      end
   end
end
non2,max_mag2 %%%%%%%%%%%%%%%%%%%%%%%%%

znn3=zn(:,:,17:20); non3=zeros(8,8,4); mag3=mag(:,:,17:20); max_mag3=non3;
for ic=1:4
   for ia=1:8
      for ib=1:8
         non3(ia,ib,ic)=sum(sum(znn3((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
         max_mag3(ia,ib,ic)=max(max(mag3((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
      end
   end
end
non3,max_mag3 %%%%%%%%%%%%%%%%%%%%%%%%%

znn4=zn(:,:,9:10); non4=zeros(8,8,2); mag4=mag(:,:,9:10); max_mag4=non4;
for ic=1:2
   for ia=1:8
      for ib=1:8
         non4(ia,ib,ic)=sum(sum(znn4((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
         max_mag4(ia,ib,ic)=max(max(mag4((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w,ic)));
      end
   end
end
non4,max_mag4 %%%%%%%%%%%%%%%%%%%%%%%%%

znn5=zn(:,:,5); non5=zeros(8,8); mag5=mag(:,:,5); max_mag5=non5;
for ia=1:8
   for ib=1:8
      non5(ia,ib)=sum(sum(znn5((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w)));
      max_mag5(ia,ib)=max(max(mag5((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w)));
   end
end
non5,max_mag5 %%%%%%%%%%%%%%%%%%%%%%%%%

znn0=zn(:,:,2); non0=zeros(8,8); mag0=mag(:,:,2); max_mag0=non0;
for ia=1:8
   for ib=1:8
      non0(ia,ib)=sum(sum(znn0((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w)));
      max_mag0(ia,ib)=max(max(mag0((ia-1)*w+1:ia*w,(ib-1)*w+1:ib*w)));
   end
end
non0,max_mag0 %%%%%%%%%%%%%%%%%%%%%%%%%
