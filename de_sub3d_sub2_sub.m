function [z,cfk,ptr]=de_sub3d_sub2_sub(biny,thd,len,ptr)

if round(thd/3)~=thd/3, typ=1; else, typ=2; end 
thdh=thd/2; thdq=thd/4; thdt=thd/8;



%???????????????????????????????????????????????????????????????????????????
%binz=biny(ptr:ptr+574); ptr=ptr+575;  z=de_r_cr(binz,len,1); biny(ptr:length(biny))
%???????????????????????????????????????????????????????????????????????????


[z,ptr]=de_r_cr(biny,len,ptr);
len1=length(z)-sum(z);

if thd==1
   cfk=ones(1,len1);
elseif thd==2
   thdh=1;
   [z1,ptr]=de_r_cr(biny,len1,ptr);
   cfk=z1+1;
elseif thd==3
   thdh=2; thdq=1;
   L2=biny(ptr); ptr=ptr+1; %%%%%%%%%%%%
   [z1,ptr]=de_r_cr(biny,len1,ptr);
   lenw=sum(z1); lenk=length(z1)-lenw;
   if L2==0
      typ=1; [cf11,ptr]=de_2n_code_new(biny,lenk,thdh,typ,ptr);
   else
      [cf11,ptr]=de_r_cr(biny,lenk,ptr);  cf11=cf11+1;
   end
   cfk=separate_inv(z1,ones(1,lenw)+thdh,cf11);
   
elseif thd==4
   [L2,ptr] = deSFcode(biny,3,ptr); L2=L2-1; %%%%%%%%%%

   z2=cell(1,L2); cf1=cell(1,2);  cf2=cell(1,4);

   [z1,ptr]=de_r_cr(biny,len1,ptr);
   
   len3=zeros(1,8);   len1=zeros(1,2);
   len1(2)=sum(z1); len1(1)=length(z1)-len1(2);
   if L2==0
      [cf1{1},ptr]=de_2n_code_new(biny,len1(1),thdh,typ,ptr);
      [cf1{2},ptr]=de_2n_code_new(biny,len1(2),thdh,typ,ptr);
   else
      for nd2=1:L2
         [cf1{nd2},ptr]=de_r_cr(biny,len1(nd2),ptr);  cf1{nd2}=cf1{nd2}+1;
      end
      for nd2=L2+1:2
         [cf1{nd2},ptr]=de_2n_code_new(biny,len1(nd2),thdh,typ,ptr);
      end
   end
   cfk=separate_inv(z1,cf1{2}+thdh,cf1{1});
      
elseif thd==6
   thdh=3; thdq=2; typ2=1;
   [L2,ptr] = deSFcode(biny,3,ptr); L2=L2-1;
   [L3,ptr] = deSFcode(biny,3,ptr); L3=L3-1;
   
   z2=cell(1,L2); cf1=cell(1,2);  cf2=cell(1,4);
   z3=cell(1,L3); cf3k=cell(1,L3); cf3w=cell(1,L3);
   
   [z1,ptr]=de_r_cr(biny,len1,ptr);
   
   len3=zeros(1,8);   len1=zeros(1,2);
   len1(2)=sum(z1); len1(1)=length(z1)-len1(2);
   if L2==0
      [cf1{1},ptr]=de_2n_code_new(biny,len1(1),thdh,typ,ptr);
      [cf1{2},ptr]=de_2n_code_new(biny,len1(2),thdh,typ,ptr);
   else
      %L2,L3 %%%%%%%%%%%%%%%%%%%%
      for nd2=1:L2
         [z2{nd2},ptr]=de_r_cr(biny,len1(nd2),ptr);
         len31=sum(z2{nd2}); len3(nd2)=length(z2{nd2})-len31;
         if L3<nd2
            [cf2{nd2},ptr]=de_2n_code_new(biny,len3(nd2),thdq,typ2,ptr);
         else
            [cf2{nd2},ptr]=de_r_cr(biny,len3(nd2),ptr); cf2{nd2}=cf2{nd2}+1;
         end
         cf1{nd2}=separate_inv(z2{nd2},ones(1,len31)+thdq,cf2{nd2});
      end
      for nd2=L2+1:2
         [cf1{nd2},ptr]=de_2n_code_new(biny,len1(nd2),thdh,typ,ptr);
      end
   end
   cfk=separate_inv(z1,cf1{2}+thdh,cf1{1});

elseif thd==8
   [L2,ptr] = deSFcode(biny,3,ptr); L2=L2-1;
   [L3,ptr] = deSFcode(biny,5,ptr); L3=L3-1;

   z2=cell(1,L2); cf1=cell(1,2);  cf2=cell(1,4);
   z3=cell(1,L3); cf3k=cell(1,L3); cf3w=cell(1,L3);

   [z1,ptr]=de_r_cr(biny,len1,ptr);
   
   len3=zeros(1,8);   len1=zeros(1,2);
   len1(2)=sum(z1); len1(1)=length(z1)-len1(2);
   if L2==0
      [cf1{1},ptr]=de_2n_code_new(biny,len1(1),thdh,typ,ptr);
      [cf1{2},ptr]=de_2n_code_new(biny,len1(2),thdh,typ,ptr);
   else
      for nd2=1:L2
         na=2*nd2-1; nb=na+1;
         [z2{nd2},ptr]=de_r_cr(biny,len1(nd2),ptr);
         len3(nb)=sum(z2{nd2}); len3(na)=length(z2{nd2})-len3(nb);
         for nd3=na:nb
            if L3<nd3
               [cf2{nd3},ptr]=de_2n_code_new(biny,len3(nd3),thdq,typ,ptr);
            else
               [z3{nd3},ptr]=de_r_cr(biny,len3(nd3),ptr);
               cf2{nd3}=z3{nd3}+1;
            end
         end
         cf1{nd2}=separate_inv(z2{nd2},cf2{nb}+thdq,cf2{na});
      end
      for nd2=L2+1:2
         [cf1{nd2},ptr]=de_2n_code_new(biny,len1(nd2),thdh,typ,ptr);
      end
   end
   cfk=separate_inv(z1,cf1{2}+thdh,cf1{1});
      
