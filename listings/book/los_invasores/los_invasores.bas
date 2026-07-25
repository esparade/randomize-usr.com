<<<<<<< HEAD
Check F4CB9248
Auto 8224

# Run-time Variables

Var perder: Num = 0
Var ganar: Num = 0
Var puntos: Num = 0
Var colalien: Num = 0
Var colest: Num = 0
Var xp: Num = 16
Var altura: Num = 1
Var invasores: Num = 10
Var alienigenas: Num = 10
Var x: NumArray(10) = 3, 6, 9, 12, 15, 18, 21, 24, 27, 30
Var y: NumArray(10) = 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
Var a: NumFOR = 11, 10, 1, 8150, 2
Var r$: Str = ""
Var r$: Str = ""

# End Run-time Variables

   5 REM invasores
  10 GO SUB 8000: REM Inicializar
  20 GO SUB 7000: REM Pantalla
  30 GO SUB 1000: REM Alienigena
  40 GO SUB 2000: REM Jugador
  50 IF (ganar OR perder)=1 THEN GO TO 70
  60 GO TO 30
  70 IF ganar=1 THEN GO SUB 5000: GO TO 20
  80 GO SUB 6000: REM Perder
  90 CLS : PAPER 7: BORDER 7: INK 0: STOP
1000 REM Alienigena
1010 LET r=INT (RND*invasores)+1: IF y(r)=22 THEN RETURN
1020 PAPER 0: PRINT AT y(r),x(r);" "
1030 LET x(r)=x(r)+INT (RND*3)-1
1040 LET y(r)=y(r)+1
1050 IF x(r)>30 THEN LET x(r)=30
1060 IF x(r)<1 THEN LET x(r)=1
1070 IF y(r)=21 THEN LET perder=1
1080 INK 6: PRINT AT y(r),x(r);"\a"
1090 RETURN
2000 REM Jugador
2010 LET l$=INKEY$
2020 IF l$="m" OR l$="M" THEN GO SUB 3000: REM Laser
2030 IF (l$="z" OR l$="Z") AND xp>0 THEN LET xp=xp-1
2040 IF (l$="x" OR l$="X") AND xp<29 THEN LET xp=xp+1
2050 INK 2: PRINT AT 21,xp;" ? "
2060 RETURN
3000 REM Laser
3010 LET ym=21: LET xm=xp+1
3020 LET ym=ym-1
3030 IF POINT (xm*8,(21-ym)*8+2)=1 THEN LET colest=1
3040 IF POINT (xm*8,(21-ym)*8+3)=1 THEN LET colalien=1
3050 INK 7: PRINT AT ym,xm;"!"
3060 PAPER 0: PRINT AT ym,xm;" "
3070 IF colest=1 THEN PLOT xm*8,(21-ym)*8+2: LET colest=0
3080 IF colalien=1 THEN GO SUB 4000
3090 IF ym=1 THEN RETURN
3100 GO TO 3020
4000 REM Impacto
4005 BEEP .05,-10
4010 FOR a=1 TO invasores
4020 IF x(a)<>xm OR y(a)<>ym THEN GO TO 4040
4030 LET y(a)=22: LET a=invasores
4040 NEXT a
4050 LET alienigenas=alienigenas-1: LET puntos=puntos+1: LET colalien=0: LET ym=1
4060 IF alienigenas=0 THEN LET ganar=1
4070 INK 7: PRINT AT 0,26;puntos
4080 RETURN
5000 REM Ganar
5010 INK 5: PRINT AT 6,5;"BIEN HECHO TERRICOLA"
5020 PRINT AT 8,4;"ESTA VEZ HAS GANADO TU"
5030 BEEP .5,2: BEEP .5,10: BEEP 1,20
5040 PRINT AT 12,8;"PREPARATE PARA"
5050 PRINT AT 14,4;"NUESTRA PROXIMO ATAQUE"
5060 FOR d=1 TO 400: NEXT d
5070 LET alienigenas=invasores: LET altura=altura+2: LET ganar=0
5080 FOR a=1 TO invasores
5090 LET x(a)=a*3: LET y(a)=altura
5100 NEXT a
5110 RETURN
6000 REM Perder
6010 CLS
6020 INK 5: FLASH 1: PRINT AT 1,13;"L O S"
6030 PRINT AT 3,7;"I N V A S O R E S"
6040 PRINT AT 5,13;"H A N"
6050 PRINT AT 7,6;"A T E R R I Z A D O": FLASH 0
6060 BEEP 2,-10
6070 INK 6: PRINT AT 10,10;"SIN EMBARGO"
6080 PRINT AT 12,9;"HAS DESTRUIDO"
6090 INK 2: FLASH 1: PRINT AT 14,15;puntos: FLASH 0
6100 INK 6: PRINT AT 16,7;"NAVES ALIENIGENAS"
6110 PRINT AT 20,1;"QUIERES ENFRENTARTE DE NUEVO?"
6120 INPUT a$
6130 IF a$(1)="s" OR a$(1)="S" THEN RUN
6140 RETURN
7000 REM Pantalla
7010 CLS
7020 FOR s=1 TO 40
7030 PLOT 8*INT (RND*32),8*INT (RND*21)+10
7040 NEXT s
7050 INK 7: PRINT AT 0,5;"INVASORES DESTRUIDOS=";puntos
7055 FOR b=1 TO 20: BEEP .1,20: NEXT b
7060 RETURN
8000 REM Inicializar
8010 PAPER 0: INK 7: BORDER 0: CLS
8020 PRINT AT 1,4;"Eres un piloto solitario"
8030 PRINT AT 2,1;"protegiendo el planeta Tierra."
8040 PRINT AT 3,1;"En unos instantes estaras bajo"
8050 PRINT AT 4,3;"el ataque de invasores del"
8060 PRINT AT 5,9;"planeta VARGON."
8070 PRINT AT 6,4;"Tu mision es evitar que"
8080 PRINT AT 7,0;"aterricen las naves vargonianas."
8090 PRINT AT 10,2;"'Z' MUEVE LA NAVE A LA IZDA"
8100 PRINT AT 12,2;"'X' MUEVE LA NAVE A LA DCHA"
8110 PRINT AT 14,4;"PULSA 'M' PARA DISPARAR"
8120 PRINT AT 20,2;"Pulsa cualquier tecla para"
8125 PRINT AT 21,0;"entablar combate con el enemigo"
8130 LET perder=0: LET ganar=0: LET puntos=0: LET colalien=0: LET colest=0: LET xp=16: LET altura=1: LET invasores=10: LET alienigenas=invasores
8140 DIM x(invasores): DIM y(invasores)
8150 FOR a=1 TO invasores
8160 LET x(a)=a*3: LET y(a)=altura
8170 NEXT a
8180 POKE 65368,BIN 00100100
8190 POKE 65369,BIN 00100100
8200 POKE 65370,BIN 01111110
8210 POKE 65371,BIN 11111111
8220 POKE 65372,BIN 10011001
8230 POKE 65373,BIN 11111111
8240 POKE 65374,BIN 01011010
8250 POKE 65275,BIN 01000010
8260 LET R$=INKEY$: IF R$="" THEN GO TO 8260
8270 RETURN
=======
Check F4CB9248
Auto 8224

