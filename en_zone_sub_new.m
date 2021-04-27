function [biny,sep]=en_zone_sub_new(r,kcr,biny)

p1=1-1/4-1/16+1/64;  p2=1-1/4+1/16;

if max(r)==2, fprintf('\n\n Bug in en_zone_sub_new: max(r)=2 in en_zone_sub_new !!! \n\n'); end

lenr=length(r); 
if kcr<=60  ||  (kcr>60 && lenr<1000)
   nsep=2; p=[p1 p2];
elseif kcr<450 
   nsep=3; p=[p1 p1 p2];
elseif kcr<3600
   nsep=4; p=[p1 p1 p1 p2];
elseif kcr<16000
   nsep=5; p=[p1 p1 p1 p1 p2];
else
   nsep=6; p=[p1 p1 p1 p1 p1 p2];
end
biny=[biny SFcode(nsep-1,5)];



%nsep %%%%%%%%%%%%%%%%%%%

%-----------------------------------------------------------------------
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); th=[1 th 4096];

n=hist(r,[1:max(r)]);

rw=r; nw=n; lenw=length(nw);
sep=cell(nsep,4);
for nsp=1:nsep
   idx=find_thd_idx_round(nw,p(nsp),th); thd=th(idx); %%%%%%%%%%%%
   bin=encode_stationary_source(idx, 3); 
   biny=[uint8(biny) bin];
   [sept,rw,rk]=separate(rw,thd);   rw=rw-thd;
   nk=nw(1:thd); nw=nw(thd+1:lenw); lenw=lenw-thd;
   sep{nsp,1}=sept; sep{nsp,2}=rk; sep{nsp,3}=thd; sep{nsp,4}=nk; 
end

%encode sep{nsep,1} -------------------------------------------
%biny0=biny;
cbook=17;    biny=en_runs_0seps(sep{nsep,1},cbook,biny);
%lenaa=length(biny)-length(biny0) %%%%%%%%%%%%%

%encode sep{k,1} ( k from 2 to nsep-1 ):
for nsp = (nsep-1): -1 : 2
   %biny0=biny;
   [rs,lastBit,ps]=Golomb0(sep{nsp,1});  biny=[biny lastBit];
   cbook=4; biny=en_runs_1sep(rs,p2,cbook,length(sep{nsp,1}),biny);   
   %lenaaa=length(biny)-length(biny0) %%%%%%%%%%%%%   
end

%encode sep{1,1} -----------------------------------------------
biny0=biny;
[rs,lastBit,ps]=Golomb0(sep{1,1});  biny=[biny lastBit];
cbook=17;    biny=en_runs_2seps(rs,p2,length(sep{1,1}),cbook,biny);
%lenaaaaa=length(biny)-length(biny0) %%%%%%%%%%%%%

%encode rw: ----------------------------------------------------
[bin]=en_r0(rw); %<== this eliminates the expansion from rw when p>0.32
biny=[biny bin];
%[rrw,inv,ptrr]=de_r0(bin,length(rw),1); 

%[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw)); %codebook %%%%%%%%%%
%codebook=uint8( abs(dec2bin(codebook,5)) -48 );
%biny = [biny  codebook bin];

%encode sep{k,2}: ---------------------------------------------------------
%for nsp=nsep:-1:2
for nsp=nsep:-1:1
   rk=sep{nsp,2}; thd=sep{nsp,3}; nk=sep{nsp,4};
   if thd>1
      prob=probility_estimation(rk,nk); %%%%%%%%%%
      %if ((prob>0.31) & (thd<9))
      if ((prob>0.15) & (thd<=9))  %<==== modified Dec 14, 2014
         bin=en_Kside_new(rk,thd,nk);
         biny = [biny  0 bin];
      else
         %fprintf('\nhere!!!!!!!!!!!!!!!!\n') %%%%%%%%%%%%%%%%
         [bin,codebook]=encode_stationary_source_Nsym(rk,prob,thd); %codebook %%%%%%%%%%%%
%          if codebook>19 
%              codebook=19; 
%              [bin,codebook]=encode_stationary_source_Nsym(rk,codebook,thd); 
%          end  
%         codebook=SFcode(codebook+1,20);   %<==== modified Jan 20, 2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        codebook=SFcode(codebook+1,17);   %<====2021年4月25日修改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         biny = [biny  1 codebook bin];
      end
      
      
      %if nsp==1, lenk1=length(bin), end %%%%%%%%%%%%%
      
      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      %nnnnn=shist(rk);
      %if round(thd/3)*3==thd, typ=2;      else, typ=1;  end
      %[binA,thdd]=en_2n_code_new(rk,nk,typ,thd);

      %lencompare=[nsp thd length(binA) length(bin)] %<==========%%%%%%%%%%%%%%%%%%%%%
      %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
   end
end

%encode sep{1,2}:
%if sep{1,3}>1
   %fprintf('\nsep1 here===========================\n')
   %rk=sep{1,2}; thd=sep{1,3}; nk=sep{1,4};
   %bin=en_Kside_new(rk,thd,nk);
   %biny = [biny bin];
%end
