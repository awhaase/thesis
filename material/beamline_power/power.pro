;
f1 =get_files(35,'',/euv)
f2 =get_files(36,'',/euv)
;
plot_data,f1[71],d0
plot_data,f2[8],dsi
plot_data,f2[9],dbe
plot_data,f2[10],dmg
;
ird = ref_diode(6,/inter)
;
x_pho,/w
plot,d0[*,0],d0[*,1],/ylo,yr=[.001,20],xr=[0,51],ytit='signal nA/mA'
oplot,dsi[*,0],dsi[*,1],co=2
oplot,dbe[*,0],dbe[*,1],co=6
oplot,dmg[*,0],dmg[*,1],co=11
;
d_fit,['Si_amorph'],[.5],ev_nm(dsi[*,0]),0,tsi,/no
d_fit,['Si_amorph'],[.5],ev_nm(d0[*,0]),0,tsi0,/no
d_fit,['Be','O_mod'],[.5,.0],ev_nm(dbe[*,0]),0,tbe,/no
d_fit,['C'],[.5],ev_nm(d0[*,0]),0,tc,/no
d_fit,['C'],[.5],ev_nm(dsi[*,0]),0,tcsi,/no
;
x_pho,/w
plot,d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0])),/ylo,yr=[1e-3,20],xr=[4,30],ytit='radiant power !4l!3W/100 mA'
; plot,d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0])),yr=[.0,12.5],xr=[0,51],ytit='radiant power !4l!3W/100 mA'
oplot,2*d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0])),li=2
oplot,2*d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0]))*tc,li=2,co=3
oplot,2*d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0]))*tc*tsi0,li=2,co=5
oplot,3*d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0]))*tc*tsi0,li=2,co=4
oplot,d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0]))*tc,li=2,co=4
oplot,dsi[*,0],.1*dsi[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dsi[*,0])),co=2
oplot,dsi[*,0],.1*dsi[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dsi[*,0]))*tcsi,co=2,li=2
; oplot,dsi[*,0],.1*dsi[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dsi[*,0]))/tsi,co=2,li=2
oplot,dbe[*,0],.1*dbe[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dbe[*,0])),co=6
; oplot,dbe[*,0],.1*dbe[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dbe[*,0]))/tbe,co=6,li=2
oplot,dmg[*,0],.1*dmg[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dmg[*,0])),co=11
oplot,[0,50],[1,1]*.1,li=2,thi=1  ; 100 nW als limit fuer CRAB
; oplot,dmg[*,0],interpol(ird[*,1],ird[*,0],ev_nm(dmg[*,0])),co=3
oplot,x[*,0],1e-4*x[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(x[*,0]))
;
plot,dbe[*,0],tbe
;
x_pho,/w
plot,d0[*,0],d0[*,1],/ylo,yr=[1e-3,20],xr=[4,30],ytit='nA/mA'
; plot,d0[*,0],.1*d0[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(d0[*,0])),yr=[.0,12.5],xr=[0,51],ytit='radiant power !4l!3W/100 mA'
oplot,2*d0[*,0],d0[*,1],li=2
oplot,2*d0[*,0],d0[*,1]*tc,li=2,co=3
oplot,2*d0[*,0],d0[*,1]*tc*tsi0,li=2,co=5
oplot,3*d0[*,0],d0[*,1]*tc*tsi0,li=2,co=4
oplot,d0[*,0],d0[*,1]*tc,li=2,co=4
oplot,dsi[*,0],dsi[*,1],co=2
oplot,dsi[*,0],dsi[*,1]*tcsi,co=2,li=2
; oplot,dsi[*,0],.1*dsi[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dsi[*,0]))/tsi,co=2,li=2
oplot,dbe[*,0],dbe[*,1],co=6
; oplot,dbe[*,0],.1*dbe[*,1]/interpol(ird[*,1],ird[*,0],ev_nm(dbe[*,0]))/tbe,co=6,li=2
oplot,dmg[*,0],dmg[*,1],co=11
oplot,[0,50],[1,1]*.1,li=2,thi=1  ; 100 nW als limit fuer CRAB
; oplot,dmg[*,0],interpol(ird[*,1],ird[*,0],ev_nm(dmg[*,0])),co=3
oplot,x[*,0],1e-3*x[*,1]
;
; Kontrolle Kr-Linie
;
plot_data,f2[34],x
plot,x[*,0],x[*,1],xr=[13.2,13.9],yr=[0,2e-10]
for i=35,43 do begin read_hdf_b2,f2[i],x & oplot,x[*,0],x[*,3]/x[*,7],co=co[(i-34) mod 8] & endfor
