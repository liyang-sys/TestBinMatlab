figure;
plot(routxy(1,1:len),routxy(2,1:len),'k--');
%plot(routxy(2,1:len),sz(1)-routxy(1,1:len)+1,'k--'); %change orientation, making it consistant with the image  
axis off; hold on;

mapp=map(:,:,1);
%mapp=fliplr(map(:,:,1)'); %change orientation, making it consistant with the image
for ia=1:sz(1)
   for ib=1:sz(2)
      if mapp(ia,ib)==1
         plot(ia,ib,'o','MarkerEdgeColor','k','MarkerFaceColor','k')
      elseif mapp(ia,ib)==2
         plot(ia,ib,'s','MarkerEdgeColor','r','MarkerFaceColor','r')
      elseif mapp(ia,ib)==3
         plot(ia,ib,'^','MarkerEdgeColor','b','MarkerFaceColor','b')
      end
   end
end

plot(1,1,'ro')