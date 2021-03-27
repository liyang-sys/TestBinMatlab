function coef=iLapProj(spec,Hrl,Hrh)

sz=size(spec);  hN=sz(1)/2; 

spl=spec(1:hN,:); 
splint=[spl; zeros(1,sz(2)); -flipud(spl(2:hN,:))];
Zl=splint.*Hrl;

sph=spec(hN+1:sz(1),:);  sph(1,:)=sph(1,:)*sqrt(2);
sphint=[flipud(sph); sph(2:hN,:); zeros(1,sz(2))];
Zh=sphint.*Hrh;  Zh=[zeros(1,sz(2)); Zh(1:sz(1)-1,:)];

coef=Zl+Zh;