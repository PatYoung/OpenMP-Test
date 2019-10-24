program main
    USE omp_lib
	IMPLICIT NONE


	integer N,M,i
	real(kind=8) t
	N=20000
	t=0.0
	!$OMP PARALLEL DO REDUCTION(+:t)
	do i = 1, N
	t = t+float(i)
		M = OMP_get_num_threads()
	enddo
	write(*, "('t =  ', F20.5, ' running on ', I3, ' threads.')") t,M
	!pause
	stop
end