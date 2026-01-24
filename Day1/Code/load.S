.section .text
.global load
.type load, @function

load:
    # Arguments: a0 = x (start, 0), a1 = y (count+1, 10)
    # Returns: a0 = sum from 1 to (y-1)

    add  a4, zero, zero    # a4 = 0 (sum accumulator)
    add  a3, zero, zero    # a3 = 0 (counter i)
    add  a2, a1, zero      # a2 = a1 (store count limit)

loop:
    add  a4, a3, a4        # a4 = a4 + a3 (sum += i)
    addi a3, a3, 1         # a3 = a3 + 1 (i++)
    blt  a3, a2, loop      # if a3 < a2, goto loop

    add  a0, a4, zero      # a0 = a4 (return sum)
    ret                    # return to caller
~                                               
