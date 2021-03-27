function A=Re97Sym(L,H)

lenL=length(L); lenH=length(H); len=lenL+lenH;


if lenL>=3
   if lenL==lenH %even length A
      L=[flip(L(2:3)) L flip(L(lenL-1:lenL))];
      H=[flip(H(1:2)) H];
      lenH=length(H);   H=[H flip(H(lenH-2:lenH-1))];
      A=idwt(L,H,'bior4.4','mode','symw');
   else %odd length A
      L=[flip(L(2:3)) L flip(L(lenL-2:lenL-1))];
      H=[flip(H(1:2)) H];
      lenH=length(H);   H=[H flip(H(lenH-2:lenH))];
      A=idwt(L,H,'bior4.4','mode','symw');
      A=A(1:len);
   end
elseif len==4
   L=[L(2) L]; %this is 1 period, which has only 3 points (shorter than 'len' by 1!) 
   L=[L(3) L L(1:2)];
   H=[H(1) H]; %this is 1 period, which has only 3 points (shorter than 'len' by 1!)
   H=[H(3) H H(1:2)];
   A=idwt(L,H,'bior4.4','mode','symw');
elseif len==3 %situation len=3
   %Since the length of L is 2, L is exactly one period.
   L=[L L L];
   H=[H H]; %This is one period, then
   H=[H H H];
   A=idwt(L,H,'bior4.4','mode','symw');
   A=A(1:len);
else %situation len=2
   A=Haar_inv([L; H])';
end

