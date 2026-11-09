.data

N: .byte 10
A: .byte 1,5,3,7,2,8,5,9,0,7

.text

	lb r1,N(r0)
	daddi r1,r1,-1		;N-1
	dadd r2,r0,r0		;i=0 # i es r2
for1:	beq r2,r1,sigue1	;for(i=0; i<n-1; i++)
	dadd r3,r0,r1		;j = N-1 # j es r3, n-1 está contenido en r1
for2:	beq r3,r2,sigue2	;for (j= n-1; j>i; j--). cuando r2 = r3, salta
	lb r4, A(r3)		;r4 = A[j]
	lb r5, A-1(r3)		;r5 = A[j-1]
	slt r6,r4,r5		; # si r4 < r5 se pone un 1 en r6
	beqz r6, salta		;if(A[j] < A[j-1]) #criterio de ordenacion
	dadd r7,r0,r4		; k = A[j]
	dadd r4,r0,r5		; # el valor de r5 se almacena en r4
	sb r4,A(r3)		; A[j] = A[j-1]
	sb r7,A-1(r3)		;A[j-1] = k #intercambiar los valores
salta:	daddi r3,r3,-1		; j--
	j for2			;vuelta al loop
sigue2: daddi r2,r2,1
	j for1
sigue1: halt
	 
	