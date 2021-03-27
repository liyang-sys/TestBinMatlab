function coef=LapProj(spec,Hdl,Hdh)

sz=size(spec);  hN=sz(1)/2;

specl=Hdl.*spec;	%low-pass filtering
spl=[specl(1,:); specl(2:hN,:)-flipud(specl(hN+2:sz(1),:))];

spech=Hdh(1:sz(1)-1,:).*spec(2:sz(1),:);	%high-pass filtering
sph=spech(hN:sz(1)-1,:) + flipud(spech(1:hN,:));  sph(1,:)=sph(1,:)/sqrt(2);

coef=[spl; sph];