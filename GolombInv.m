function z=GolombInv(runs,lastBit)
runs=int32(runs);

lenz=sum(runs); len=length(runs);
z=zeros(1,lenz);
pos=0;
for ia=1:len
   pos=pos+runs(ia);
   z(pos)=1;
end
z(pos)=lastBit;
z=uint8(z);
