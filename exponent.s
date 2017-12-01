     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
		/* e^x=1+x+(x^2)/2+(x^3)/6...
		This code will compute e^4.
		S3 contains the value of x i.e 4 we can change it to compute for other powers
		S1 has the initial value for computing the factorial I am adding one to it in every iteration
		S2 will store the final value of computation 
		We are multiplying S0 by the value of x and dividing it by the computed factorial of the corresponding iteration
		
		Algorithm:
		S3=4
		S0=4
		S2=1
		while(r1<50)
			{
			S2=S2+S0
			S1=S1+1
			S0=(S0*S3)/S1
			}
		*/
		VMOV.F32 S0,#4
		VMOV.F32 S1,#1
		VMOV.F32 S2,#1
		VMOV.F32 S3,S0
		VMOV.F32 S4,#1
		MOV R1,#0
		MOV R2,#50
loop	CMP R1,R2
		BGT stop
		VDIV.F32 S0,S0,S1
		VADD.F32 S2,S2,S0
		VMUL.F32 S0,S0,S3
		VADD.F32 S1,S1,S4
		ADD R1,#1
		B loop
stop B stop ; stop program
     ENDFUNC
     END