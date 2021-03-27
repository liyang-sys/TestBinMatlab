function [ A ] = read_doubletohalf( infilename, h, w, isgry )
%�˺���������ȡ������ͨ��DoubleToHalfת���õ�����������
%   infilenameӦ����.dat��׺�Ķ������ļ���h��w�ֱ���ͼ��ĸߺͿ�
%   isgry��ʾͼ���ǲ�ɫͼ���ǻҶ�ͼ��isgry=0��ʾ�ǲ�ɫͼ��
fid=fopen(infilename,'r');

if isgry==0
    A=uint16(zeros(h,w,3));
    hdr=fread(fid,[1,w*h*3],'uint16');
    hdr=reshape(hdr,[3,w*h]);
    A(:,:,1)=reshape(hdr(1,:),[w,h])';
    A(:,:,2)=reshape(hdr(2,:),[w,h])';
    A(:,:,3)=reshape(hdr(3,:),[w,h])';
else
    hdr=fread(fid,'uint16');
    hdr=reshape(hdr,w,h);
    A=hdr';
end
fclose(fid);

end

