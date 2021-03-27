multi_scan_hilbert
scan_maps

%run_row, which is in the vertical direction (fixed col, row changing)
rk=int16(zeros(1,len));   rw=rk;

rn=0; rn0=0; rnw=0; Nr=0;  
map_new=int8(zeros(sz));
for n=1:len
   rnw=rnw+1;
   row=routxy(1,n); col=routxy(2,n);   
   if subcf(row,col)~=0 
      rn=rn+1;
      if map(row,col,1)==1  ||  rn0>0
         rn0=rn0+1;
      end
   else
      if rn0>0
         if rn0>4
            Nr=Nr+1;  
            rk(Nr)=rn;
            rw(Nr)=rnw-rn;
            for ia=1:rn
               map_new(routxy(1,n-ia),routxy(2,n-ia))=1;
            end
            rnw=0;
         else
            flg=0;
            for ia=1:rn
               row=routxy(1,n-ia);  col=routxy(2,n-ia);
               if abs(subcf(row,col))>1 && map(row,col,2)<=rn0
                  flg=1;
               end
            end
            if flg==1
               Nr=Nr+1;   
               rk(Nr)=rn;
               rw(Nr)=rnw-rn;
               for ia=1:rn
                  map_new(routxy(1,n-ia),routxy(2,n-ia))=1;
               end
               rnw=0;
            end
         end
      end
      rn=0; rn0=0;
   end
end
if rn0>0
   if rn0>4
      Nr=Nr+1;  
      rk(Nr)=rn;
      rw(Nr)=rnw-rn;
      for ia=1:rn
         map_new(routxy(1,n-ia),routxy(2,n-ia))=1;
      end
      rnw=0;
   else
      flg=0;
      for ia=1:rn
         row=routxy(1,n-ia);  col=routxy(2,n-ia);
         if abs(subcf(row,col))>1 && map(row,col,2)<=rn0
            flg=1;
         end
      end
      if flg==1
         Nr=Nr+1;   
         rk(Nr)=rn;
         rw(Nr)=rnw-rn;
         for ia=1:rn
            map_new(routxy(1,n-ia),routxy(2,n-ia))=1;
         end
         rnw=0;
      end
   end
else
   Nr=Nr+1;   
   rw(Nr)=rnw;
end


rk=rk(1:Nr);   rw=rw(1:Nr);
run_hilbert=[rk; rw];

N1s=[sum(rk) min(rk)]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



qcf=subcf.*double(abs(sign(map_new)));

err=max(max(abs(subcf-qcf))) %<==== bug here !!!!!!!!!!!!!! err should be 1 !!!

cf=rstTHDctr1(qcf,T,delta,0.42*delta,0.46*delta);
e=cf-sub{1,1}; e=e.^2; e=sqrt(sum(sum(e))/(sz(1)*sz(2)));
SN=20*log10(255/e)


