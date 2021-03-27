function biny=en_Kside_new(rk,thd,nk)

%changes from en_Kside are in option 'otherwise'  2014/12/02

rk=double(rk);

biny=[];
switch thd
   case 2
      pk=sum(rk-1)/length(rk);
      if pk > (1 - 0.5^(1/2.5))
         [bin,len]=en_KsideSub(rk-1);
         biny=[biny 0 bin];
      else
         [runs,lastBit]=Golomb0(uint8(rk-1));
         [bin,codebook]=encode_stationary_source(runs,pk); %codebook
         codebook=uint8(abs( dec2bin(codebook-1,3) ) -48);
         biny=[biny 1 codebook lastBit bin];
      end
   case 3
      [sep,rA,rB]=separate(rk,1); rA=rA-1; %nA=hist(rA,[1:max(rA)]);
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rA-1); biny=[biny bin];
   case 4
      [sep,rA,rB]=separate(rk,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];

      [sep,rA,rB]=separate(rA,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rA-1); biny=[biny bin];
   case 5
      [sep,rA,rB]=separate(rk,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];

      [sep,rA,rB]=separate(rA,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];

      [sep,rA,rB]=separate(rA,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rA-1); biny=[biny bin];
   case 6
      [sep,rA,rB]=separate(rk,2); rA=rA-2;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rB-1); biny=[biny bin];

      [sep,rA,rB]=separate(rA,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];

      [sep,rA,rB]=separate(rA,1); rA=rA-1;
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rA-1); biny=[biny bin];
   otherwise
      [sep,rA,rB]=separate(rk,2); rA=rA-2; nA=nk(3:thd);
      [bin,len]=en_KsideSub(sep); biny=[biny bin];
      [bin,len]=en_KsideSub(rB-1); biny=[biny bin];
      
      
      %Here are the changes from en_Kside.m --------------------------------------------------------------
      %[bin,codebook]=encode_stationary_source_Nsym(rA,length(rA)/sum(rA),thd-2);  %cbbbbbb=codebook %%%%%%%%%%%%
      %codebook=uint8( abs(dec2bin(codebook,4)) -48 );
      %biny = [biny codebook bin];      
            
      p=probility_estimation(rA,nA);
      [bin,codebook]=encode_stationary_source_Nsym(rA,p,thd-2); %cbbbbbb=codebook %%%%%%%%%%%%
      binck=encode_stationary_source(codebook+1, 4); 
      biny = [biny binck bin];      
      %---------------------------------------------------------------------------------------------------
end
