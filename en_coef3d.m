function bin=en_coef3d(Lev_sub,wh,delta0)

if wh==8
   load H3L3
   px0=3;
elseif wh==4
   load H3L2
   px0=2;
elseif wh==2
   load H3L1
   px0=1;
end

n7=H3cutted(px0,7,n)'+1;
n7=[n7(2,:); n7(3,:); n7(1,:)];

n6=H3cutted(px0,6,n)'+1;
n6=[n6(2,:); n6(3,:); n6(1,:)];

n5=H3cutted(px0,5,n)'+1;
n5=[n5(2,:); n5(3,:); n5(1,:)];

n4=H3cutted(px0,4,n)'+1;
n4=[n4(2,:); n4(3,:); n4(1,:)];

%whos %%%%%%%%%%%%%%%%%%%%%%

w=2^5; 
bin=[];
for r=1:2
   for c=1:2
      %row_col=[r c] %<==================================================
      sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
      bn=en_sub3d(sub,n5,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%
      bin=[bin bn];
   end
end

w=2^6; 
rc=[1 2; 2 2; 2 1];
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n6,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end

w=2^7; 
r=1 %%%%%%%%%%%%%%%%%%%%%
for c=2:8
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n7,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin=[bin bn];
end
for r=2:8
   r
   for c=1:8
      %row_col=[r c] %<==================================================
      sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
      [bn,qcf]=en_sub3d(sub,n7,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
      bin=[bin bn];
   end
end
