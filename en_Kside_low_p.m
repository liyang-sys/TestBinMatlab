function [biny,c]=en_Kside_low_p(rk,thd)

%It is assumed that in this case thd is very large (much greater than 7)
biny=[];

%shist(rk)

[sep,rA,rB]=separate(rk,2); rA=rA-2;
inv=0;
if sum(sep)>0.5*length(sep), sep=1-sep; inv=1; end
[bin,len]=en_KsideSub(sep);
biny=[biny inv bin];

c=rB-1;
if max(c)<1
   biny=[biny 0];
else
   biny=[biny 1];
   [rc,lBc,pc]=Golomb0(c);
   [bin,codebook]=encode_stationary_source(rc,pc);
   codebook=uint8( abs(dec2bin(codebook,5)) -48);
   biny=[biny lBc codebook bin];
end

[bin,codebook]=encode_stationary_source_Nsym(rA,length(rA)/sum(rA),thd-2); %codebook %%%%%%%%%%%%
codebook=uint8( abs(dec2bin(codebook,5)) -48 );

biny = [biny codebook bin];
