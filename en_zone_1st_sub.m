function [biny,sep]=en_zone_1st_sub(r,kcr,biny)

p1=1-1/4-1/16+1/64;  p2=1-1/4+1/16;
if kcr<160 %kcr criterion needs to be checked further
   nsep=2; p=[p1 p2];
   biny=[biny 0 0];
elseif kcr<960 %kcr criterion needs to be checked further
   nsep=3; p=[p1 p1 p2];
   biny=[biny 0 0];
elseif kcr<3600
   nsep=4; p=[p1 p1 p1 p2];
   biny=[biny 0 1];
elseif kcr<160000
   nsep=5; p=[p1 p1 p1 p1 p2];
   biny=[biny 1 0];
else
   nsep=6; p=[p1 p1 p1 p1 p1 p2];
   biny=[biny 1 1];
end
nsep %%%%%%%%%%%%%%%%%%%
%shist(r)

%-----------------------------------------------------------------------
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

n=hist(r,[1:max(r)]);

rw=r; nw=n; lenw=length(nw);
sep=cell(nsep,4);
for nsp=1:nsep
   idx=find_thd_idx(nw,p(nsp),th); thd=th(idx)%%%%%%%%%%%%
   bin=encode_stationary_source(idx, 3); 
   biny=[uint8(biny) bin];
   [sept,rw,rk]=separate(rw,thd);   rw=rw-thd;
   nk=nw(1:thd); nw=nw(thd+1:lenw); lenw=lenw-thd;
   sep{nsp,1}=sept; sep{nsp,2}=rk; sep{nsp,3}=thd; sep{nsp,4}=nk; 
   [crsssssss,k]=k_criterion(Golomb0(sept)); crsssssss%%%%%%%%%%%
end
%sep

%encode sep{k,1} (k>=2):
for nsp=nsep:-1:2
   biny0=biny;
   cbook=17;    biny=en_runs_0seps(sep{nsp,1},cbook,biny);
   lenbbb=length(biny)-length(biny0) %%%%%%%%%%%%%
end

%encode sep{1,1}:
biny0=biny;
[rs,lastBit,ps]=Golomb0(sep{1,1});  biny=[biny lastBit];
cbook=4; biny=en_runs_1sep(rs,p2,cbook,length(sep{1,1}),biny);
lenbbb=length(biny)-length(biny0) %%%%%%%%%%%%%

%encode rw;
[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw)); %codebook %%%%%%%%%%
codebook=uint8( abs(dec2bin(codebook,5)) -48 );
biny = [biny  codebook bin];

%encode sep{k,2} (k>=2):
for nsp=nsep:-1:2
   rk=sep{nsp,2}; thd=sep{nsp,3}; nk=sep{nsp,4};
   if thd>1
      prob=probility_estimation(rk,nk);
      if ((prob>0.31) & (thd<9)) %| (thd<6)
         bin=en_Kside_new(rk,thd,nk);
         biny = [biny  0 bin];
      else
         %fprintf('\nhere!!!!!!!!!!!!!!!!\n') %%%%%%%%%%%%%%%%
         [bin,codebook]=encode_stationary_source_Nsym(rk,prob,thd); %codebook %%%%%%%%%%%%
         codebook=uint8( abs(dec2bin(codebook,4)) -48 );
         biny = [biny  1 codebook bin];
      end

      
      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      %nnnnn=shist(rk);
      %if round(thd/3)*3==thd, typ=2;      else, typ=1;  end
      %[binA,thdd]=en_2n_code_new(rk,nk,typ,thd);

      %lencompare=[nsp thd length(binA) length(bin)] %<==========%%%%%%%%%%%%%%%%%%%%%
      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
   end
end

%encode sep{1,3}:
if sep{1,3}>1
   %fprintf('\nsep1 here===========================\n')
   bin=en_Kside_new(sep{1,2},sep{1,3},sep{1,4});
   biny = [biny bin];
end
