function [coef]=readcoef(Videoinfile,PTVinfile,H,W)

fid=fopen(Videoinfile,'rb');
SCWP=zeros(H,W,96);
for ii=1:96
    for jj=1:H
        temp=fread(fid, W,'single');
        SCWP(jj,:,ii)=temp';
    end
end
fclose(fid);

h=H/8;w=W/8;d=8;
ac=zeros(H,W,96);
%============先整理8X8X4===============
for n=1:3
    for x=1:8
        for y=1:8
            for z=1:4
                for ii=1:h
                    for jj=1:w
                        for kk=1:d
                            ac(ii+(x-1)*h,jj+(y-1)*w,kk+(z-1)*d+(n-1)*32)=SCWP(x+(ii-1)*8,y+(jj-1)*8,z+(kk-1)*4+(n-1)*32);
                        end
                    end
                end
            end
        end
    end
end
clear SCWP;
%=============再整理harr变换=============
b=ac;
for n=1:3
    b(:,:,2+(n-1)*32)=ac(:,:,5+(n-1)*32);
    b(:,:,3+(n-1)*32)=ac(:,:,3+(n-1)*32);
    b(:,:,4+(n-1)*32)=ac(:,:,7+(n-1)*32);
    b(:,:,5+(n-1)*32)=ac(:,:,2+(n-1)*32);
    b(:,:,6+(n-1)*32)=ac(:,:,4+(n-1)*32);
    b(:,:,7+(n-1)*32)=ac(:,:,6+(n-1)*32);
    b(:,:,8+(n-1)*32)=ac(:,:,8+(n-1)*32);
end
clear ac;

coef=b;
coef(:,:,1)=b(:,:,1); coef(:,:,2)=b(:,:,33); coef(:,:,3)=b(:,:,65);
coef(:,:,4)=b(:,:,2); coef(:,:,5)=b(:,:,34); coef(:,:,6)=b(:,:,66);
coef(:,:,7)=b(:,:,3); coef(:,:,9)=b(:,:,35); coef(:,:,11)=b(:,:,67);
coef(:,:,8)=b(:,:,4); coef(:,:,10)=b(:,:,36); coef(:,:,12)=b(:,:,68);
coef(:,:,13)=b(:,:,5); coef(:,:,17)=b(:,:,37); coef(:,:,21)=b(:,:,69);
coef(:,:,14)=b(:,:,6); coef(:,:,18)=b(:,:,38); coef(:,:,22)=b(:,:,70);
coef(:,:,15)=b(:,:,7); coef(:,:,19)=b(:,:,39); coef(:,:,23)=b(:,:,71);
coef(:,:,16)=b(:,:,8); coef(:,:,20)=b(:,:,40); coef(:,:,24)=b(:,:,72);

coef(:,:,25:32)=b(:,:,9:16); coef(:,:,33:40)=b(:,:,41:48); coef(:,:,41:48)=b(:,:,73:80);
coef(:,:,49:56)=b(:,:,17:24); coef(:,:,57:64)=b(:,:,49:56); coef(:,:,65:72)=b(:,:,81:88);
coef(:,:,73:80)=b(:,:,25:32); coef(:,:,81:88)=b(:,:,57:64); coef(:,:,89:96)=b(:,:,89:96);

clear b;
%===========最后处理PTV====================
fid=fopen(PTVinfile,'r');
PTV=zeros(h,w,96);
for ii=1:96
    for jj=1:h
        temp=fread(fid, w,'single');
        PTV(jj,:,ii)=temp';
    end
end
fclose(fid);
coef(1:h,1:w,:)=PTV; coef=single(coef);

end
% function [coef]=readcoef(H,W)
% 
% fid=fopen('Video_Beauty.dat','rb');
% SCWP=zeros(H,W,96);
% for ii=1:96
%     for jj=1:H
%         temp=fread(fid, W,'single');
%         SCWP(jj,:,ii)=temp';
%     end
% end
% fclose(fid);
% 
% h=H/8;w=W/8;d=8;
% ac=zeros(H,W,96);
% %============先整理8X8X4===============
% for n=1:3
%     for x=1:8
%         for y=1:8
%             for z=1:4
%                 for ii=1:h
%                     for jj=1:w
%                         for kk=1:d
%                             ac(ii+(x-1)*h,jj+(y-1)*w,kk+(z-1)*d+(n-1)*32)=SCWP(x+(ii-1)*8,y+(jj-1)*8,z+(kk-1)*4+(n-1)*32);
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% 
% %=============再整理harr变换=============
% b=ac;
% for n=1:3
%     b(:,:,2+(n-1)*32)=ac(:,:,5+(n-1)*32);
%     b(:,:,3+(n-1)*32)=ac(:,:,3+(n-1)*32);
%     b(:,:,4+(n-1)*32)=ac(:,:,7+(n-1)*32);
%     b(:,:,5+(n-1)*32)=ac(:,:,2+(n-1)*32);
%     b(:,:,6+(n-1)*32)=ac(:,:,4+(n-1)*32);
%     b(:,:,7+(n-1)*32)=ac(:,:,6+(n-1)*32);
%     b(:,:,8+(n-1)*32)=ac(:,:,8+(n-1)*32);
% end
% coef=b;
% coef(:,:,1)=b(:,:,1); coef(:,:,2)=b(:,:,33); coef(:,:,3)=b(:,:,65);
% coef(:,:,4)=b(:,:,2); coef(:,:,5)=b(:,:,34); coef(:,:,6)=b(:,:,66);
% coef(:,:,7)=b(:,:,3); coef(:,:,9)=b(:,:,35); coef(:,:,11)=b(:,:,67);
% coef(:,:,8)=b(:,:,4); coef(:,:,10)=b(:,:,36); coef(:,:,12)=b(:,:,68);
% coef(:,:,13)=b(:,:,5); coef(:,:,17)=b(:,:,37); coef(:,:,21)=b(:,:,69);
% coef(:,:,14)=b(:,:,6); coef(:,:,18)=b(:,:,38); coef(:,:,22)=b(:,:,70);
% coef(:,:,15)=b(:,:,7); coef(:,:,19)=b(:,:,39); coef(:,:,23)=b(:,:,71);
% coef(:,:,16)=b(:,:,8); coef(:,:,20)=b(:,:,40); coef(:,:,24)=b(:,:,72);
% 
% coef(:,:,25:32)=b(:,:,9:16); coef(:,:,33:40)=b(:,:,41:48); coef(:,:,41:48)=b(:,:,73:80);
% coef(:,:,49:56)=b(:,:,17:24); coef(:,:,57:64)=b(:,:,49:56); coef(:,:,65:72)=b(:,:,81:88);
% coef(:,:,73:80)=b(:,:,25:32); coef(:,:,81:88)=b(:,:,57:64); coef(:,:,89:96)=b(:,:,89:96);
% %===========最后处理PTV====================
% fid=fopen('PTV_Beauty.dat','r');
% PTV=zeros(h,w,96);
% for ii=1:96
%     for jj=1:h
%         temp=fread(fid, w,'single');
%         PTV(jj,:,ii)=temp';
%     end
% end
% fclose(fid);
% coef(1:h,1:w,:)=PTV; coef=single(coef);
% 
% end