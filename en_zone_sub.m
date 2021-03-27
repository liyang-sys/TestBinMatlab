function [biny,sep]=en_zone_sub(r,biny)

n=hist(r,[1:max(r)]);

p1=1-1/4-1/16+1/64;  p2=1-1/4+1/16;   p=[p1 p1 p2];

rw=r; nw=n; lenw=length(nw);

nsep=3;
sep=cell(nsep,4);
for ia=1:nsep
   thd=find_thd(nw,p(ia));
   if ia==1
      bin=encode_stationary_source(thd, 2 ); 
      biny=[uint8(biny) bin];
   elseif ia==2
      bin=encode_stationary_source(thd, 4 ); 
      biny=[uint8(biny) bin];
   else
      thd=round(thd/4)*4;
      bin=encode_stationary_source(thd/4, 4 ); 
      biny=[uint8(biny) bin];
   end
   %thddddddddddd=thd%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [sept,rw,rk]=separate(rw,thd);   rw=rw-thd;
   nk=nw(1:thd); nw=nw(thd+1:lenw); lenw=lenw-thd;
   sep{ia,1}=sept; sep{ia,2}=rk; sep{ia,3}=thd; sep{ia,4}=nk; 
end

%encode sep{3,1}:
cbook=17;    biny=en_runs_0seps(sep{3,1},cbook,biny);

%encode sep{2,1}:
[rs,lastBit,ps]=Golomb0(sep{2,1});  biny=[biny lastBit];
cbook=4; biny=en_runs_1sep(rs,p2,cbook,length(sep{2,1}),biny);

%encode sep{1,1}:
[rs,lastBit,ps]=Golomb0(sep{1,1});  biny=[biny lastBit];
cbook=17;    biny=en_runs_2seps(rs,p2,length(sep{1,1}),cbook,biny);
%cbook=17;    biny=en_runs_2sepsB(rs,p1,0.8,length(sep{1,1}),cbook,biny);


%encode rw;
[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw)); %codebook %%%%%%%%%%
codebook=uint8( abs(dec2bin(codebook,5)) -48 );
biny = [biny  codebook bin];

%encode sep{3,2} and sep{2,2}:
for nsep=3:-1:2
   rk=sep{nsep,2}; thd=sep{nsep,3}; nk=sep{nsep,4};

   if thd>1
      prb1=prob_est(nk); prb2=length(rk)/sum(rk);
      %if thd <=7 
      if thd <=7 && length(rk)>360 %<=========================== modified 2013/08/02
         prob=prb1;
      elseif thd<=12
         prob=(prb1+prb2)/2;
      else
         prob=prb2;   
      end %<==================================================== revised 2013/06/02
      %if thd<17, prob=prb1;   else, prob=prb2;   end %<======== need to revise!!!

      if ((prob>0.31) & (thd<9)) %|| (thd<6)
         bin=en_Kside(rk,thd,nk);
         biny = [biny  0 bin];
      else
%         fprintf('\nhere!!!!!!!!!!!!!!!!\n') %%%%%%%%%%%%%%%%
         [bin,codebook]=encode_stationary_source_Nsym(rk,prob,thd); %codebook %%%%%%%%%%%%
         codebook=uint8( abs(dec2bin(codebook,4)) -48 );
         biny = [biny  1 codebook bin];
      end
   end
end

%encode sep{1,2}:
if sep{1,3}>1
   %fprintf('\nsep1 here===========================\n')
   bin=en_Kside(sep{1,2},sep{1,3},sep{1,4});
   biny = [biny bin];
end
