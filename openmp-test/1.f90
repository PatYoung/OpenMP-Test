PROGRAM main
    USE omp_lib
	IMPLICIT NONE

	INTEGER(KIND = 4) :: n, m, i
	REAL(KIND =8 ) :: x,time1,time2
	REAL(KIND =8 ) :: t1, t2
	n = 1000000000
	x = 0.0_8
	CALL cpu_time(t1)

	!WRITE(*,"('RUNNING ON', I2, ' THREADS.')") m

    CALL omp_set_num_threads(2)

	!$OMP PARALLEL DO REDUCTION(+:x)
	DO i = 1, n
		x = x + REAL(i ,KIND = 8)
	END DO
	!$OMP END PARALLEL DO
	CALL cpu_time(t2)
	WRITE(*,*) x

	time1 = t2 - t1
	WRITE(*,*) time1
	
	t1 = 0.0_8
	t2 = 0.0_8
	
	x = 0.0_8
	
	CALL cpu_time(t1)
	DO i = 1, n
		x = x + REAL(i ,KIND = 8)
		
	END DO	
	CALL cpu_time(t2)
	WRITE(*,*) x

	time2 = t2 -t1
	WRITE(*,*) time2,time2/time1
	
END PROGRAM