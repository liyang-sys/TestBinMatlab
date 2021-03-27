%load Cactus_96frames
%load ParkScene_96frames
%load Kimono_96frames
%load CrowdRun_96frames
%load OldTownCross_96frames

%a=a/256;
%a=a/1024;
b=zeros(512,512,3);
%c=zeros(1024,1024,3);
for fm=1:32
   %b(:,:,1)=a(1:512,1:512,fm+32); b(:,:,2)=b(:,:,1); b(:,:,3)=b(:,:,1); 
   b(:,:,1)=a(1:512,513:1024,fm+32); b(:,:,2)=b(:,:,1); b(:,:,3)=b(:,:,1); 
   %b(:,:,1)=a(513:1024,513:1024,fm+32); b(:,:,2)=b(:,:,1); b(:,:,3)=b(:,:,1); 
   %b(:,:,1)=a(513:1024,1:512,fm+32); b(:,:,2)=b(:,:,1); b(:,:,3)=b(:,:,1); 
   M(fm)=im2frame(b);
   
   %c(:,:,1)=a(:,:,fm); c(:,:,2)=c(:,:,1); c(:,:,3)=c(:,:,1); 
   %M(fm)=im2frame(c);
end

movie(M,1,50);
%movie(M,1,24);
