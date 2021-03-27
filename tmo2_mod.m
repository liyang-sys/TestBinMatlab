function [ hdr, ldr ] = tmo2_mod( img, ldrtohdr, f, range, maxi )
%将img映射到hdr和ldr
%   
[ m, ml ] = GetMapping( ldrtohdr, range, maxi, f );
[ imgtohdr ] = Linearization3_mod( m, range );

maxm=max(m);
%-------------------恢复hdr图像------------------------
[h,w,d]=size(img);
hdr=zeros(h,w,d);
for ii=1:h
    for jj=1:w 
        for kk=1:d
            ve=img(ii,jj,kk);
            id=ve/double(maxm)*double(range)+1;
%             if (1<id) && (id<=double(range+1))
            if id<=double(range+1)
                a2=double(ceil(id)); b2=imgtohdr(a2);
                a1=a2-1; b1=imgtohdr(a1);
                t=b1*a2-b2*a1;
                y=(b2-b1)*id+t;
%             elseif id == 1 
%                 y=imgtohdr(1);
            else
                y=imgtohdr(range+1);
            end
            hdr(ii,jj,kk)=double(y)/double(range)*maxi;
        end
    end
end

%----------------生成ldr图像--------------------------
[h,w,d]=size(hdr);
ldr=zeros(h,w,d);
maxhdr=max(max(hdr));
for ii=1:h
    for jj=1:w 
        for kk=1:d
            p=hdr(ii,jj,kk);
            idx=p/maxhdr*double(range)+1;
         
                a2=double(ceil(idx)); b2=ml(a2);
                a1=a2-1; b1=ml(a1);
                t=b1*a2-b2*a1;
                y=(b2-b1)*idx+t;              
               
            ldr(ii,jj,kk)=y;
        end
    end
end

end