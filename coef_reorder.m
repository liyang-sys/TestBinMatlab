function coef=coef_reorder(coef)
N=size(coef);

w1=N(1)/8; w2=N(2)/8;

for ia=1:4
   coef((2*ia-1)*w1+1:2*ia*w1,:)=flipud(coef((2*ia-1)*w1+1:2*ia*w1,:));
end

for ia=1:4
   coef(:,(2*ia-1)*w2+1:2*ia*w2)=fliplr(coef(:,(2*ia-1)*w2+1:2*ia*w2));
end
