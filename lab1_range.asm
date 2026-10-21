#Программа: вывод диапазона min(x,118)...max(x,118) с шагом 14
.text
.globl main

main:
    li a7, 5          # читаем x
    ecall
    mv t0, a0         # t0 = x

    li t1, 118        # <--- ЗДЕСЬ: 118 = номер группы (y)
    li t2, 14         # <--- ЗДЕСЬ: 14 = номер студента = шаг (h)

#Определяем min (t3) и max (t4)
    blt t0, t1, x_is_min
    mv t3, t1         # min = 118
    mv t4, t0         # max = x
    j start_loop

x_is_min:
    mv t3, t0         # min = x
    mv t4, t1         # max = 118

start_loop:
    bgt t3, t4, exit_loop # если min > max, выходим

    mv a0, t3         # печатаем текущее значение
    li a7, 1
    ecall

    li a0, 10         # печатаем перенос строки ('\n')
    li a7, 11
    ecall

    add t3, t3, t2    # увеличиваем на шаг (14)
    j start_loop

exit_loop:
    li a7, 10         # выход
    ecall