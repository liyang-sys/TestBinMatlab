function [sep,rk,rw,sig,rw0,rws]=separate_sig(r,thd,Ns)

len=length(r);

sep=zeros(1,len);
rk=[]; ptr=1; rw=r; sig=zeros(1,len+2*Ns);
for ia=1:len
   if r(ia)>=thd
      sep(ia)=1;
      rk=[rk r(ia)];
      rw=[rw(1:ptr-1) rw(ptr+1:length(rw))];
      %sig(ptr-Ns:ptr+Ns-1)=ones(1,2*Ns);
      sig(ptr:ptr+Ns+Ns-1)=ones(1,2*Ns);
   else
      ptr=ptr+1;
   end
end
lenw=length(rw);
sig=sig(Ns+1:Ns+lenw);

rw0=zeros(1,lenw); rws=zeros(1,lenw);
ptr0=1; ptrs=1;
for ia=1:length(rw)
   if sig(ia)>0.5
      rws(ptrs)=rw(ia); ptrs=ptrs+1;
   else
      rw0(ptr0)=rw(ia); ptr0=ptr0+1;
   end
end
rw0=rw0(1:ptr0-1); rws=rws(1:ptrs-1);
