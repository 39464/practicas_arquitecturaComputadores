;Apartado 4.1.2: IMPLEMENTACION CON WHILE
; Dirección de comienzo de las variables
	.data
	.org 0x200

vectorA: .byte 0, 1, 2, 3, 4, 5, 6, 7 ; char vectorA [] = {0, 1, 2, ……}

vectorB: .byte 1, 1, 1, 1, 1, 1, 1, 1 ; char vectorB [] = {1, 1, 1, ….. }

vectorSum: .space 8 ; char vectorSum [8]

; Dirección de comienzo del código
 .text
 .org 0x0

MAIN: daddi r1,r0,8 ; i=8
WHILE: beqz r1,FIN  ; while (i>0) {
 daddi r1,r1,-1  ; i=i-1
 lb r2, vectorA(r1)  ; r2=vectorA[i]
 lb r3, vectorB(r1)  ; r3=vectorB [i]
 dadd r4,r2,r3  ; vectorSum[i]=vectorA[i]+ vectorB[i], hacer suma
 sb r4, vectorSum(r1)  ; vectorSum[i] = r4, asignar suma a vector
 j WHILE  ; }
FIN: halt