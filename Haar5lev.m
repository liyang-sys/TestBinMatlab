function coef=Haar5lev(a)

len=size(a,1); len1=len/2; len2=len1/2; len3=len2/2; len4=len3/2;

coef=Haar(a);
coef(1:len1,:)=Haar( coef(1:len1,:) );
coef(1:len2,:)=Haar( coef(1:len2,:) );
coef(1:len3,:)=Haar( coef(1:len3,:) );
coef(1:len4,:)=Haar( coef(1:len4,:) );
