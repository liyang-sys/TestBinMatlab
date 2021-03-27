i1=1; i2=1;
[cf,z,sn,cf1]=coef_sign(subqcf{i1,i2});
%sumz=sum(z)

[biny,sep,r]=en_zone(z);
ptr=1; [rz,ptr]=de_zone(biny,length(z),ptr);
length(biny)


plot(double(rz)-double(z))

%(length(binary)-length(biny))/length(binary)

fprintf('==================================================\n\n')
