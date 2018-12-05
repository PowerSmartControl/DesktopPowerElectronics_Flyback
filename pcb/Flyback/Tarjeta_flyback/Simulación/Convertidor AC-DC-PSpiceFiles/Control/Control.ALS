.ALIASES
X_U17           U17(X1=E_SQR X2=0 Y1=/VALFA_N Y2=0 V-=-VCC_CON Z=-50MV W=N16288 V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I15645@ANLG_DEV.AD633/AD.Normal(chips)
R_R31           R31(1=VALFA 2=N15996 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I16183@ANALOG.R.Normal(chips)
R_R32           R32(1=N15996 2=N16288 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I16452@ANALOG.R.Normal(chips)
X_U16           U16(+=0 -=N15996 V+=+VCC_CON V-=-VCC_CON OUT=/VALFA_N ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I16456@BURR_BRN.OPA277/BB.Normal(chips)
X_U13           U13(X1=0 X2=VALFA Y1=VALFA Y2=0 V-=-VCC_CON Z=0 W=VALFA_SQR V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I14316@ANLG_DEV.AD633/AD.Normal(chips)
X_U15           U15(X1=0 X2=VBETA Y1=VBETA Y2=0 V-=-VCC_CON Z=0 W=VBETA_SQR V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I14318@ANLG_DEV.AD633/AD.Normal(chips)
X_U14           U14(+=0 -=N14775 V+=+VCC_CON V-=-VCC_CON OUT=E_SQR ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I14330@BURR_BRN.OPA277/BB.Normal(chips)
R_R74           R74(1=N14775 2=E_SQR ) CN @CONVERTIDOR AC-DC.Control(sch_1):I14767@ANALOG.R.Normal(chips)
R_R75           R75(1=VALFA_SQR 2=N14775 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I14837@ANALOG.R.Normal(chips)
R_R76           R76(1=VBETA_SQR 2=N14775 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I14839@ANALOG.R.Normal(chips)
R_R36           R36(1=VBETA 2=N17409 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I17381@ANALOG.R.Normal(chips)
R_R37           R37(1=N17409 2=N17437 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I17385@ANALOG.R.Normal(chips)
X_U18           U18(+=0 -=N17409 V+=+VCC_CON V-=-VCC_CON OUT=/VBETA_N ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I17389@BURR_BRN.OPA277/BB.Normal(chips)
X_U19           U19(X1=E_SQR X2=0 Y1=/VBETA_N Y2=0 V-=-VCC_CON Z=0 W=N17437 V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I17393@ANLG_DEV.AD633/AD.Normal(chips)
X_U21           U21(X1=0 X2=/VBETA_N Y1=N18560 Y2=0 V-=-VCC_CON Z=0 W=IBETA_REF V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I18373@ANLG_DEV.AD633/AD.Normal(chips)
X_U20           U20(X1=0 X2=/VALFA_N Y1=N18560 Y2=0 V-=-VCC_CON Z=0 W=IALFA_REF V+=+VCC_CON ) CN @CONVERTIDOR
+AC-DC.Control(sch_1):I18369@ANLG_DEV.AD633/AD.Normal(chips)
R_R1            R1(1=VEA 2=N18560 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I18574@ANALOG.R.Normal(chips)
R_R2            R2(1=N18560 2=0 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I18572@ANALOG.R.Normal(chips)
V_Valfa          Valfa(+=VALFA -=0 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I24553@SOURCE.VSIN.Normal(chips)
V_Vbeta          Vbeta(+=VBETA -=0 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I24607@SOURCE.VSIN.Normal(chips)
V_V5            V5(+=0 -=-VCC_CON ) CN @CONVERTIDOR AC-DC.Control(sch_1):I02764@SOURCE.VDC.Normal(chips)
V_V4            V4(+=+VCC_CON -=0 ) CN @CONVERTIDOR AC-DC.Control(sch_1):I02762@SOURCE.VDC.Normal(chips)
R_R1003          R1003(1=0 2=IBETA_REF ) CN @CONVERTIDOR AC-DC.Control(sch_1):I19099@ANALOG.R.Normal(chips)
R_R1002          R1002(1=0 2=IALFA_REF ) CN @CONVERTIDOR AC-DC.Control(sch_1):I27996@ANALOG.R.Normal(chips)
V_V7            V7(+=VEA -=0 ) CN @CONVERTIDOR AC-DC.Control(sch_1):INS33671@SOURCE.VPULSE.Normal(chips)
R_R1004          R1004(1=-50MV 2=-VCC_CON ) CN @CONVERTIDOR AC-DC.Control(sch_1):INS34440@ANALOG.R.Normal(chips)
R_R1005          R1005(1=0 2=-50MV ) CN @CONVERTIDOR AC-DC.Control(sch_1):INS34460@ANALOG.R.Normal(chips)
_    _(+Vcc_CON=+VCC_CON)
_    _(+Vcc_CON=+VCC_CON)
_    _(-50mV=-50MV)
_    _(-Vcc_CON=-VCC_CON)
_    _(-Vcc_CON=-VCC_CON)
_    _(/Valfa_N=/VALFA_N)
_    _(/Valfa_N=/VALFA_N)
_    _(/Vbeta_N=/VBETA_N)
_    _(/Vbeta_N=/VBETA_N)
_    _(GND_SIGNAL=0)
_    _(GND_SIGNAL=0)
_    _(e_sqr=E_SQR)
_    _(Ialfa_ref=IALFA_REF)
_    _(Ibeta_ref=IBETA_REF)
_    _(Valfa=VALFA)
_    _(Valfa_sqr=VALFA_SQR)
_    _(Vbeta=VBETA)
_    _(Vbeta_sqr=VBETA_SQR)
_    _(Vea=VEA)
.ENDALIASES
