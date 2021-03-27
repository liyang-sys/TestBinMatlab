function [bin,z]=en_2n_code(c2n,nc)

power2s=cumprod([1 2*ones(1,30)]);

c2n=double(c2n);
thd=max(c2n)/2; n=log2(thd);
[z,cw,ck]=separate(c2n,thd);   cw=cw-thd;
bin1=en_z0(z);
if n>=1
   thdh=thd/2;
   if sum(nc(1:thdh))/sum(nc(1:thd))>0.6
      %fprintf('\naaaaaaaaaaa\n')
      [zk,ckw,ckk]=separate(ck,thdh);   ckw=ckw-thdh;
      binzk=en_z0(zk);
      bin2k=en_2n_code_sub([ckw ckk],n-1,length(zk));
            
      [zw,cww,cwk]=separate(cw,thdh);   cww=cww-thdh;
      binzw=en_z0(zw);
      bin2w=en_2n_code_sub([cww cwk],n-1,length(zw));
      
      bin2=[1 binzk bin2k binzw bin2w];
   else
      %fprintf('\nbbbbbbbbbbbbbb\n')
      bin2=en_2n_code_sub([cw ck],n,length(z)); bin2=[0 bin2];
   end
   bin=[bin1 bin2];
else
   bin=bin1;
end


%if round(thd/3)*3==thd, typ=2;      else, typ=1;  end
%binB=en_2n_code_new(c2n,nc,typ,max(c2n));

%if max(c2n)<5
%   binA=en_Kside(c2n,max(c2n),nc);
 %  lencompare1=[max(c2n) length(bin) length(binA) length(binB)] %%%%%%%%%%%%%
%else
 %  prob=probility_estimation(c2n,nc); %%%%%%%%%%%%%%%%%
  % [binA,codebook]=encode_stationary_source_Nsym(c2n,prob,max(c2n)); %codebook %%%%%%%%%%%%
   %lencompare2=[max(c2n) length(bin) length(binA) length(binB)] %%%%%%%%%%%%%
%end
