function A=dy97recon1D(A,lev)

[hH,W]=size(A); hH=hH/(2^lev); H=hH*2;

for ib=1:lev
    for ia=1:W
        A(1:H,ia)=Re97Sym(A(1:hH,ia)',A(hH+1:H,ia)')';
    end
    hH=hH+hH; H=H+H;
end
