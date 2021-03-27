function m=zigzag3D(Nr,Nc,Nd)

zigzag_size=[Nr Nc]

dp=1:Nc;
dn=Nc:-1:1;

m=zeros(3,Nr*Nc*Nd);
pos=1; dir=+1; dirfm=+1;
for d=1:Nd;
   if dirfm>0
      row=1:Nr;
   else
      row=Nr:-1:1;
   end
   for r=row
      if dir>0
         m(1,pos:pos+Nc-1)=r;
         m(3,pos:pos+Nc-1)=d;
         m(2,pos:pos+Nc-1)=dp;
      else
         m(1,pos:pos+Nc-1)=r;
         m(3,pos:pos+Nc-1)=d;
         m(2,pos:pos+Nc-1)=dn;
      end
      pos=pos+Nc;
      dir=-dir;
   end
   dirfm=-dirfm;
end
