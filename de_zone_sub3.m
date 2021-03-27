function [rz,ptr]=de_zone_sub3(biny,lastBit,Nsep,ptr)

thd=zeros(1,Nsep); sepr=cell(1,Nsep);


if Nsep==1
   scl4thd1=4; cbk1=8;
   scl4thd2=4; cbk2=8; %not used!
   scl4thd3=4; cbk3=8; %not used!
elseif Nsep==2
   scl4thd1=2; cbk1=7;
   scl4thd2=4; cbk2=8;
   scl4thd3=8; cbk3=9; %not used!
else
   scl4thd1=1; cbk1=5;
   scl4thd2=2; cbk2=6;
   scl4thd3=4; cbk3=8;
end

for nsep=1:Nsep
   if nsep==1
      [thdd,ptr]=decode_stationary_source_lenr(biny,cbk1,1,ptr); thd(1)=thdd*scl4thd1;
   elseif nsep==2
      [thdd,ptr]=decode_stationary_source_lenr(biny,cbk2,1,ptr); thd(2)=thdd*scl4thd2;
   else
      [thdd,ptr]=decode_stationary_source_lenr(biny,cbk3,1,ptr); thd(nsep)=thdd*scl4thd3;
   end
end

%sep is binary coded:
[lens,ptr]=decode_stationary_source_lenr(biny,15,1,ptr);
for nsep=1:Nsep
   sepr{nsep}=biny(ptr:ptr+lens-1); ptr=ptr+lens;
   lens=sum(sepr{nsep});
end

%decode rw;
codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5; %%%%%%%%%%%%%%%%%%
[rrw,ptr]=decode_stationary_source_lenr(biny,codebook,sum(sepr{Nsep}),ptr);

lenk=zeros(1,Nsep); rk=cell(1,Nsep);
%decode rk{nsep}:
for nsep=Nsep:-1:1
   lenk(nsep)=length(sepr{nsep})-sum(sepr{nsep});
   if nsep>1
      codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
      [rk{nsep},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(nsep),thd(nsep),ptr);
   else
      bn=biny(ptr); ptr=ptr+1;
      if bn<1
         bn=biny(ptr); ptr=ptr+1;
         if bn<1
            [rk{1},ptr]=de_Kside_low_p(biny,thd(1),lenk(1),ptr);
         else
            codebook=bin2dec(char(biny(ptr:ptr+4)+48));  ptr=ptr+5;
            [rk{1},ptr]=decode_stationary_source_Nsym_lenr(biny,codebook,lenk(1),thd(1),ptr);
         end
      else
         [rk{1},ptr]=de_Kside(biny,thd(1),lenk(1),ptr);
      end
   end
   rrw=rrw+thd(nsep);
   rrw=separate_inv(sepr{nsep},rrw,rk{nsep});
end

rz=GolombInv(rrw,lastBit);
