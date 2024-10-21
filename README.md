# Pipelined Processor
<div align="center">
   <img align="center"  width="500px" src="https://cdn.dribbble.com/users/1366606/screenshots/8075231/dribbble-003.gif" alt="logo">
</div>

## Table of Contents

- <a href ="#about">Overview</a>
- <a href ="#getstarted">Get Started</a>
- <a href ="#modules">Modules</a>
- <a href ="#design">Design</a>
- <a href ="#contributors">Contributors</a>

## Overview <a id = "about"></a>
<ul>
   <li>
      It is required to design, implement and test a pipeline processor, RISC-V based.
   </li>
   <li>Built using:
   <ol>
      <li>Verilog</li>
      <li>Vivado</li>
      <li>GTKWave</li>
      </ol>
   </li>
</ul>

## Get Started <a id = "getstarted"></a>
### Install Icarus Verilog
```
sudo add-­apt­-repository ppa:team­electronics/ppa
sudo apt­-get update
sudo apt­-get install iverilog
```
### Install GTKWave
```
sudo apt­-get update
sudo apt­-get install gtkwave
```

### Run tests
```
iverilog -o Module_TB ../generated/*.v ./Module_tb.v
vvp testbench
gtkwave out.vcd &
```

## Modules <a id = "modules"></a>
### ALU
An Arithmetic/Logical Unit (ALU) combines a variety of mathematical and logical operations into a single unit, forms the heart of most computer systems.
| ALUControlE |       Function      | Instruction |
|:-----------:|:-------------------:|:-----------:|
|     000     |          Add        |     add     |
|     001     |       Subtract      |     sub     |
|     010     |          AND        |     and     |
|     011     |          OR         |      or     |
|     100     |   Set Greater Than  |     sgt     |
|     101     |     Set Less Than   |     slt     |

The simulation gave us this results
<img src="https://github.com/laurasmendozad/Pipelined-Processor/blob/main/Images/Testbench/ALU_tb.png">

### Decoder
Its main function is to translate the instructions encoded in machine language into electrical signals that the ALU can understand and execute. We partition it into two major parts: the Main Decoder, which produces most of the control signals, and the ALU Decoder, which determines what operation the ALU performs. Each partition has it's own truth table presented below.

#### Main Decoder
| Instruction |    op   | RegWriteD | ImmSrcD | ALUSrcD | MemWriteD | ResultSrcD | BranchD | ALUOp | JumpD |
|:-----------:|:-------:|:---------:|---------|---------|-----------|------------|---------|-------|-------|
|      lw     | 0000011 |     1     |   000   |    1    |     0     |     01     |    0    |   00  |   0   |
|      sw     | 0100011 |     0     |   001   |    1    |     1     |     11     |    0    |   00  |   0   |
|    R-type   | 0110011 |     1     |   000   |    0    |     0     |     00     |    0    |   10  |   0   |
|     beq     | 1100011 |     0     |   010   |    0    |     0     |     00     |    1    |   01  |   0   |
|    I_type   | 0010011 |     1     |   000   |    1    |     0     |     00     |    0    |   10  |   0   |
|    U-type   | 0110111 |     1     |   100   |    1    |     0     |     11     |    0    |   00  |   0   |
|     jal     | 1101111 |     1     |   011   |    1    |     0     |     10     |    0    |   00  |   1   |

#### ALU Decoder
| ALUOp | func3 | {op[5],func7_5} | ALUControl | Instruction |
|:-----:|:-----:|:---------------:|:----------:|:-----------:|
|   00  |   x   |        x        |     000    |    lw,sw    |
|   01  |   x   |        x        |     001    |      be     |
|   10  |  000  |     00,01,10    |     000    |     add     |
|   10  |  000  |        11       |     001    |     sub     |
|   10  |  010  |        x        |     101    |     slt     |
|   10  |  100  |        x        |     110    |     jal     |
|   10  |  110  |        x        |     011    |      or     |
|   10  |  111  |        x        |     010    |     and     |

The simulation gave us this results
<img src="https://github.com/laurasmendozad/Pipelined-Processor/blob/main/Images/Testbench/Decoder_tb.png">

## Design <a id = "design"></a>
<img src="https://github.com/laurasmendozad/Pipelined-Processor/blob/main/Images/Schematic_Pipeline_Processor.png">


## Contributors <a id ="contributors"></a>
<table align="center" >
  <tr>
     <td align="center"><a href="https://github.com/laurasmendozad"><img src="https://avatars.githubusercontent.com/u/58611097?v=4" width="150px;" alt=""/><br /><sub><b>Laura Mendoza</b></sub></a><br /></td>
    <td align="center"><a href="https://github.com/juanrondon16" ><img src="https://avatars.githubusercontent.com/u/69017604?v=4" width="150px;" alt=""/><br /><sub><b>Juan Carlos Rondón</b></sub></a><br />
    </td>
      <td align="center"><a href="https://github.com/Juan090400"><img src="https://avatars.githubusercontent.com/u/185458274?v=4" width="150px;" alt=""/><br /><sub><b>Juan José Camacho</b></sub></a><br /></td>
  </tr>
</table>

