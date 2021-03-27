infile='\SignifProp\bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%infile='\SignifProp\cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%infile='\SignifProp\woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);


imshow(a/255)

d=101;
a=uint8(a(d:d+2047,:));
figure; imshow(a)

%d=301; dd=513; %woman
%d=701; dd=313; %cafe
d=201; dd=713; %bike
a=uint8(a(d:d+1023,dd:dd+1023));
figure; imshow(a)
