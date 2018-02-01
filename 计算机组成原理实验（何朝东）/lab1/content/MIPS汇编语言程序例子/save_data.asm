###################################################################
#
#  将寄存器中的数据数据存储到存储器中
#
###################################################################
.text                    # 代码段 声明
.globl main              # globl指明程序的入口地址 main
main:                    # 入口地址 main
    la $t0, data1          # $t0<-从内存中取数据地址
    lw $a0,0($t0)           # $a0<-取出内存数据

    la $t1, data2          # $t0<-从内存中取数据地址
    sw $a0, 4($t1)         # 把一个字的数据从寄存器存储到存储器中(内存地址：4+$t0) 
    sh $a0, 8($t1)         # 把半个字的数据从寄存器存储到存储器中(内存地址：8+$t0)
    sd $a0, 12($t1)        # 把两个字（64位）的数据从寄存器存储到存储器中，占64位内存空间，
                           # “0x12345678”这个数放在低32位中，高32位数据来自$a1(STACK 指针)，看模拟器PCSpim中有指令
                         # addiu $a1,$sp,4，产生
    sb $a0, 20($t1)        # 把一个字节的数据从寄存器存储到存储器中(内存地址：20+$t0)

    li $v0, 10             # 退出
    syscall                # 系统调用

.data              # 数据段 声明
   data1:              # 数据变量名称
       .word 0x12345678,0x98765432  # 字类型数据，32位
   data2:
       .word 0x00000000

