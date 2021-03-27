clc;

f=0.5;
%%%--------------产生m---------------------
m=zeros(1,uint32(range+1));
for ia=2:range+1
    va=double(ia-1)/double(range)*maxi;
    m(ia)=f*(va/maxi*255)+(1-f)*ml(ia);
end 

[ m1 ] = GetMapping( ldrtohdr, range, maxi, f );

% [ outarray, H, W, D, ID, scale] = pfmread_op('E:\程序代码\色调映射测试\pfm\gry\memorial_o876_gry.pfm');
% [h,w,d]=size(outarray);
% img2=zeros(h,w,d);
% for ii=1:h
%     for jj=1:w 
%         for kk=1:d
%             p=outarray(ii,jj,kk);
%             idx=p/maxi*double(range)+1;
%             a2=double(ceil(idx)); b2=m(a2);
%             a1=a2-1; b1=m(a1);
%             t=b1*a2-b2*a1;
%             y=(b2-b1)*idx+t;
%             img2(ii,jj,kk)=y;
%         end
%     end
% end