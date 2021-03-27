function coef=dy79decm_3lev(a)
%dyadic decomposition using 7/9 filters

[ba, bv, bh, bd]=b44int(double(a));
[ba2, bv2, bh2, bd2]=b44int(ba);
[ba3, bv3, bh3, bd3]=b44int(ba2);
%[ba4, bv4, bh4, bd4]=b44int(ba3);
%[ba5, bv5, bh5, bd5]=b44int(ba4);
%[ba6, bv6, bh6, bd6]=b44int(ba5);

l3=[ba3 bh3; bv3 bd3];
l2=[l3 bh2; bv2 bd2];
coef=[l2 bh; bv bd];
