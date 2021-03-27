[ a, h, w ] = pfmread_op('memorial_o876.pfm');  a=double(a);
sz1=size(a,1); sz2=size(a,2); sz3=size(a,3); 
inc=10000^(1/511);
%delta = input('Enter the quantization step size: ','s'); delta=str2double(delta);
delta=1;
nn=round(log(delta/0.01)/log(inc));  delta=0.01*inc^nn;
nn=dec2bin(nn,9); nn=uint8(abs(nn)-48);
%---------------------------TMO色调映射部分----------------------------------%
%f = input('Enter the f: ','s'); f=str2double(f);
f=0.2;
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( a, 1 );
im=zeros(h,w,3); ldri=zeros(h,w,3); maximg=zeros(1,3);
maxm=max(max(max(a)));
hdr255=a./maxm.*255.0;


[Y,Cb,Cr] = color2Y(hdr255);

rgb=color2Yinv(Y,Cb,Cr);


max(max(max(abs(rgb-hdr255))))