# Run-time Variables

Var perder: Num = 0
Var ganar: Num = 0
Var puntos: Num = 0
Var colalien: Num = 0
Var colest: Num = 0
Var xp: Num = 16
Var altura: Num = 1
Var invasores: Num = 10
Var alienigenas: Num = 10
Var x: NumArray(10) = 3, 6, 9, 12, 15, 18, 21, 24, 27, 30
Var y: NumArray(10) = 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
Var a: NumFOR = 11, 10, 1, 8150, 2
Var r$: Str = ""
Var r$: Str = ""

# End Run-time Variables

   5 REM invasores
  10 GO SUB 8000: REM Inicializar
  20 GO SUB 7000: REM Pantalla
  30 GO SUB 1000: REM Alienigena
  40 GO SUB 2000: REM Jugador
  50 IF (ganar OR perder)=1 THEN GO TO 70
  60 GO TO 30
  70 IF ganar=1 THEN GO SUB 5000: GO TO 20
  80 GO SUB 6000: REM Perder
  90 CLS : PAPER 7: BORDER 7: INK 0: STOP
1000 REM Alienigena
1010 LET r=INT (RND*invasores)+1: IF y(r)=22 THEN RETURN
1020 PAPER 0: PRINT AT y(r),x(r);" "
1030 LET x(r)=x(r)+INT (RND*3)-1
1040 LET y(r)=y(r)+1
1050 IF x(r)>30 THEN LET x(r)=30
1060 IF x(r)<1 THEN LET x(r)=1
1070 IF y(r)=21 THEN LET perder=1
1080 INK 6: PRINT AT y(r),x(r);"\a"
1090 RETURN
2000 REM Jugador
2010 LET l$=INKEY$
2020 IF l$="m" OR l$="M" THEN GO SUB 3000: REM Laser
2030 IF (l$="z" OR l$="Z") AND xp>0 THEN LET xp=xp-1
2040 IF (l$="x" OR l$="X") AND xp<29 THEN LET xp=xp+1
2050 INK 2: PRINT AT 21,xp;" ? "
2060 RETURN
3000 REM Laser
3010 LET ym=21: LET xm=xp+1
3020 LET ym=ym-1
3030 IF POINT (xm*8,(21-ym)*8+2)=1 THEN LET colest=1
3040 IF POINT (xm*8,(21-ym)*8+3)=1 THEN LET colalien=1
3050 INK 7: PRINT AT ym,xm;"!"
3060 PAPER 0: PRINT AT ym,xm;" "
3070 IF colest=1 THEN PLOT xm*8,(21-ym)*8+2: LET colest=0
3080 IF colalien=1 THEN GO SUB 4000
3090 IF ym=1 THEN RETURN
3100 GO TO 3020
4000 REM Impacto
4005 BEEP .05,-10
4010 FOR a=1 TO invasores
4020 IF x(a)<>xm OR y(a)<>ym THEN GO TO 4040
4030 LET y(a)=22: LET a=invasores
4040 NEXT a
4050 LET alienigenas=alienigenas-1: LET puntos=puntos+1: LET colalien=0: LET ym=1
4060 IF alienigenas=0 THEN LET ganar=1
4070 INK 7: PRINT AT 0,26;puntos
4080 RETURN
5000 REM Ganar
5010 INK 5: PRINT AT 6,5;"BIEN HECHO TERRICOLA"
5020 PRINT AT 8,4;"ESTA VEZ HAS GANADO TU"
5030 BEEP .5,2: BEEP .5,10: BEEP 1,20
5040 PRINT AT 12,8;"PREPARATE PARA"
5050 PRINT AT 14,4;"NUESTRA PROXIMO ATAQUE"
5060 FOR d=1 TO 400: NEXT d
5070 LET alienigenas=invasores: LET altura=altura+2: LET ganar=0
5080 FOR a=1 TO invasores
5090 LET x(a)=a*3: LET y(a)=altura
5100 NEXT a
5110 RETURN
6000 REM Perder
6010 CLS
6020 INK 5: FLASH 1: PRINT AT 1,13;"L O S"
6030 PRINT AT 3,7;"I N V A S O R E S"
6040 PRINT AT 5,13;"H A N"
6050 PRINT AT 7,6;"A T E R R I Z A D O": FLASH 0
6060 BEEP 2,-10
6070 INK 6: PRINT AT 10,10;"SIN EMBARGO"
6080 PRINT AT 12,9;"HAS DESTRUIDO"
6090 INK 2: FLASH 1: PRINT AT 14,15;puntos: FLASH 0
6100 INK 6: PRINT AT 16,7;"NAVES ALIENIGENAS"
6110 PRINT AT 20,1;"QUIERES ENFRENTARTE DE NUEVO?"
6120 INPUT a$
6130 IF a$(1)="s" OR a$(1)="S" THEN RUN
6140 RETURN
7000 REM Pantalla
7010 CLS
7020 FOR s=1 TO 40
7030 PLOT 8*INT (RND*32),8*INT (RND*21)+10
7040 NEXT s
7050 INK 7: PRINT AT 0,5;"INVASORES DESTRUIDOS=";puntos
7055 FOR b=1 TO 20: BEEP .1,20: NEXT b
7060 RETURN
8000 REM Inicializar
8010 PAPER 0: INK 7: BORDER 0: CLS
8020 PRINT AT 1,4;"Eres un piloto solitario"
8030 PRINT AT 2,1;"protegiendo el planeta Tierra."
8040 PRINT AT 3,1;"En unos instantes estaras bajo"
8050 PRINT AT 4,3;"el ataque de invasores del"
8060 PRINT AT 5,9;"planeta VARGON."
8070 PRINT AT 6,4;"Tu mision es evitar que"
8080 PRINT AT 7,0;"aterricen las naves vargonianas."
8090 PRINT AT 10,2;"'Z' MUEVE LA NAVE A LA IZDA"
8100 PRINT AT 12,2;"'X' MUEVE LA NAVE A LA DCHA"
8110 PRINT AT 14,4;"PULSA 'M' PARA DISPARAR"
8120 PRINT AT 20,2;"Pulsa cualquier tecla para"
8125 PRINT AT 21,0;"entablar combate con el enemigo"
8130 LET perder=0: LET ganar=0: LET puntos=0: LET colalien=0: LET colest=0: LET xp=16: LET altura=1: LET invasores=10: LET alienigenas=invasores
8140 DIM x(invasores): DIM y(invasores)
8150 FOR a=1 TO invasores
8160 LET x(a)=a*3: LET y(a)=altura
8170 NEXT a
8180 POKE 65368,BIN 00100100
8190 POKE 65369,BIN 00100100
8200 POKE 65370,BIN 01111110
8210 POKE 65371,BIN 11111111
8220 POKE 65372,BIN 10011001
8230 POKE 65373,BIN 11111111
8240 POKE 65374,BIN 01011010
8250 POKE 65275,BIN 01000010
8260 LET R$=INKEY$: IF R$="" THEN GO TO 8260
8270 RETURN
>>>>>>> 7a0b7e0ea86a1db46872b1323f62b92b01225021
