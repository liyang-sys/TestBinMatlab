function [ outarray, H, W, D, ID, max ] = ppmread_gry( infilename )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
fid = fopen(infilename, 'r');
ID=fscanf(fid, '%s', 1);
W=fscanf(fid, '%f', 1);
H=fscanf(fid, '%f',1);
max=fscanf(fid,'%f',1);
fscanf(fid,'%c',1);             %%�����ո�

if strcmp('P6',ID) == 1     %%��ɫͼ��
     D=3;
     if max<=256
         outarray=uint8(zeros(H,W,D));
         A=uint8(fread(fid,[1,H*W*D],'uint8'));
         A=reshape(A,[3,H*W]);
     else
         outarray=uint16(zeros(H,W,D));
         A=uint16(fread(fid,[1,H*W*D],'uint16', 'b'));
         A=reshape(A,[3,H*W]);
     end
     outarray(:,:,1)=reshape(A(1,:),[W,H])';
     outarray(:,:,2)=reshape(A(2,:),[W,H])';
     outarray(:,:,3)=reshape(A(3,:),[W,H])';
elseif strcmp('P5',ID) == 1 %%�Ҷ�ͼ��
      D=1;
      if max <= 256
         A=uint8(fread(fid,[1,H*W],'uint8'));
      else
         A=uint16(fread(fid,[1,H*W],'uint16','b'));
      end
      outarray=reshape(A,[W,H])';       
else
     D=0;
     outarray=0;
     fprintf('\n   This is not a PPM image.  \n');
end

fclose(fid);


end

