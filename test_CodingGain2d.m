%load BQTerrace_96frames;    a=a(:,:,48);
%load Cactus_96frames;   a=a(:,:,48);
%load OldTownCross_96frames;   a=a(:,:,48)/4;
%load Kimono_96frames;   a=a(:,:,48)/4;
%load ParkScene_96frames;   a=a(:,:,48)/4;
%load CrowdRun_96frames;   a=a(:,:,48)/4;

%a=read_bin_8bit('basketball.bin');    a=a(:,:,33);
a0=read_bin_16bit('seeking.bin');  a=double(a0(:,:,37))/4;


a=double(a);
max(max(a))

mn=mean(mean(a));  sig=a-mn;
sig=sum(sum(sig.*sig))/numel(sig);


M=4; tanTheta=1/8;
[c4,fL4]=LFP2(a,M);   
c4=block2band_4lev(c4,M,tanTheta);

M=8; [c8,fL8]=LFP2(a,M);   
c8=block2band_only(c8,M);

c97=dy79decm_3lev(a);

[f1,f2]=wfilters('bior4.4');
f1=sum(f1.*f1); f2=sum(f2.*f2);
f11=f1*f1; f12=f1*f2; f22=f2*f2;

sig97=zeros(8,8); sig4=sig97; sig8=sig4;
w=1024/8;
for r=1:8
   for c=1:8
      s97=c97((r-1)*w+1:r*w, (c-1)*w+1:c*w);
      mn=mean(mean(s97));
      s97=sum(sum((s97-mn).*(s97-mn)))/numel(s97);
      if r==1 && c==1
         s97 = s97 *f22*f22*f22;
      elseif r*c==2
         s97 = s97 *f12*f22*f22;
      elseif r==2 && c==2
         s97 = s97 *f11*f22*f22;
      elseif  ((r==3 || r==4)  &&  (c==1 || c==2))  ||     ((r==1 || r==2)  &&  (c==3 || c==4))
         s97 = s97 *f12*f22;
      elseif (r==3 || r==4)  &&  (c==3 || c==4)
         s97 = s97 *f11*f22;
      elseif (r>=5 && c<=4) || (r<=4 && c>=5)
         s97 = s97 *f12;
      else
         s97 = s97 *f11;
      end
      sig97(r,c)=s97;
      
      s4=c4((r-1)*w+1:r*w, (c-1)*w+1:c*w);
      mn=mean(mean(s4));
      s4=sum(sum((s4-mn).*(s4-mn)))/numel(s4);
      sig4(r,c)=s4;
      
      s8=c8((r-1)*w+1:r*w, (c-1)*w+1:c*w);
      mn=mean(mean(s8));
      s8=sum(sum((s8-mn).*(s8-mn)))/numel(s8);
      sig8(r,c)=s8;
   end
end

gain97=10*log10(sig/prod(prod(sig97))^(1/64))
gain4=10*log10(sig/prod(prod(sig4))^(1/64))
gain8=10*log10(sig/prod(prod(sig8))^(1/64))

