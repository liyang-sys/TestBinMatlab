%diary results_fuji_color_set3.txt
%diary results_850D_color_HDR.txt
%!enHEVC -c intra_QP0c.cfg -c nikon_color_12bit.cfg
%!enHEVC -c intra_QP3c.cfg -c nikon_color_12bit.cfg
%!enHEVC -c intra_QP6c.cfg -c nikon_color_12bit.cfg
%!enHEVC -c intra_QP9c.cfg -c nikon_color_12bit.cfg
%!enHEVC -c intra_QP12c.cfg -c nikon_color_12bit.cfg

%------------------------------------------------------------------
%diary results_UHDimages.txt
%diary results_sharpY_QP39F.txt
%diary results_fujiY_QP39F.txt
%diary results_nikon850D_Y_QP39F.txt
%diary results_xray_images.txt
%diary results_sharp_q.txt
%diary results_fujiY_set3.txt
diary results_850DY_HDR.txt
!enHEVC -c intra_QP0.cfg -c nikonY_12bit.cfg
!enHEVC -c intra_QP3.cfg -c nikonY_12bit.cfg
!enHEVC -c intra_QP6.cfg -c nikonY_12bit.cfg
!enHEVC -c intra_QP9.cfg -c nikonY_12bit.cfg
!enHEVC -c intra_QP12.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP15.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP18.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP21.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP24.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP27.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP29.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP30.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP36.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP39.cfg -c nikonY_12bit.cfg
%!enHEVC -c intra_QP42.cfg -c nikonY_12bit.cfg


%diary results_med_xray.txt
%!enHEVC -c intra_QP0.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP3.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP6.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP9.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP12.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP24.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP30.cfg -c med_xrays_512x512_12bit.cfg
%!enHEVC -c intra_QP36.cfg -c med_xrays_512x512_12bit.cfg

%!enHEVC -c intra_QP0.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP3.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP6.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP9.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP12.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP24.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP30.cfg -c med_xrays_1536x1536_12bit.cfg
%!enHEVC -c intra_QP36.cfg -c med_xrays_1536x1536_12bit.cfg

%!enHEVC -c intra_QP24.cfg -c med_xray1_896x768_12bit.cfg
%!enHEVC -c intra_QP30.cfg -c med_xray1_896x768_12bit.cfg
%!enHEVC -c intra_QP36.cfg -c med_xray1_896x768_12bit.cfg

%renamed xray8 ----------------------------------------------------------
%!enHEVC -c intra_QP24.cfg -c med_xray6_736x640_12bit.cfg 
%!enHEVC -c intra_QP30.cfg -c med_xray6_736x640_12bit.cfg 
%!enHEVC -c intra_QP36.cfg -c med_xray6_736x640_12bit.cfg 
%renamed xray8 ----------------------------------------------------------

%!enHEVC -c intra_QP29.cfg -c color_12bit.cfg 
%!enHEVC -c intra_QP30.cfg -c color_12bit.cfg 


diary off
