%load Cactus_cfp8_3d_transB_5lev; 
%load ParkScene_cfp8_3d_transB_5lev;
%load Kimono_cfp8_3d_transB_5lev;
%load CrowdRun_cfp8_3d_transB_5lev;
%load BQTerrace_cfp8_3d_transB_5lev;
%load OldTownCross_cfp8_3d_transB_5lev;

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);

w=128; nn=128*128*8;

r=5; c=7;



row_col=[r c] %<==================================================
sub = double(L2c( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
%------------------------------------------------------------------



delta0=1.99; %<=======================================================

load H3L3
n=H3cutted(3,7,n)'+1;
n=[n(2,:); n(3,:); n(1,:)];
[cf_tem1,abssb,sb]=coef_scan3d(sub,sub,n);



%cf = quanTHD(sb, delta0/10, delta0/10); abscf=abs(cf);


[cf,ctr1,ctr2]=quantEVEN(sb,delta0/10); abscf=abs(cf);
cf=double(abscf+1);   lennc=max(abscf);  %note: the mininum of cf is 1 here, not 0.
nc=hist(abscf,[1:lennc]); 

dd=1/128;
if nc(6)>0
   qnt=1;
   non=sum(nc(6:lennc))/sum(nc), r61=nc(6)/nc(1)

   if lennc>=30 
      x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
      x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; xx=x(2:29)./x(1:28);
      if max(xx(16:25))>0.9, xx=1:30; end
   else
      xx=1:30;
   end
   
   if non<0.6  &&  r61<0.71  &&  sum(xx(16:20))<sum(xx(21:25))  %trim:
      trim=uint8(1);

      [t,h,t2,h2]=find_T_and_Del(sub,delta0); 
      mag=round((h2-1)/dd);  if mag>=16, mag=15; end
      
      delta=(1+mag*dd)*delta0;  T=0.53*delta;
      qcf=quanTHD(sb,T,delta);
      sn_z=sign(qcf); cf0=abs(qcf);
      
      [cf0tr,qcf_trim,dNnon,sn,cf1tr]=trim_coef(cf0,sn_z,qcf,abssb,delta,T,n); dNnon %%%%%%%%%%%%%%
      
      bin=[trim SFcode(mag+1,16)];
   else %no trim
      trim=uint8(0);
      if sum(nc(1:5))/sum(nc(6:15))>0.7071
         qctr=1;
         T=0.52*delta0;
         qcf=quanTHD(sb,T,delta0);
         bin=[trim qctr];
      else
         qctr=0;
         [qcf,ctr1,ctr2]=quantEVEN(sb,delta0);
         bin=[trim qctr SFcode(ctr1+1,64) SFcode(ctr2+1,64)];
      
         %nc=hist(abs(qcf),[1:max(abs(qcf))]);
         %sbr=rstEVENctr(qcf,delta0,nc,ctr1,ctr2);
         %e=sb-sbr; e=e.*e; e=sqrt(sum(sum(sum(e)))/length(qcf));
         %SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%
      end
   end
else
   qnt=0; cf0=0; sn=0;
end
bin=[qnt bin];

%figure; plot(xx); hold on;  plot(xx,'r.');  axis([0 26 0.3 1]); grid
