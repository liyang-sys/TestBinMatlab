function [ m, ml ] = GetMapping( ldrtohdr, range, maxi, f )
%Getmapping ��ȡmӳ�䣬�����mӳ����ݹ�ʽm=f*mh+(1-f)*ml
%   ����range�����ֵ����Сֵ�Ŀ�ȷ�Χ��maxi�����ֵ

ml = Linearization_mod( ldrtohdr, range, maxi );

m=zeros(1,uint32(range+1));
for ia=2:range+1
    va=double(ia-1)/double(range);
    m(ia)=f*va*255.0+(1-f)*ml(ia);
end 

end

