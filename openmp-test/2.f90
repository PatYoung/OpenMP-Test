PROGRAM main
    USE omp_lib
	IMPLICIT NONE

	INTEGER(KIND = 4) :: n, m, i, j, k
	REAL(KIND =8 ) :: x,time1,time2
	REAL(KIND =8 ) :: t1, t2
	n = 10000000
	x = 0.0_8
	CALL cpu_time(t1)

	!WRITE(*,"('RUNNING ON', I2, ' THREADS.')") m

    CALL omp_set_num_threads(2)
	DO i = 1, 10
		DO j = 1, 10
			!$OMP PARALLEL DO REDUCTION(+:x)
			DO k = 1, n
				x = x + REAL(k ,KIND = 8)
			END DO
			!$OMP END PARALLEL DO
		END DO
	END DO
	CALL cpu_time(t2)
	WRITE(*,*) x

	time1 = t2 - t1
	WRITE(*,*) time1
	
	CALL cpu_time(t1)


    CALL omp_set_num_threads(2)
	DO i = 1, 10
		DO j = 1, 10
			DO k = 1, n
				x = x + REAL(k ,KIND = 8)
			END DO
		END DO
	END DO
	CALL cpu_time(t2)
	WRITE(*,*) x

	time2 = t2 - t1
	WRITE(*,*) time2
	WRITE(*,*) time2/time1
	
	
END PROGRAM