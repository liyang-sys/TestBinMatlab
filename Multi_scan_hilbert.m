load H2ext
rout=int16(zeros(2,1024^2));
L=512*512;
rout(:,1:L)=routxy; 
tem=[routxy(2,:)+512; routxy(1,:)]; %[tem(:,1) tem(:,262144)]
rout(:,L+1:2*L)=tem;
tem=[routxy(2,:)+512; routxy(1,:)+512];  %[tem(:,1) tem(:,262144)]
rout(:,2*L+1:3*L)=tem;
tem=[513-routxy(1,:); (513-routxy(2,:))+512];  %[tem(:,1) tem(:,262144)]
rout(:,3*L+1:4*L)=tem;
routxy=rout;
clear rout tem x x2 x23 x3 x4 xx  y y2 y23 y3 y4 yy routxy2 routxy3 routxy4 routxy5 routxy6 routxy7
%========================================================================

%subcf=subqcf{3,3}(17:32,17:32);
%subcf=subqcf{3,1}(9:16,1:8);
subcf=subqcf{1,1};%(193:256,1:64);
sz=size(subcf); len=sz(1)*sz(2);
nnn=sum(sum(abs(sign(subcf)))) %%%%%%%%%%%%%%%%%%%%%

map=int16(zeros(sz(1),sz(2),2));



nrh=0;   
nrc=0;   
nrw=0;
nsearch=1;
for n=1:len
   row=routxy(1,n); col=routxy(2,n);
   if (subcf(row,col)~= 0) 
      
      %find run_H (rh)
      if n>=nsearch
         n1=n;
         rh=1; 
         if n+rh<=len
            flg=1;
            rw=routxy(1,n+rh);  cl=routxy(2,n+rh);
         else
            flg=0;
         end
         while (flg==1) && (subcf(rw,cl)~=0)  
            rh=rh+1;
            if n+rh+1<=len
               flg=1;
               rw=routxy(1,n+rh);  cl=routxy(2,n+rh);
            else
               flg=0;
            end
         end
         nsearch=n+rh;
         nrh=nrh+rh;
      end

      
      %find run_col (rc): horizantal (cl1 ---> cl2)
      cl=col-1;
      while cl>=1 && subcf(row,cl)~=0
         cl=cl-1;
      end
      cl1=cl+1;
      cl=col+1;
      while cl<=sz(2) && subcf(row,cl)~=0
         cl=cl+1;
      end
      cl2=cl-1;
      rc=cl2-cl1+1;
      nrc=nrc+rc;

      
      %find run_row (rr):   vertial (rw1 ---> rw2)
      rw=row-1;
      while rw>=1 && subcf(rw,col)~=0
         rw=rw-1;
      end
      rw1=rw+1;
      rw=row+1;
      while rw<=sz(1) && subcf(rw,col)~=0
         rw=rw+1;
      end
      rw2=rw-1;
      rw=rw2-rw1+1;
      nrw=nrw+rw;
            
      
      [val,idx]=max([rh rc rw]);  
      if idx==3 %vertical
         for ia=rw1:rw2
            if map(ia,col,2)<rw
               map(ia,col,1)=3;
               map(ia,col,2)=rw;
            end
         end
      elseif idx==2 %horizantal
         for ia=cl1:cl2
            if map(row,ia,2)<rc
               map(row,ia,1)=2;
               map(row,ia,2)=rc;
            end
         end
      else
         for ia=n1:n1+rh-1
            if map(routxy(1,ia),routxy(2,ia),2)<=rh
               map(routxy(1,ia),routxy(2,ia),1)=1;
               map(routxy(1,ia),routxy(2,ia),2)=rh;
            end
         end
      end
      
   end
end

%plotmap

%sum(sum(sign(map(:,:,1))))
%nrh
%nrc
%nrw