%load rend05
load memorial
%load Valley
%load Tree
%load MtTamWest
%load SpheronNice
%load SpheronPriceWestern
%load belgium
%load synagogue

figure; idx=1; plot(memorial{idx}(1,:), memorial{idx}(2,:),'b.-'); hold on; grid on;
for ia=2:17
   plot(memorial{ia}(1,:), memorial{ia}(2,:),'.-')
end
figure; idx=1; plot(memorial{idx}(1,:), memorial{idx}(3,:),'b.-'); hold on; grid on;
for ia=2:17
   plot(memorial{ia}(1,:), memorial{ia}(3,:),'.-')
end
