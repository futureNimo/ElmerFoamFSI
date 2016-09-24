#!/bin/tcsh

rm -f tmpresults_1.txt
mpirun -np 4 ./bin/elmerfoamfsi_parallel_test -o tmpresults_1.txt
@ i = 1
while($i <= 240)
    @ i += 1
    if( -e tmpresults_1.txt ) then
        @ i += 241;
    else
        sleep 30;
    endif
end
mv tmpresults_1.txt $1
exit 0