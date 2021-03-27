function [ m, ml ] = GetMapping( ldrtohdr, range, maxi, f )
%Getmapping 获取m映射，这里的m映射根据公式m=f*mh+(1-f)*ml
%   输入range是最大值到最小值的跨度范围，maxi是最大值

ml = Linearization_mod( ldrtohdr, range, maxi );

m=zeros(1,uint32(range+1));
for ia=2:range+1
    va=double(ia-1)/double(range);
    m(ia)=f*va*255.0+(1-f)*ml(ia);
end 

end

