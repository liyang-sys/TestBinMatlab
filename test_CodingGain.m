%load Kimono_96frames


%a=uint16(a);
%max(max(max(a)))

%[coef,fL]=transform_cfp4_only(a);
%[coef,fL]=transform_cfp8_only(a);


%load kimono_cfp8_only
%load CrowdRun_cfp8_only
%load BQTerrace_cfp8_only
%load OldTownCross_cfp8_only
%load ParkScene_cfp8_only
%coef=cf_cfp8_only;      clear cf_cfp8_only;






%[cft,fLt]=transform_time_domain_cfp4(cf);


delta=6.6; T=0.55*delta;
w=128;
trans=zeros(8,8);
TR=zeros(8,8);
ramp=zeros(8,8);
reng=zeros(8,8);
gainHaar=zeros(8,8);
gainCfp4=zeros(8,8,2);


r=2; c=5;

for r=1:8
   r
   for c=1:8
      %row_col=[r c] %<==================================================
      sub = double(coef( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
      
      gainHaar(r,c)=CodingGainHaar(sub);
      [gainCfp4(r,c,:),sig,subH]=CodingGainCfp4(sub,3);
      
      
      %[subT,non]=threshold(sub,T);

      
      %[subTH,nonH]=threshold(subH,T);
      %s1=subTH(:,:,1:48); s2=subTH(:,:,49:96);
      %ampH=sum(sum(sum(abs(s1))))/sum(sum(sum(abs(s2))));
      %engH=sum(sum(sum(s1.*s1)))/sum(sum(sum(s2.*s2)));
      
      %ramp(r,c)=ampH;
      %reng(r,c)=engH;
      
      
      %if nonH<non 
       %  trans(r,c)=1;
%      end
 %     if engH<eng && nonH>=non
  %       TR(r,c)=1;
   %   end
         
      
   end
end
