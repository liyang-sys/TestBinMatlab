scan_maps


%subcf=subqcf{3,3}(17:32,17:32);
%subcf=subqcf{3,1}(9:16,1:8);
subcf=subqcf{1,1};%(193:256,1:64);
sub2=sub{1,1}.*sub{1,1};
sz=size(subcf); len=sz(1)*sz(2);
nnn=sum(sum(abs(sign(subcf)))) %%%%%%%%%%%%%%%%%%%%%

T2=6*T*T;
rk=int16(zeros(1,len));   rw=rk;
rn=0; rnw=0; Nr=0; flg=0; eng=0;
map=int8(zeros(sz)); rr=[];
for n=1:len
   rnw=rnw+1;
   row=routxy(1,n); col=routxy(2,n);
   if subcf(row,col) ~= 0   
      rn=rn+1; eng=eng+sub2(row,col);
      %if abs(subcf(row,col))>1, flg=1; end
   else
      %if rn>2  ||  flg==1
      if eng>T2
         Nr=Nr+1;  
         rk(Nr)=rn;
         rw(Nr)=rnw-rn;
         for ia=1:rn
            map(routxy(1,n-ia),routxy(2,n-ia))=1;
         end
         rnw=0;
      else
         rr=[rr rn];
      end
      rn=0; flg=0; eng=0;
   end
end


rk=rk(1:Nr);   rw=rw(1:Nr);
run_hilbert=[rk; rw];

N1s=[sum(rk) min(rk)]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



qcf=subcf.*double(abs(sign(map)));

err=max(max(abs(subcf-qcf))) %<==== bug here !!!!!!!!!!!!!! err should be 1 !!!

cf=rstTHDctr1(qcf,T,delta,0.42*delta,0.46*delta);
e=cf-sub{1,1}; e=e.^2; e=sqrt(sum(sum(e))/(sz(1)*sz(2)));
SN=20*log10(255/e)


