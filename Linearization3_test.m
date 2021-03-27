clc;

f=0.01;
[ outarray, H, W, D, ID, scale] = pfmread_op('E:\³ÌÐò´úÂë\É«µ÷Ó³Éä²âÊÔ\pfm\gry\memorial_o876_gry.pfm');
% [ ldr2hdr, lav2, llav2, m2, maxy2, miny2, maxl2, minl2] = BulidTMOc( outarray, 1 );
[  lav, llav, m, maxy, miny, maxl, minl ] = GetTMOParameter( outarray, 1 );
hdr0=outarray/maxy*255.0;
[ img ] = tmo_mod2( hdr0, lav, m, f );
[ ldr0 ] = tmo_mod2( hdr0, lav, m, 0 );
% 

[ hdr, ldr ] = tmo2_mod2( img, f, lav, m, miny, maxy );
% % %-------------------»Ö¸´hdrÍ¼Ïñ------------------------
% x=0:min(min(hdr0)):255;
% y=x*f+(1-f)*(1-lav^m./(x.^(1/2.2)+lav^m))*255.0;
% 
% [~,len]=size(y);
% img2hdr=zeros(1,256);
% ia=2;
% ja=2;
% x1=0; y1=0;
% x2=1; y2=double(y(ja));
% % x1=1; y1=0;
% % x2=2; y2=double(y(ja));
% while 1
%     if ia-1<y2
% %         if ia==243
% %             v=(double(ia-1)+double(y2*x1)-double(y1*x2))/(y2-y1);
% %             img2hdr(ia)=v;
% %         end
%         v=(double(ia-1)+double(y2*x1)-double(y1*x2))/(y2-y1);
%         img2hdr(ia)=v;
%         ia=ia+1;
%     else
%         if ia-1==y2
%              img2hdr(ia)=x2;
%              ia=ia+1;
%         end
%         ja=ja+1;
%         if ja>len
%             img2hdr(ia)=(double(ia-1)+double(y2*x1)-double(y1*x2))/(y2-y1);
%             break;
%         end
%         x1=x2;y1=y2;
%         x2=ja-1;
%         y2=double(y(ja));
%     end
% end
% img2hdr(ia+1:256)=img2hdr(ia);
% 
% [h,w]=size(hdr0);
% hdr=zeros(h,w);
% for ii=1:h
%     for jj=1:w 
%         p=double(img(ii,jj)+1.0);
%         a2=double(ceil(p)); 
%         b2=double(img2hdr(a2));
%         a1=a2-1; b1=double(img2hdr(a1));
%         t=b1*a2-b2*a1;
%         u=(b2-b1)*p+t;
% %         hdr(ii,jj)=(u-1)/double(len)*255.0;      
%         hdr(ii,jj)=(u)/double(len)*255.0;    
%     end
% end

% 
%  p=img(453,408)+1;
%         a2=double(ceil(p)); b2=img2hdr(a2);
%         a1=a2-1; b1=img2hdr(a1);
%         t=double(b1*a2)-double(b2*a1);
%         u=(b2-b1)*p+t;
%         re=u/len*255.0;   
% 
% %----------------Éú³ÉldrÍ¼Ïñ--------------------------
% [ldr]=tmo_mod(outarray,ldrtohdr,0);
% [h,w,d]=size(hdr);
% ldr2=zeros(h,w,d);
% maxhdr=max(max(hdr));
% for ii=1:h
%     for jj=1:w 
%         for kk=1:d
%             p=hdr(ii,jj,kk);
%             idx=p/maxhdr*double(range)+1;
%             a2=double(ceil(idx)); b2=ml(a2);
%             a1=a2-1; b1=ml(a1);
%             t=b1*a2-b2*a1;
%             y=(b2-b1)*idx+t;
%             ldr2(ii,jj,kk)=y;
%         end
%     end
% end

% out=max(max(img));
% a=f*lav^m;
% b=255*(1-f)-out;
% c=out*lav^m;
% % syms x;
% % y=f*x^3.2+a*x^2.2+b*x-c;
% f=@(x)f*x^3.2+a*x^2.2+b*x-c;
% re=fzero(f,254);
% % y=f*x^3+a*x^2+b*x-c;
% % y=(1-lav^m/(x^(1/2.2)+lav^m))*255.0==img(1,1);
% % re=solve(y,x,'ReturnConditions',true);
% re=solve(y,x);
% % re=vpasolve(y,x);



