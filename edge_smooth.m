function [a,mk,a0]=edge_smooth(a,pt)
a=double(a); a=a/max(max(a))*253; [H,W]=size(a);

for ia=1:H
    for ib=1:W
        if a(ia,ib)<0,   a(ia,ib)=0;   end
    end
end
a0=a;

top=1;
while sum(a(top,:))<=0
    top=top+1;
end
top=top-1;
bot=1;
while sum(a(H-bot,:))<=0
    bot=bot+1;
end
bot=bot-1;
left=1;
while sum(a(:,left))<=0
    left=left+1;
end
left=left-1;
rgt=1;
while sum(a(:,W-rgt))<=0
    rgt=rgt+1;
end
rgt=rgt-1;
%top,bot,left,rgt

%pt=5;
R0=511/2; Ri=R0-pt;
r0=1+R0; c0=r0;
r0=r0+top-bot; c0=c0+left-rgt;

mk=ones(H,W);
for row=1:H
    for col=1:W
        R=sqrt((row-r0)*(row-r0) +(col-c0)*(col-c0));
        if R>R0+1
            mk(row,col)=0;
        elseif R>=R0-pt+1
            mk(row,col)=(cos(pi*(R-Ri)/(pt+1))+1)/2;
        end
    end
end

a=a.*mk;
