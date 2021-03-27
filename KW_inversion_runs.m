function run_inv=KW_inversion_runs(runs)

lenr=length(runs);
run_inv=ones(1,sum(runs));
Nr=1;
for ia=1:lenr
   if runs(ia)>1
      Nr=Nr+runs(ia)-1;
   end
   run_inv(Nr)=run_inv(Nr)+1;
end
run_inv(Nr)=run_inv(Nr)-1;  run_inv=run_inv(1:Nr);
