function [ outarray, H, W, D, ID, scale] = pfmread_op( infilename)

fid = fopen(infilename, 'r');
% ID=fscanf(fid, '%c', [1,3]);
ID=fscanf(fid, '%s', 1);
W=fscanf(fid, '%f', 1);
H=fscanf(fid, '%f',1);
scale=fscanf(fid,'%f',1);
fscanf(fid,'%c',1);             %%跳过空格

if strcmp('PF',ID) == 1     %%彩色图像
     D=3;
     outarray=single(zeros(H,W,D));
     if scale < 0           %小端存放，即低位字节排放在内存的低地址端
        A=single(fread(fid,[1,H*W*D],'single'));
     else      %大端存放，即低位字节排放在内存的高地址端
        A=single(fread(fid,[1,H*W*D],'single', 'b'));
     end
     A=reshape(A,[3,H*W]);
     outarray(:,:,1)=reshape(A(1,:),[W,H])';
     outarray(:,:,2)=reshape(A(2,:),[W,H])';
     outarray(:,:,3)=reshape(A(3,:),[W,H])';
     
elseif strcmp('Pf',ID) == 1 %%灰度图像
      D=1;
      if scale < 0           
         A=single(fread(fid,[1,H*W],'single'));
      else      
         A=single(fread(fid,[1,H*W],'single', 'b'));
      end
      outarray=reshape(A,[W,H])';       
else
     D=0;
     outarray=0;
     fprintf('\n   This is not a PFM image.  \n');
end

fclose(fid);

end

