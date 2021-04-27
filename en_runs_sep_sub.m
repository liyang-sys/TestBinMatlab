function biny=en_runs_sep_sub(thd,rk,nk,rw,biny)

%biny0=biny;

%[bin,codebook]=encode_stationary_source(rw,length(rw)/sum(rw));  %codebook
%codebook=SFcode(codebook+1,10); %modified Dec. 19, 2013
%codebook=SFcode(codebook+1,12); %modified Nov. 21, 2014
%biny = [biny  codebook bin];

bin=en_r0(rw);  %modified Jan 11, 2015
biny = [biny  bin];

if thd>1
   if  (thd<10 & length(rk)>500)  |  (thd<7 & length(rk)>300)  |  (thd<4 & length(rk)>150)
      bin=en_Kside(rk,thd,nk);
      biny = [biny bin];
   else
      pk=length(rk)/sum(rk);
%       if pk < 0.32 为了测试delta=6时 修改的
       if pk < 0.32
         [bin,codebook]=encode_stationary_source_Nsym(rk,pk,thd); %codebook %%%%%%%%%
         %codebook=uint8( abs(dec2bin(codebook,2)) -48 );
         %codebook=uint8( abs(dec2bin(codebook,3)) -48 ); %modified Nov.21, 2014
%             if codebook>15
%                 codebook=15;
%             end
%           codebook=SFcode(codebook+1,16);  %modified Mar. 30, 2015
  %       codebook=SFcode(codebook+1,6); 
           if codebook>7
                codebook=7;[bin,codebook]=encode_stationary_source_Nsym(rk,codebook,thd);
            end
          codebook=SFcode(codebook+1,8);  %modified Mar. 30, 2015
         biny = [biny  0 codebook bin];
      else
         c=GolombInv(rk,1);
         bin=en_KsideSub_n1s(c);
         %[cr,ptr]=de_KsideSub_n1s(1,bin,length(rk));   plot(double(c)-double(cr))
         biny = [biny 1 bin];
      end
   end
end

%L0=length(biny)-length(biny0)
