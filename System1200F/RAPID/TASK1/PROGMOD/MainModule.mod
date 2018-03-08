MODULE MainModule

    CONST robtarget myRobtarget:=[[636.18,-213.92,254.25],[0.707846,0.0583024,0.700729,-0.067336],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata myTool:=[TRUE,[[101.17,2.55022,53.362],[1,0,0,0]],[0.001,[0,0,0.001],[1,0,0,0],0,0,0]];
    PERS Num quat{4}:=[0.67062,-0.04721,0.73906,-0.042838];
    PERS num pathBuf{65535,7};
    PERS num sPathBuf;
    PERS num ePathBuf;
    PERS bool ismove;
    VAR intnum intno1;
    !VAR clock myclock;
    var num poslx:=0;
    VAR num posly:=0;
    VAR num poslz:=0;
    var num posx;
    VAR num posy;
    VAR num posz;
    VAR POS pos1;
    VAR num Vx:= 0;
    VAR num differencelast:=0;
    VAR num posdifference:=0;
    VAR num accspeed:=0;
    VAR pos pc;
    VAR num tostart;
    VAR num myspeed;
    VAR num speed1:=0;
    VAR num speed2:=0;
    VAR num speed3:=0;
    VAR num speed4:=0;
    VAR num speed5:=0;
    VAR num speedave:=0;
    VAR num t:=0;
    CONST robtarget myRobtarget10:=[[820.06,-189.14,254.14],[0.70777,0.0583044,0.700805,-0.0673295],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget20:=[[820.26,242.87,254.14],[0.70777,0.0583051,0.700806,-0.0673297],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget30:=[[498.09,242.87,254.14],[0.707771,0.0583081,0.700805,-0.0673291],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget40:=[[636.17,-213.90,254.22],[0.70782,0.0583067,0.700755,-0.0673285],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget50:=[[801.77,-31.94,238.94],[0.188864,0.689943,0.679495,0.16308],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget60:=[[630.23,-162.32,-177.07],[0.707444,0.058011,0.701163,-0.0672886],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget70:=[[631.55,-192.76,-170.49],[0.707584,0.0579765,0.701028,-0.0672532],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget80:=[[801.78,-31.93,81.36],[0.188854,0.689989,0.679449,0.16309],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget90:=[[712.48,121.42,-123.56],[0.707125,0.0580609,0.701487,-0.0672242],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget100:=[[637,100.16,-181.88],[0.708127,0.0579623,0.700476,-0.0673018],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget back1:=[[804.80,-116.36,-40.90],[0.192154,0.689217,0.678728,0.165487],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget back11:=[[804.77,-116.35,244.37],[0.192105,0.689214,0.678751,0.165458],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget back21:=[[711.74,-207.17,4.55],[0.707093,0.0580607,0.701517,-0.0672414],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget110:=[[801.94,-31.97,-31.90],[0.18843,0.690179,0.679432,0.162847],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtargetA:=[[753.16,-177.40,130.67],[0.797371,-0.0794114,0.592771,0.0807176],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtargetB:=[[753.13,377.95,130.58],[0.797343,-0.0794132,0.592813,0.0806881],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    VAR iodev logfile;
    VAR num a:=100;
    VAR num d:=100;
    VAR num Stime:=0.15;
    VAR num Vmax:=10;
    VAR num alast;
    VAR num aave:=100;
    VAR num Vaverage;
    VAR num abvlast;
    VAR num Vaveragelast;
    VAR num Acceleration;
    VAR bool isStable:=TRUE;
    VAR bool isDecing:=FALSE;
    CONST robtarget try0:=[[691.11,-171.92,-136.05],[0.707074,0.0580645,0.70154,-0.0672033],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget try10:=[[691.06,-171.90,-57.83],[0.707034,0.0580786,0.701579,-0.0672035],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget try20:=[[695.67,176.27,-57.86],[0.707012,0.0580664,0.701602,-0.067205],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget try30:=[[695.64,176.26,-130.47],[0.70698,0.0580768,0.701631,-0.0672261],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget try40:=[[524.35,178.09,-130.49],[0.706954,0.058063,0.701658,-0.0672279],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget try2back0:=[[540.41,186.60,-45.11],[0.707028,0.0580521,0.70158,-0.0672815],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget break11:=[[691.11,-171.92,-136.04],[0.70708,0.0580684,0.701533,-0.0672098],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget break21:=[[689.31,-99.52,-136.17],[0.706976,0.0580603,0.70164,-0.0671932],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget break31:=[[427.13,-99.81,-136.20],[0.706937,0.0580354,0.70168,-0.0672116],[-1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks1:=[[689.49,-108.84,-88.30],[0.706932,0.0580617,0.701686,-0.0671801],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks11:=[[689.49,174.33,-88.30],[0.706932,0.0580624,0.701686,-0.0671777],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks21:=[[689.68,158.04,-139.16],[0.706933,0.058064,0.701685,-0.0671787],[0,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks31:=[[773.07,-32.87,-127.61],[0.51646,0.517593,0.46859,0.495772],[-1,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks41:=[[430.04,159.81,-139.16],[0.706931,0.0580604,0.701686,-0.0671787],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks51:=[[430.04,159.81,-55.59],[0.70693,0.0580546,0.701688,-0.0671823],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget breaks61:=[[689.46,-108.83,-88.34],[0.706902,0.0580728,0.701715,-0.0671828],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS bool isup;
    PERS bool isdown;
    TASK PERS tooldata tool1test:=[TRUE,[[0,0,0],[1,0,0,0]],[-1,[0,0,0],[1,0,0,0],0,0,0]];
    TASK PERS tooldata tool1test12:=[TRUE,[[0,0,0],[1,0,0,0]],[2,[0,0,0],[1,0,0,0],0,0,0]];
   
    TASK PERS wobjdata wobjzbw:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[0,0,0],[1,0,0,0]]];
    VAR num numb;
    CONST jointtarget anzhuang:=[[-17.722,74.0608,-1.51114,-7.88819,-73.2144,1.65795],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget jixieyuandian1:=[[585.29,4.66,789.60],[0.710104,-0.00223526,0.704093,0.000593671],[0,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget qidian1:=[[716.71,89.46,84.19],[0.0450715,0.751092,0.656396,0.0545404],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget qidian11:=[[716.71,89.46,84.19],[0.0450715,0.751092,0.656396,0.0545404],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget120:=[[716.71,89.46,84.19],[0.0450715,0.751092,0.656396,0.0545404],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget130:=[[716.62,89.46,-44.22],[0.0450106,0.751092,0.656406,0.0544615],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget140:=[[716.57,89.46,-137.12],[0.0449726,0.75109,0.656415,0.0544173],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget back31:=[[716.52,-44.86,-137.18],[0.0449408,0.751084,0.656426,0.0543861],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget back12:=[[804.34,-203.41,3.68],[0.0215595,0.7058,0.707568,0.0270042],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget150:=[[677.98,-228.07,359.79],[0.0567746,0.833369,0.547963,0.0448233],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget160:=[[827.69,-205.35,345.44],[0.178209,0.787006,0.577293,0.124883],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget170:=[[816.77,-63.41,-66.01],[0.0158802,0.755405,0.654562,0.0256664],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget180:=[[802.05,-31.98,54.32],[0.188587,0.690136,0.679413,0.162926],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget190:=[[831.04,-35.46,-27.33],[0.0154639,0.702486,0.711319,0.0173065],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget myRobtarget200:=[[887.00,-63.19,665.21],[0.42684,0.622565,0.560823,0.340143],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS loaddata tc_Load:=[3.47814,[-5.06068,0.638566,79.7254],[1,0,0,0],0,0,0];
    CONST robtarget jixieyuandian11:=[[585.27,4.64,789.54],[0.710024,-0.00220281,0.704174,0.000597747],[0,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    
    PROC load_material()
        Reset DO1_A1_clamp;
        Reset DO2_A2_loosen;
        Reset DO3_B1_go;
        Reset DO4_B2_back;
        
        
        Set DO2_A2_loosen;!??
         WaitTime 0.1;
        Set DO3_B1_go;!??
        WaitTime 0.5;
        Reset DO2_A2_loosen;!????
         WaitTime 0.1;
        Set DO1_A1_clamp;!??
         WaitTime 0.1;
        Reset DO3_B1_go;!????
         WaitTime 0.1;
        Set DO4_B2_back;!??
         WaitTime 0.5;
    
	ENDPROC
    
    PROC release_material()
        Reset DO1_A1_clamp;
        Reset DO2_A2_loosen;
        Reset DO3_B1_go;
        Reset DO4_B2_back;
        
        
        
        Set DO2_A2_loosen;
        Set DO4_B2_back;
        
	ENDPROC
    
    PROC main()
    
        TuneReset;

        SpeedRefresh 100;

        VelSet 100,100;
        AccSet 100, 100;
! FCCalib tc_Load; 
        MoveL myRobtarget50, v50, z50, myTool;
    
        
        WaitRob\InPos;
!        load_material ;
        tuneserve;
        TPWrite "difference00000";
        pc:=myRobtarget50.trans;
        IDelete intno1;
        
        TPReadFK reg1, "Speed control?", stEmpty, stEmpty, stEmpty, "Yes","No"
        \MaxTime:= 600;

        IF reg1 = 4 THEN
            SpeedCtrl;
        ELSEIF reg1 = 5 THEN 
           NoSpeedCtrl;
        ENDIF

        
! FCSpdChgAct 100;

       
        MoveL myRobtarget80,v10,z0,myTool;
        MoveL myRobtarget180,v10,z0,myTool;
         MoveL myRobtarget110,v10,z0,myTool;


! FCSpdChgDeact;

        WaitTime 1;
        IDelete intno1;
        back;

        
    ENDPROC
    
    
    PROC SpeedCtrl()
       
        CONNECT intno1 WITH CtrltMonitor;!chuang jian zhongduan lianjie 
        ITimer Stime,intno1;
       
        
     
 
       
    ENDPROC
    
    PROC NoSpeedCtrl()

        CONNECT intno1 WITH NoCtrltMonitor;!chuang jian zhongduan lianjie 
        ITimer Stime,intno1;
       
       

    ENDPROC
    
   PROC tuneserve()
          
        TuneServo ROB_1,1,20\Type:=TUNE_KP;
        TuneServo ROB_1,1,50\Type:=TUNE_KV;
        TuneServo ROB_1,1,100\Type:=TUNE_TI;
        TuneServo ROB_1,1,100\Type:=TUNE_DF;
        TuneServo ROB_1,1,100\Type:=TUNE_DH;
         
        
        TuneServo ROB_1,2,5\Type:=TUNE_KP;
        TuneServo ROB_1,2,20\Type:=TUNE_KV;
        TuneServo ROB_1,2,30\Type:=TUNE_TI;
        TuneServo ROB_1,2,100\Type:=TUNE_DF;
        TuneServo ROB_1,2,100\Type:=TUNE_DH;
         
         
        TuneServo ROB_1,3,5\Type:=TUNE_KP;
        TuneServo ROB_1,3,20\Type:=TUNE_KV;
        TuneServo ROB_1,3,30\Type:=TUNE_TI;
        TuneServo ROB_1,3,100\Type:=TUNE_DF;
        TuneServo ROB_1,3,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,4,10\Type:=TUNE_KP;
        TuneServo ROB_1,4,20\Type:=TUNE_KV;
        TuneServo ROB_1,4,50\Type:=TUNE_TI;
        TuneServo ROB_1,4,100\Type:=TUNE_DF;
        TuneServo ROB_1,4,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,5,30\Type:=TUNE_KP;
        TuneServo ROB_1,5,50\Type:=TUNE_KV;
        TuneServo ROB_1,5,100\Type:=TUNE_TI;
        TuneServo ROB_1,5,100\Type:=TUNE_DF;
        TuneServo ROB_1,5,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,6,30\Type:=TUNE_KP;
        TuneServo ROB_1,6,50\Type:=TUNE_KV;
        TuneServo ROB_1,6,100\Type:=TUNE_TI;
        TuneServo ROB_1,6,100\Type:=TUNE_DF;
        TuneServo ROB_1,6,100\Type:=TUNE_DH;
    ENDPROC

    TRAP CtrltMonitor
        VAR num difference;
        VAR num vdifference;
        VAR num absvdif;
        VAR num C;
        VAR bool dier:=false;
        VAR bool diyi:=true;
        Vx:= CSpeedOverride();
        pos1:=CPos(\Tool:=myTool);
        posx:=pos1.x;
        posy:=pos1.y;
        posz:=pos1.z;
        
        tostart:=Sqrt((pc.x-posx)*(pc.x-posx)+(pc.y-posy)*(pc.y-posy)+(pc.z-posz)*(pc.z-posz));
        difference:=Sqrt((posx-poslx)*(posx-poslx)+(posy-posly)*(posy-posly)+(posz-poslz)*(posz-poslz));
              
        Vaverage:=difference/Stime;
    
        Acceleration:=(Vaverage-Vaveragelast)/Stime;
        vdifference:=(Vmax*0.01*a*Stime-difference); 
       
!        IF tostart>40 THEN 
           
!           IF Vaverage < 9.3 AND Acceleration<-4  THEN   
             
!                 a:=33;
!            ENDIF
         
!        IF a=33 THEN
!            numb:=numb+1;
!          TPWrite "numb"\Num:=numb;
!        ENDIF      
!         IF  numb>16 THEN
!               a:=100;
!              numb:=0;
!        TPWrite "numb2"\Num:=numb;
!         ENDIF
!      ENDIF 
!  IF diyi=true AND dier=false then          
            
        IF vdifference < 0.135 AND vdifference > -0.135 AND isStable= FALSE  THEN
            isStable:=TRUE;
        ENDIF

        IF tostart > 40 THEN
            !c???0.102  ?0.06
            C := (vdifference/(0.105*Vmax*Stime));
            IF isStable THEN
                IF c> 0.195 AND isDecing = TRUE  THEN 
                    a:=100;                  
                    isDecing := FALSE;
                    isStable := FALSE;
!                    dier:=TRUE;

                ELSEIF c > 0 THEN

                    IF c > 0.810 AND isDecing = FALSE  THEN
                            !a???0.5  ?0.3
    !                        a:=20;
                            a := 0.02*a/c;                       
                            isStable := FALSE;
                            isDecing := TRUE;
                    ENDIF
                    !                IF c<0.5 THEN
                    !                    a:=0.5*a/c;
                    !                ENDIF
                ENDIF
!                diyi:=FALSE;
            ENDIF
  endif

  
  
!  IF dier=true and diyi=FALSE then          
            
!        IF vdifference < 0.15 AND vdifference > -0.15 AND isStable= FALSE  THEN
!            isStable:=TRUE;
!        ENDIF

!        IF tostart > 40 THEN
!            !c???0.102  ?0.06
!            C := (vdifference/(0.11*Vmax*Stime));
!            IF isStable THEN
!                IF c> 0.244 AND isDecing = TRUE  THEN
                 
!                    a:=100;
                   
!                    isDecing := FALSE;
!                    isStable := FALSE;
!                    diyi:=TRUE; 
           
                
!                ELSEIF c > 0 THEN

!                    IF c > 0.8151123 AND isDecing = FALSE  THEN
!                            !a???0.5  ?0.3
!    !                        a:=20;
!                            a := 0.02*a/c;                       
!                            isStable := FALSE;
!                            isDecing := TRUE;
!                    ENDIF
!                    !                IF c<0.5 THEN
!                    !                    a:=0.5*a/c;
!                    !                ENDIF
!                ENDIF
!                dier:=FALSE;
!            ENDIF
!        ENDIF
!  endif
    
        
        IF a>100 THEN
            a:=100;
        ENDIF
        IF a<10 THEN
            a:=10;
        ENDIF
        !        a := 100;
        d:=a;
        !speedrefresh a ?????100,?????
        IF d>100 THEN
            d:=100;
        ENDIF
        speedrefresh d;
                     
      
!      IF a < 20 THEN
!          a := 20;
!      ENDIF
      
!      IF a > 100 THEN 
!          a := 100;
!      ENDIF
      
!        speedrefresh a;
        Open "HOME:"\File:="LSpeed25.txt",logfile\Append;
          Write logfile,"",\Num:=posx\NoNewLine;
          Write logfile,";",\Num:=posy\NoNewLine;
          Write logfile,";",\Num:=posz\NoNewLine;
          Write logfile,";",\Num:=Vaverage\NoNewLine;
          Write logfile,";",\Num:=a\NoNewLine;
          Write logfile,";",\Num:=Acceleration\NoNewLine;
          Write logfile,";",\Num:=vdifference\NoNewLine;
          Write logfile,";",\Num:=C;
        TPWrite "a"\Num:=a;

        differencelast:=difference;
        poslx:=posx;
        posly:=posy;
        poslz:=posz;
         alast:=a;
        Vaveragelast:=Vaverage;
       
        close logfile;
    ENDTRAP    
    
    TRAP  NoCtrltMonitor
      
        VAR num difference;
        VAR num vdifference;
        VAR num C;
         VAR num absvdif;
        Vx:= CSpeedOverride();
        pos1:=CPos(\Tool:=myTool);
        posx:=pos1.x;
        posy:=pos1.y;
        posz:=pos1.z;
        
        tostart:=Sqrt((pc.x-posx)*(pc.x-posx)+(pc.y-posy)*(pc.y-posy)+(pc.z-posz)*(pc.z-posz));
        
        difference:=Sqrt((posx-poslx)*(posx-poslx)+(posy-posly)*(posy-posly)+(posz-poslz)*(posz-poslz));
              
        Vaverage:=difference/Stime;
    
        Acceleration:=(Vaverage-Vaveragelast)/Stime;
        
        vdifference:=(Vmax*0.01*a*Stime-difference); 
     

       C:=(vdifference/(0.1*Vmax*Stime));
       
        Open "HOME:"\File:="LSpeedNot3.txt",logfile\Append;
          Write logfile,"",\Num:=posx\NoNewLine;
          Write logfile,";",\Num:=posy\NoNewLine;
          Write logfile,";",\Num:=posz\NoNewLine;
          Write logfile,";",\Num:=Vaverage\NoNewLine;
          Write logfile,";",\Num:=a\NoNewLine;
          Write logfile,";",\Num:=Acceleration\NoNewLine;
          Write logfile,";",\Num:=vdifference\NoNewLine;
          Write logfile,";",\Num:=C;

        differencelast:=difference;
        Vaveragelast:=Vaverage;
        poslx:=posx;
        posly:=posy;
        poslz:=posz;

        close logfile;

    ENDTRAP
 
    PROC back()
        speedrefresh 100;
        !MoveL breaks31, v10, z0, myTool;
        MoveL back1, v50, z50, myTool;
        MoveL back11, v50, z50, myTool;
        !MoveL myRobtarget180, v100, z50, myTool;
    ENDPROC
     
	PROC jixieyuandian()
		MoveJ jixieyuandian1, v1000, z50, myTool;
	ENDPROC
    
	PROC move20()
		tuneserve;
		MoveL myRobtarget50, v100, z0, myTool;
		MoveL myRobtarget80, v10, z0, myTool;
		MoveL myRobtarget180, v10, z0, myTool;
		MoveL myRobtarget110, v10, z0, myTool;
		!MoveL breaks31, v10, z0, myTool;
		MoveL back1, v60, z0, myTool;
		MoveL back11, v60, z0, myTool;
		!MoveL myRobtarget180, v100, z0, myTool;
	ENDPROC
    
    
     PROC Load_ID()
        !tc_Load:=FCLoadID();
		tc_Load:=FCLoadID( \MaxMoveAx5 := 60,  \MaxMoveAx6 := 60);
 ENDPROC
    PROC FC_tuneserve()
          
        TuneServo ROB_1,1,20\Type:=TUNE_KP;
        TuneServo ROB_1,1,50\Type:=TUNE_KV;
        TuneServo ROB_1,1,100\Type:=TUNE_TI;
        TuneServo ROB_1,1,100\Type:=TUNE_DF;
        TuneServo ROB_1,1,100\Type:=TUNE_DH;
         
        
        TuneServo ROB_1,2,5\Type:=TUNE_KP;
        TuneServo ROB_1,2,20\Type:=TUNE_KV;
        TuneServo ROB_1,2,30\Type:=TUNE_TI;
        TuneServo ROB_1,2,100\Type:=TUNE_DF;
        TuneServo ROB_1,2,100\Type:=TUNE_DH;
         
         
        TuneServo ROB_1,3,5\Type:=TUNE_KP;
        TuneServo ROB_1,3,20\Type:=TUNE_KV;
        TuneServo ROB_1,3,30\Type:=TUNE_TI;
        TuneServo ROB_1,3,100\Type:=TUNE_DF;
        TuneServo ROB_1,3,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,4,10\Type:=TUNE_KP;
        TuneServo ROB_1,4,20\Type:=TUNE_KV;
        TuneServo ROB_1,4,50\Type:=TUNE_TI;
        TuneServo ROB_1,4,100\Type:=TUNE_DF;
        TuneServo ROB_1,4,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,5,30\Type:=TUNE_KP;
        TuneServo ROB_1,5,50\Type:=TUNE_KV;
        TuneServo ROB_1,5,100\Type:=TUNE_TI;
        TuneServo ROB_1,5,100\Type:=TUNE_DF;
        TuneServo ROB_1,5,100\Type:=TUNE_DH;
        
        
        TuneServo ROB_1,6,30\Type:=TUNE_KP;
        TuneServo ROB_1,6,50\Type:=TUNE_KV;
        TuneServo ROB_1,6,100\Type:=TUNE_TI;
        TuneServo ROB_1,6,100\Type:=TUNE_DF;
        TuneServo ROB_1,6,100\Type:=TUNE_DH;
    ENDPROC


    PROC Fc_Test()
       FC_tuneserve;
!       VAR num Force:=50;
       !MoveL myRobtarget200, v100, z50, myTool; 
       FCCalib tc_Load;   
       MoveL  myRobtarget50, v100, fine, myTool;
       load_material;
       FCSpdChgAct 55;
!       FCSpdChgAct 2 \RecoverFunName:="Po_Test";     
       MoveL myRobtarget80,v20,fine,myTool;
        MoveL myRobtarget180, v20, fine, myTool;
         MoveL myRobtarget110, v20, fine, myTool;
       FCSpdChgDeact;
       back;

ENDPROC

ENDMODULE