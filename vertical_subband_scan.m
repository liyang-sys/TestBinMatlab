multi_scan_vertical
scan_maps

%run_row, which is in the vertical direction (fixed col, row changing)
rk=int16(zeros(1,len));   rw=rk;

rn=0;  Nr=0;  
map_new=int8(zeros(sz)); np=1;
for n=1:len
   row=rout_row(1,n); col=rout_row(2,n);   
   if subcf(row,col)~=0 
      if map(row,col,1)==3  ||  rn>0
         rn=rn+1;
      end
   else
      if rn>0
         if rn>4
            Nr=Nr+1;  
            rk(Nr)=rn;
            rw(Nr)=n-rn-np;   np=n;
            for ia=1:rn
               map_new(rout_row(1,n-ia),rout_row(2,n-ia))=3;
            end
         else
            flg=0;
            for ia=1:rn
               row=rout_row(1,n-ia);  col=rout_row(2,n-ia);
               if abs(subcf(row,col))>1 && map(row,col,2)<=rn,  flg=1; end
            end
            if flg>0
               Nr=Nr+1;   
               rk(Nr)=rn;
               rw(Nr)=n-rn-np;   np=n;
               for ia=1:rn
                  map_new(rout_row(1,n-ia),rout_row(2,n-ia))=3;
               end
            end
         end
         rn=0;
      end
   end
end
if rn>4
   Nr=Nr+1;   
   rk(Nr)=rn;
   rw(Nr)=n-nr-np;   np=n;
end
rk=rk(1:Nr);   rw=rw(1:Nr);
run_vertical=[rk; rw];

N1s=[sum(rk) min(rk)]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tem=map(:,:,1); N1s=sum(sum(1-abs(sign(3-tem)))) %%%%%%%%%%%%%%%%%%%%%%%%

%Now Hilbert scan:  =========================================================

map_newA=map_new; 
rk=int16(zeros(1,len));   rw=rk;
rn=0;  Nr=0;  
np=1;
for n=1:len
   row=routxy(1,n); col=routxy(2,n);   
   if subcf(row,col)~=0
      if (map(row,col,1)==1  ||  rn>0)   &&   map_new(row,col)==0 
         rn=rn+1;
      end
   else
      if rn>0
         if rn>4
            Nr=Nr+1;  
            rk(Nr)=rn;
            rw(Nr)=n-rn-np;   np=n;

            rnn=1; ia=1;
            while rnn<=rn
               row=routxy(1,n-ia); col=routxy(2,n-ia);
               if map_new(row,col)==0, 
                  map_new(row,col)=1; rnn=rnn+1;
               end
               ia=ia+1;
            end
         else
            flg=0;
            rnn=1; ia=1;
            while rnn<=rn
               row=routxy(1,n-ia); col=routxy(2,n-ia);
               if map_new(row,col)==0
                  rnn=rnn+1;
                  if abs(subcf(row,col))>1  &&  map(row,col,1)==1 
                     flg=1;
                  end
               end
               ia=ia+1;
            end

            if flg>0
               Nr=Nr+1;   
               rk(Nr)=rn;
               rw(Nr)=n-rn-np;   np=n;

               rnn=1; ia=1;
               while rnn<=rn
                  row=routxy(1,n-ia); col=routxy(2,n-ia);
                  if map_new(row,col)==0 
                     map_new(row,col)=1; rnn=rnn+1;
                  end
                  ia=ia+1;
               end
            end
         end
         rn=0;
      end
   end
end
if rn>0
         if rn>4
            Nr=Nr+1;  
            rk(Nr)=rn;
            rw(Nr)=n-rn-np;   np=n;

            rnn=1; ia=1;
            while rnn<=rn
               row=routxy(1,n-ia); col=routxy(2,n-ia);
               if map_new(row,col)==0, 
                  map_new(row,col)=1; rnn=rnn+1;
               end
               ia=ia+1;
            end
         else
            flg=0;
            rnn=1; ia=1;
            while rnn<=rn
               row=routxy(1,n-ia); col=routxy(2,n-ia);
               if map_new(row,col)==0
                  rnn=rnn+1;
                  if abs(subcf(row,col))>1  &&  map(row,col,1)==1 
                     flg=1;
                  end
               end
               ia=ia+1;
            end

            if flg>0
               Nr=Nr+1;   
               rk(Nr)=rn;
               rw(Nr)=n-rn-np;   np=n;

               rnn=1; ia=1;
               while rnn<=rn
                  row=routxy(1,n-ia); col=routxy(2,n-ia);
                  if map_new(row,col)==0 
                     map_new(row,col)=1; rnn=rnn+1;
                  end
                  ia=ia+1;
               end
            end
         end
         rn=0;
end
rk=rk(1:Nr);   rw=rw(1:Nr);

run_hilbert=[rk; rw];

N1s=[sum(rk) min(rk)]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%Now horizantal scan:  =========================================================

map_newB=map_new; 
rk=int16(zeros(1,len));   rw=rk;
rn=0;  Nr=0;  
np=1;
for n=1:len
   row=rout_col(1,n); col=rout_col(2,n);   
   if subcf(row,col)~=0
      if (map(row,col,1)==2  ||  rn>0)   &&   map_new(row,col)==0 
         rn=rn+1;
      end
   else
      if rn>0
         if rn>4
            Nr=Nr+1;  
            rk(Nr)=rn;
            rw(Nr)=n-rn-np;   np=n;

            rnn=1; ia=1;
            while rnn<=rn
               row=rout_col(1,n-ia); col=rout_col(2,n-ia);
               if map_new(row,col)==0, 
                  map_new(row,col)=2; rnn=rnn+1;
               end
               ia=ia+1;
            end
         else
            flg=0;
            rnn=1; ia=1;
            while rnn<=rn
               row=rout_col(1,n-ia); col=rout_col(2,n-ia);
               if map_new(row,col)==0
                  rnn=rnn+1;
                  if abs(subcf(row,col))>1  &&  map(row,col,1)==2 
                     flg=1;
                  end
               end
               ia=ia+1;
            end

            if flg>0
               Nr=Nr+1;   
               rk(Nr)=rn;
               rw(Nr)=n-rn-np;   np=n;

               rnn=1; ia=1;
               while rnn<=rn
                  row=rout_col(1,n-ia); col=rout_col(2,n-ia);
                  if map_new(row,col)==0 
                     map_new(row,col)=2; rnn=rnn+1;
                  end
                  ia=ia+1;
               end
            end
         end
         rn=0;
      end
   end
end
if rn>0
end
rk=rk(1:Nr);   rw=rw(1:Nr);
run_horizantal=[rk; rw];
N1s=[sum(rk) min(rk)]%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rns=[run_vertical run_hilbert run_horizantal];

nnon=sum(sum(abs(sign(map_new))))
lenrv=length(run_vertical)
lenrhil=length(run_hilbert)
lenrhor=length(run_horizantal)
lenr=lenrv+lenrhil+lenrhor


qcf=subcf.*double(abs(sign(map_new)));

err=max(max(abs(subcf-qcf))) %<==== bug here !!!!!!!!!!!!!! err should be 1 !!!

cf=rstTHDctr1(qcf,T,delta,0.42*delta,0.46*delta);
e=cf-sub{1,1}; e=e.^2; e=sqrt(sum(sum(e))/(sz(1)*sz(2)));
SN=20*log10(255/e)


