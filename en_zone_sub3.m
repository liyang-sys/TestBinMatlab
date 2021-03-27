function [biny,sep]=en_zone_sub3(r,n,Nsep,biny)

rw=r; nw=n; lenw=length(nw);
p_th=0.5;
%Nsep %%%%%%%%%%%%%%%%%%%%%%
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

sep=cell(Nsep,4);
%biny0=biny; %%%%%%%%%%%%%%%%%%
for nsep=1:Nsep
   thd=find_thd(nw,p_th);
   if nsep==1
      thd=round(thd/scl4thd1)*scl4thd1;
      if thd==0, thd=4; end %<=========================== modified 2013/08/02
      bin=encode_stationary_source(thd/scl4thd1, cbk1);
      biny=[uint8(biny) bin];
   elseif nsep==2
      thd=round(thd/scl4thd2)*scl4thd2;
      bin=encode_stationary_source(thd/scl4thd2, cbk2);
      biny=[uint8(biny) bin];
   else
      thd=round(thd/scl4thd3)*scl4thd3;
      bin=encode_stationary_source(thd/scl4thd3, cbk3);
      biny=[uint8(biny) bin];
   end
   thd0000=thd; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [sept,rw,rk]=separate(rw,thd);   rw=rw-thd;
   nk=nw(1:thd); nw=nw(thd+1:lenw); lenw=lenw-thd;
   sep{nsep,1}=sept; sep{nsep,2}=rk; sep{nsep,3}=thd; sep{nsep,4}=nk; 
end

%sept's are binary directly encoded:
bin=encode_stationary_source(length(sep{1,1}), 15);
biny=[biny bin sep{1,1}];
for nsep=2:Nsep
   biny=[biny sep{nsep,1}];
end

%encode rw;
[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw)); %codebook %%%%%%%%%%
codebook=uint8( abs(dec2bin(codebook,5)) -48 );
biny = [biny  codebook bin];

%encode sep{nsep,2} (the k-portions):
for nsep=Nsep:-1:2
   rk=sep{nsep,2}; thd=sep{nsep,3};
   %In this case, thd must be large number and probability should be small:
   [bin,codebook]=encode_stationary_source_Nsym(rk,length(rk)/sum(rk),thd); %codebook %%%%%%%%%%%%
   codebook=uint8( abs(dec2bin(codebook,5)) -48 );
   biny = [biny codebook bin];
end

%encode sep{1,2} (rk1, thd should be greater than 1):
rk=sep{1,2}; thd=sep{1,3}; nk=sep{1,4};
if thd>7
   if n(1)>2
      bin=en_Kside_low_p(rk,thd);
      biny = [biny 0 0 bin];
   else
      [bin,codebook]=encode_stationary_source_Nsym(rk,length(rk)/sum(rk),thd); %codebook %%%%%%%%%%%%
      codebook=uint8( abs(dec2bin(codebook,5)) -48 );
      biny = [biny 0 1 codebook bin];
   end
else
   bin=en_Kside(rk,thd,nk);
   biny = [biny 1 bin];
end
