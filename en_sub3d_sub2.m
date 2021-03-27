function [biny,xx]=en_sub3d_sub2(cf0,sn,maxcf0)

cf0=cf0+1; %<=== treat cf0 as runs!
maxcf=double(maxcf0+1);
nc=hist(double(cf0),[1:maxcf]); len=length(cf0);
%bar(nc); nc %%%%%%%%%%%%%%%%%%%%
th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); thd_arr=[1 th];
Nidx=length(thd_arr);
%p=0.5; p1=0.7; p2=0.8;
p=0.7; p1=0.7; p2=0.8;


%first round ==========================================================================

lenw=len; lenc=1600; %max([0.1*len 6000]);

iter=1; cf=cf0; biny=[]; idx0=1; maxcf=max(cf); z=0;
crc=20;
while (lenw>lenc || crc>=12)  && iter<=8  &&  maxcf>=2
   [thdidx,r,lB,pr,nr,scr,scrc,cf1,cf1k,nc1,nc1k,z] = find_thd4subs(cf,thd_arr,nc,idx0); thd1=thd_arr(thdidx); %%%%%%%
   idx0=thdidx;
   biny=[biny SFcode(thdidx,Nidx)];
   bin=en_sub3d_sub2_sub(z,r,lB,pr,nr,scr,scrc,cf1k,nc1k,thd1);

   %if iter==1
      %save tem2 z r lB pr nr scr scrc cf1k nc1k thd1
      %xx=z;
      %shist(r)
      %sumr=sum(r)
      %[zz,cfkk,ptr]=de_sub3d_sub2_sub(bin,thd1,length(z),1);
      %whos zz z
      %e1=max(abs(double(zz)-double(z)))
      %e2=max(abs(double(cfkk)-double(cf1k)))
      %whos zz
   %end
      
   biny=[biny bin];
   
   iter=iter+1; %%%%%%%%%%%%%%%

   lenw=length(cf1);  cf=cf1;  %nc=nc1;
   maxcf=max(cf);
   if maxcf>=2
      [cr,crc,r,lB,pw,nc,k]=k_criterion(cf);   %crt=[cr,crc] %%%%%%
   else
      break;
   end
   %fprintf('\n------------------------------------------------------\n\n\n')
end
iter=iter-1; %%%%%%%%%%%%%%
xx=z;


%if cr>39 | crc>=16
 %  bin=en_zone_sub2(double(cf),0);
%elseif (cr>16 | crc>=6)  &  (pw<0.43 | pw>0.57) 
 %  bin=en_r1(double(cf),0.8125,[1 0]);
%else
 %  bin=en_r0(double(cf));  bin=[1 1 bin];
%end
%length(bin)

bin=en_r0(double(cf)); 
bin_iter=abs(dec2bin(iter-1,3)-48);

biny=[bin_iter biny bin sn];

%shist(sn) %%%%%%%%%%%%%%%%%%%%%%%%%
%length(sn)
