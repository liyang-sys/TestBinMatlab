infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);


N=size(a);

Ns=8;
[coef0,fL]=LFP2(a,Ns); tanTheta=1/8; coef0=block2band_5lev(coef0,Ns,tanTheta); %<=====LFP
[ct,nonzero]=threshold(coef0,500);
Nnon=Coef_Statistics_5lev(ct);
cf=band2block_5lev(coef0-ct,8,tanTheta);  er=LFP2Inv(cf,8,fL); %<==== LFP



T=10;

x=er;
Ns=8;
[coef,fL]=LFP2(x,Ns); tanTheta=1/8; coef=block2band_5lev(coef,Ns,tanTheta); %<=====LFP
[coeft,non]=threshold(coef,T);


cfdy=CFPdyadic1(x,tanTheta);  %the PTV
%cfdy=dy79decm_5lev(x);
[cfdyt,nondy]=threshold(cfdy,T);

non,nondy
