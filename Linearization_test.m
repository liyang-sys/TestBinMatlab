clc;

%%%------------------生成hdrtoldr测试---------------------------
% maxi=624.0156;
% mini=0.0018;
% range=uint32(maxi/mini);
% [ hdrtoldr ] = Linearization_mod( ldrtohdr, range, maxi );
% hdrtoldr=zeros(1,range+1);
% hdrtoldr(1)=0;
% jj=2;
% ii=2;
% 
% x1=0;x2=1;
% y1=0;y2=ldrtohdr(jj);
% y=(ii-1)/double(range)*maxi;
% while ii<=range+1
%     if y<=y2
%        hdrtoldr(ii)=double((y+y2*x1-y1*x2)/(y2-y1));
%        ii=ii+1;
%        y=(ii-1)/double(range)*maxi;
%     else
%        jj=jj+1;
%        x1=x2; y1=y2;
%        x2=x1+1; y2=ldrtohdr(jj);
%     end
% end
f=0;

[ outarray, H, W, D, ID, scale] = pfmread_op('E:\程序代码\色调映射测试\pfm\gry\memorial_o876_gry.pfm');
[ ldrtohdr ] = BulidTMOc( outarray, 1 );
[img, ml, range, maxi]=tmo_mod(outarray,ldrtohdr,f);

%%%---------------------hdrtoldr生成ldr测试---------------------------
% [ hdrtoldr ] = Linearization_mod( ldrtohdr, range, maxi );
ldr=zeros(1,256);
for ia=1:H
    for ja=1:W
        x=outarray(ia,ja)/maxi*double(range)+1;
        a2=double(ceil(x)); b2=ml(a2);
        a1=a2-1; b1=ml(a1);
        t=b1*a2-b2*a1;
        y=(b2-b1)*x+t;
        ldr(ia,ja)=y;
    end
end

[ hdr, ldr2 ] = tmo2_mod( img, ldrtohdr, f, range, maxi );

% ia=10;ja=1;
%     x=0.0019/maxi*double(range); x=x+1;
%         a2=double(ceil(x)); b2=hdrtoldr(a2);
%         a1=double(a2-1); b1=hdrtoldr(a1);
% %         t1=b1*a2; t2=b2*a1;
%         t=b1*a2-b2*a1;
%         y=(b2-b1)*x+t;
%         y=(b2-b1)*x+double(b1*a2)-double(b2*a1);
        