elseif thd==12
   thdh=6; thdq=3; thdt=2; typ3=1;
   [L2,ptr] = deSFcode(biny,3,ptr); L2=L2-1;
   [L3,ptr] = deSFcode(biny,5,ptr); L3=L3-1;
   
   z2=cell(1,L2); cf1=cell(1,2);  cf2=cell(1,4);
   z3=cell(1,L3); cf3k=cell(1,L3); cf3w=cell(1,L3);
   
   [z1,ptr]=de_r_cr(biny,len1,ptr);
   
   len3=zeros(1,8);   len1=zeros(1,2);
   len1(2)=sum(z1); len1(1)=length(z1)-len1(2);
   if L2==0
      [cf1{1},ptr]=de_2n_code_new(biny,len1(1),thdh,typ,ptr);
      [cf1{2},ptr]=de_2n_code_new(biny,len1(2),thdh,typ,ptr);
   else
      %L2,L3 %%%%%%%%%%%%%%%%%%%%
      for nd2=1:L2
         na=2*nd2-1; nb=na+1;
         [z2{nd2},ptr]=de_r_cr(biny,len1(nd2),ptr);
         len3(nb)=sum(z2{nd2}); len3(na)=length(z2{nd2})-len3(nb);
         for nd3=na:nb
            if L3<nd3
               [cf2{nd3},ptr]=de_2n_code_new(biny,len3(nd3),thdq,typ,ptr);
            else
               [z3{nd3},ptr]=de_r_cr(biny,len3(nd3),ptr);
               lenw3=sum(z3{nd3}); lenk3=length(z3{nd3})-lenw3;
               [cf3k{nd3},ptr]=de_2n_code_new(biny,lenk3,thdt,typ3,ptr);

               %[cf3w{nd3},ptr]=de_2n_code_new(biny,lenw3,thdt,typ,ptr);
               cf3w{nd3}=ones(1,lenw3);
               
               cf2{nd3}=separate_inv(z3{nd3},cf3w{nd3}+thdt,cf3k{nd3});
            end
         end
         cf1{nd2}=separate_inv(z2{nd2},cf2{nb}+thdq,cf2{na});
      end
      for nd2=L2+1:2
         [cf1{nd2},ptr]=de_2n_code_new(biny,len1(nd2),thdh,typ,ptr);
      end
   end
   cfk=separate_inv(z1,cf1{2}+thdh,cf1{1});

elseif thd>=16
   [L2,ptr] = deSFcode(biny,3,ptr); L2=L2-1;
   [L3,ptr] = deSFcode(biny,5,ptr); L3=L3-1;

   z2=cell(1,L2); cf1=cell(1,2);  cf2=cell(1,4);
   z3=cell(1,L3); cf3k=cell(1,L3); cf3w=cell(1,L3);

   [z1,ptr]=de_r_cr(biny,len1,ptr);
   
   len3=zeros(1,8);   len1=zeros(1,2);
   len1(2)=sum(z1); len1(1)=length(z1)-len1(2);
   if L2==0
      [cf1{1},ptr]=de_2n_code_new(biny,len1(1),thdh,typ,ptr);
      [cf1{2},ptr]=de_2n_code_new(biny,len1(2),thdh,typ,ptr);
   else
      %L2,L3 %%%%%%%%%%%%%%%%%%%%
      for nd2=1:L2
         na=2*nd2-1; nb=na+1;
         [z2{nd2},ptr]=de_r_cr(biny,len1(nd2),ptr);
         len3(nb)=sum(z2{nd2}); len3(na)=length(z2{nd2})-len3(nb);
         for nd3=na:nb
            if L3<nd3
               [cf2{nd3},ptr]=de_2n_code_new(biny,len3(nd3),thdq,typ,ptr);
            else
               [z3{nd3},ptr]=de_r_cr(biny,len3(nd3),ptr);
               lenw3=sum(z3{nd3}); lenk3=length(z3{nd3})-lenw3;
               [cf3k{nd3},ptr]=de_2n_code_new(biny,lenk3,thdt,typ,ptr);
               [cf3w{nd3},ptr]=de_2n_code_new(biny,lenw3,thdt,typ,ptr);
               cf2{nd3}=separate_inv(z3{nd3},cf3w{nd3}+thdt,cf3k{nd3});
            end
         end
         cf1{nd2}=separate_inv(z2{nd2},cf2{nb}+thdq,cf2{na});
      end
      for nd2=L2+1:2
         [cf1{nd2},ptr]=de_2n_code_new(biny,len1(nd2),thdh,typ,ptr);
      end
   end
   cfk=separate_inv(z1,cf1{2}+thdh,cf1{1});
end

%xxx=z;
%cfk=0;
