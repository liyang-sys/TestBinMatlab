
ia=11

rat=flip(xxx{ia}(1,:));  snQ=flip(xxx{ia}(2,:));   snq=flip(xxx{ia}(3,:));
   idx=1; 
   while (snQ(idx)<snQXT)   &&   (idx<length(snQ))
      idx=idx+1;
   end
   %idx
   %[snQ(idx-1) snQ(idx), rat(idx-1), rat(idx)]
   if idx>1
      111
      rateH(ia) = (rat(idx)-rat(idx-1))/(snQ(idx)-snQ(idx-1)) *(snQXT-snQ(idx-1))  +rat(idx-1);
      snrq(ia) = (snq(idx)-snq(idx-1))/(rat(idx)-rat(idx-1)) *(rateH(ia)-rat(idx-1))  +snq(idx-1);
   else
      222
      if snQ(idx)-snQXT < snQ(idx+1)-snQ(idx)
         rateH(ia) = (rat(idx+1)-rat(idx))/(snQ(idx+1)-snQ(idx)) *(snQXT-snQ(idx))  +rat(idx);
         snrq(ia) = (snq(idx+1)-snq(idx))/(rat(idx+1)-rat(idx)) *(rateH(ia)-rat(idx))  +snq(idx);
      else
         rateH(ia) = rat(idx) - (rat(idx+1)-rat(idx));
         snrq(ia) = snq(idx) - (snq(idx+1)-snq(idx));
      end
      ttt=rateH(ia), tttq=snrq(ia)
   end
idx,rateH,snrq
