function [biny,sep]=en_zone_sub2a(r,biny)

n=hist(r,[1:max(r)]);

p1=1-1/4-1/16+1/64;  p2=1-1/4+1/16;   p=[p1 p2];
%p1=0.5;  p2=0.6;   p=[p1 p2]

rw=r; nw=n; lenw=length(nw);

nsep=2;
sep=cell(nsep,4);
for ia=1:nsep
   thd=find_thd(nw,p(ia));
   if ia==1
      bin=encode_stationary_source(thd, 3 );
      biny=[uint8(biny) bin];
   else
      thd=round(thd/4)*4;
      bin=encode_stationary_source(thd/4, 4 ); 
      biny=[uint8(biny) bin];
   end
   %thdaaaaa=thd %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [sept,rw,rk]=separate(rw,thd);   rw=rw-thd;
   nk=nw(1:thd); nw=nw(thd+1:lenw); lenw=lenw-thd;
   sep{ia,1}=sept; sep{ia,2}=rk; sep{ia,3}=thd; sep{ia,4}=nk; 
end

%encode sep{2,1}:
cbook=17;    biny=en_runs_0seps(sep{2,1},cbook,biny);

%encode sep{1,1}:
[rs,lastBit,ps]=Golomb0(sep{1,1});  
[bin,codebook]=encode_stationary_source(rs,ps); %codebook%%%%%%%%%%
codebook=SFcode(codebook+1,5); 

biny=[biny uint8([lastBit codebook])  bin];

%encode rw;
[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw)); %codebook %%%%%%%%%%
codebook=uint8( abs(dec2bin(codebook,5)) -48 );
biny = [biny  codebook bin];

%sep{2,2} (rk2):
rk=sep{2,2}; thd=sep{2,3}; nk=sep{2,4};
%if thd<17, prob=prob_est(nk);   else, prob=length(rk)/sum(rk);   end %<======== need to revise!!!o
      prb1=prob_est(nk); prb2=length(rk)/sum(rk);   lenrk=length(rk);   %<======== revised 13/08/04
      if thd <=6    && lenrk>256  %<========================================= revised 13/08/04
         prob=prb1;
      elseif thd<=12
         prob=(prb1+prb2)/2;
      else
         prob=prb2;   
      end %<==================================================== revised 13/08/01
if prob>0.31
   bin=en_Kside(rk,thd,nk);
   biny = [biny  0 bin];
else
   [bin,codebook]=encode_stationary_source_Nsym(rk,prob,thd); %codebook %%%%%%%%%%%%
   codebook=uint8( abs(dec2bin(codebook,4)) -48 );
   biny = [biny  1 codebook bin];
end

%encode sep{1,2} (rk1):
if sep{1,3}>1
   bin=en_Kside(sep{1,2},sep{1,3},sep{1,4});
   biny = [biny bin];
end
