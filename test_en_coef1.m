binary=en_coef2D_new(coef,N(1)/8,N(2)/8,delta,[]);
ptr=1; coefr=de_coef2D_new(binary,delta,N(1)/8,N(2)/8,N(1)*N(2),ptr);

%binary=en_coef2D_double_deadzone(coef,delta);
%coefr=de_coef2D_double_deadzone(binary,delta);

%max_min_bin=[max(binary), min(binary)]
file_size=length(binary)/8;
recon1
