function [m1,finish,Hn_next,Wn_next,iw,ih]=modify_Hilbert3D_ScanByBlock(n,Hn,Wn,Hn0,idxW,w,iw,h,ih,p2s)

k0=log2(max(max(max(double(n))))+1);

%For the current block: 'Hn' fixed, 'Wn' decreasing, i.e. 'iw' increases, but 'ih' is fixed.
Hn_next=Hn0; Wn_next=h(ih); %For the next block: 'Wn_next' fixed, 'Hn_next' decreasing, Note, Hn0 
                            %is the Hn of the PREVIOUS block, and is in the W direction in current block.

finish=0; lenw=length(w); lenh=length(h); r1=[]; c1=[]; d1=[]; c_offset=0;
%while bitshift(Wn,1)>Hn  &&  Wn_next<Hn_next  && finish==0 
%while bitshift(Wn,1)>Hn  &&  (Wn_next<Hn_next || (Wn_next==Hn_next && sum(h(ih:lenh))==2^k0) )  && finish==0 
while bitshift(Wn,1)>Hn  &&  (Wn_next<Hn_next || Wn_next==sum(h(ih:lenh)) )  && finish==0 
   %HWn=[Hn, Wn]
   idx=idxW(iw);
   if idx>k0  ||  (idx==k0 && Hn<=2^k0)
      m0=modify_Hilbert3D_BlockDeformation(n,k0,idx,Hn,p2s);
      r0=m0(1,:); c0=m0(2,:); d0=m0(3,:);
      r1=[r1 r0];    c0=c0+c_offset; c1=[c1 c0];     d1=[d1 d0];
      c_offset=c_offset+w(iw);
      Hn_next=Hn_next-w(iw);
      if iw<lenw
         iw=iw+1;  Wn=w(iw);
      else
         finish=1;
      end
   else
      dWn=sum(w(iw:lenw));
      m0=int32(zigzag3D(Hn,dWn,2^k0));
      r1=[r1 m0(1,:)];    c0=m0(2,:)+c_offset; c1=[c1 c0];    d1=[d1 m0(3,:)];
      finish=1;
   end
end

m1=[r1; c1; d1];
