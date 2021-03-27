function A=readMRI(slice)

%infile='MRI\t1_icbm_normal_1mm_pn3_rf20.mnc'; fid=fopen(infile); 
infile='MRI\t1_ai_msles2_1mm_pn3_rf20.mnc'; fid=fopen(infile); 

A=zeros(512,512);
%env=(cos([0:8]/8*pi)+1)/2; envv=fliplr(env);
oft=20/256; env=(cos([0:8]/8*pi)+1)*0.5*(236/256) +oft;   envv=fliplr(env);
tem=[zeros(32,1)+oft; envv']; ev1=zeros(41,217); for ia=1:217, ev1(:,ia)=tem; end
tem=[env'; zeros(33,1)+oft]; ev2=zeros(42,217); for ia=1:217, ev2(:,ia)=tem; end
tem=[zeros(1,14)+oft envv]; ev3=zeros(256,23); for ia=1:256, ev3(ia,:)=tem; end
tem=[env zeros(1,15)+oft]; ev4=zeros(256,24); for ia=1:256, ev4(ia,:)=tem; end

n=181*217;
STATUS = fseek(fid, 3578+(slice-1)*n*2, 'bof');

a=fread(fid,[181 217],'uint16');
b8=256; a1=floor(a/b8); a2=a1*b8; aa=(a-a2)*b8+a1;
d=zeros(37,217); for ia=1:37, d(ia,:)=aa(1,:); end;   aa=[d; aa];  aa(1:41,:)=aa(1:41,:).*ev1;
d=zeros(38,217); for ia=1:38, d(ia,:)=aa(218,:); end;   aa=[aa; d]; aa(215:256,:)=aa(215:256,:).*ev2;
d=zeros(256,19); for ia=1:19, d(:,ia)=aa(:,1); end;   aa=[d aa]; aa(:,1:23)=aa(:,1:23).*ev3;
d=zeros(256,20); for ia=1:20, d(:,ia)=aa(:,236); end;   aa=[aa d]; aa(:,233:256)=aa(:,233:256).*ev4;
A(1:256,1:256)=aa;

a=fread(fid,[181 217],'uint16');
b8=256; a1=floor(a/b8); a2=a1*b8; aa=(a-a2)*b8+a1;
d=zeros(37,217); for ia=1:37, d(ia,:)=aa(1,:); end;   aa=[d; aa];  aa(1:41,:)=aa(1:41,:).*ev1;
d=zeros(38,217); for ia=1:38, d(ia,:)=aa(218,:); end;   aa=[aa; d]; aa(215:256,:)=aa(215:256,:).*ev2;
d=zeros(256,19); for ia=1:19, d(:,ia)=aa(:,1); end;   aa=[d aa]; aa(:,1:23)=aa(:,1:23).*ev3;
d=zeros(256,20); for ia=1:20, d(:,ia)=aa(:,236); end;   aa=[aa d]; aa(:,233:256)=aa(:,233:256).*ev4;
A(1:256,257:512)=aa;

a=fread(fid,[181 217],'uint16');
b8=256; a1=floor(a/b8); a2=a1*b8; aa=(a-a2)*b8+a1;
d=zeros(37,217); for ia=1:37, d(ia,:)=aa(1,:); end;   aa=[d; aa];  aa(1:41,:)=aa(1:41,:).*ev1;
d=zeros(38,217); for ia=1:38, d(ia,:)=aa(218,:); end;   aa=[aa; d]; aa(215:256,:)=aa(215:256,:).*ev2;
d=zeros(256,19); for ia=1:19, d(:,ia)=aa(:,1); end;   aa=[d aa]; aa(:,1:23)=aa(:,1:23).*ev3;
d=zeros(256,20); for ia=1:20, d(:,ia)=aa(:,236); end;   aa=[aa d]; aa(:,233:256)=aa(:,233:256).*ev4;
A(257:512,1:256)=aa;

a=fread(fid,[181 217],'uint16');
b8=256; a1=floor(a/b8); a2=a1*b8; aa=(a-a2)*b8+a1;
d=zeros(37,217); for ia=1:37, d(ia,:)=aa(1,:); end;   aa=[d; aa];  aa(1:41,:)=aa(1:41,:).*ev1;
d=zeros(38,217); for ia=1:38, d(ia,:)=aa(218,:); end;   aa=[aa; d]; aa(215:256,:)=aa(215:256,:).*ev2;
d=zeros(256,19); for ia=1:19, d(:,ia)=aa(:,1); end;   aa=[d aa]; aa(:,1:23)=aa(:,1:23).*ev3;
d=zeros(256,20); for ia=1:20, d(:,ia)=aa(:,236); end;   aa=[aa d]; aa(:,233:256)=aa(:,233:256).*ev4;
A(257:512,257:512)=aa;

fclose(fid); 
