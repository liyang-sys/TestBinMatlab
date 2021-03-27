function A=dy97decom1D(A,lev)

[H,W]=size(A); hH=H/2;

for ib=1:lev
    for ia=1:W
        [A(1:hH,ia),A(hH+1:H,ia)]=De97Sym(A(1:H,ia));
    end
    hH=hH/2; H=H/2;
end
