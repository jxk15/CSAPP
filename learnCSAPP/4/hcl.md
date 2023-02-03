取指阶段
```
bool instr_valid =
    icode in { INOP, IHALT, IRRMOVQ, IIRMOVQ, IRMMOVQ, IMRMOVQ,
               IOPQ, IJXX, ICALL, IRET,
               IPUSHQ, IPOPQ
             };
bool need_regids =
    icode in { IRRMOVQ, IOPQ, IPUSHQ, IPOPQ,
               IIRMOVQ, IRMMOVQ, IMRMOVQ
             };
bool need_valC =
    icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ, IJXX, ICALL };
```
译码和写回阶段
```
word srcA = [
    icode in { IRRMOVQ, IRMMOVQ, IOPQ, IPUSHQ } : rA;
    icode in { IPOPQ, IRET } : RRSP;
    1 : RNONE;  # Don't need register
];
word srcB = [
    icode in { IOPQ, IRMMOVQ, IMRMOVQ } : rB;
    icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;  # Don't need register
];
word dstE = [
    icode in { IRRMOVQ } && Cnd: rB; # 实现条件传送
    icode in { IIRMOVQ, IOPQ } : rB;
    icode in { IPUSHQ, IPOPQ, ICALL, IRET } : RRSP;
    1 : RNONE;  # Don't need register
];
word dstM = [
    icode in { IMRMOVQ, IPOPQ } : rA;
    1 : RNONE;  # Don't need register
];
```
执行阶段
```
## Select input A to ALU
word aluA = [
    icode in { IRRMOVQ, IOPQ } : valA;
    icode in { IIRMOVQ, IRMMOVQ, IMRMOVQ } : valC;
    icode in { ICALL, IPUSHQ } : -8;
    icode in { IRET, IPOPQ } : 8;
    # Other instructions don't need ALU
];

## Select input B to ALU
word aluB = [
    icode in { IRMMOVQ, IMRMOVQ, IOPQ, ICALL,
               IPUSHQ, IRET, IPOPQ } : valB;
    icode in { IRRMOVQ, IIRMOVQ } : 0;
    # Other instructions don't need ALU
];

word alufun = [
    icode == IPOPQ : ifun;
    1 : ALUADD;
];

bool set_cc = icode in { IOPQ };

word Stat = [
    imem_error || dmem_error : SADR;
    !instr_valid : SINS;
    icode == IHALT : SHLT;
    1 : SAOK;
];

bool Cnd  # 省略
```
访存阶段
```
word mem_addr = [
    icode in { IRMMOVQ, IMRMOVQ, IPUSHQ, ICALL } : valE;
    icode in { IPOPQ, IRET } : valA;
];

word mem_data = [
    # Value from register
    icode in { IRMMOVQ, IPUSHQ } : valA; # push %rsp 时压入的是原始值（回顾 4.1.6 小节）
    # from PC
    icode in { ICALL } : valP;
];

bool mem_read  = icode in { IMRMOVQ, IPOPQ, IRET };
bool mem_write = icode in { IRMMOVQ, IPUSHQ, ICALL };
```
更新 PC 阶段
```
word new_pc = [
    # 1. Call. Use instruction constant
    icode == ICALL : valC;
    # 2. Taken branch. Use instruction constant
    icode == IJXX && Cnd : valC;
    # 3. Completion of RET instruction. Use value from stack
    icode == IRET : valM;
    # 4. Default: Use incremented PC
    1 : valP;
];
```