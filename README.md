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
| ALUControlE |     Function     | Instruction |
|:-----------:|:----------------:|:-----------:|
|     000     |        Add       |     add     |
|     001     |     Subtract     |     sub     |
|     010     |        AND       |     and     |
|     011     |        OR        |      or     |
|     100     |   Set Less Than  |     slt     |
|     101     | Set Greater Than |     sgt     |
|     110     |   Branch Equal   |     beq     |

The simulation gave us this results
<img src="https://github.com/laurasmendozad/Pipelined-Processor/blob/main/Images/Testbench/ALU_tb.png">

### Decoder
SIts main function is to translate the instructions encoded in machine language into electrical signals that the ALU can understand and execute.


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

