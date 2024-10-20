# Pipelined Processor
<div align="center">
   <img align="center"  width="650px" src="https://cdn.dribbble.com/users/1366606/screenshots/8075231/dribbble-003.gif" alt="logo">
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
      <li>Python</li>
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
<style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  overflow:hidden;padding:10px 5px;word-break:normal;}
.tg th{border-color:black;border-style:solid;border-width:1px;font-family:Arial, sans-serif;font-size:14px;
  font-weight:normal;overflow:hidden;padding:10px 5px;word-break:normal;}
.tg .tg-r57t{background-color:#0075bf;border-color:inherit;color:#ffffff;text-align:center;vertical-align:top}
.tg .tg-baqh{text-align:center;vertical-align:top}
.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
.tg .tg-p9pw{background-color:#0075bf;border-color:inherit;color:#ffffff;font-size:100%;text-align:center;vertical-align:top}
.tg .tg-2m5o{background-color:#e2eaf7;text-align:center;vertical-align:top}
.tg .tg-lcep{background-color:#0075bf;color:#ffffff;font-weight:bold;text-align:center;vertical-align:top}
.tg .tg-5zer{background-color:#e2eaf7;border-color:inherit;text-align:center;vertical-align:top}
</style>
<table class="tg"><thead>
  <tr>
    <th class="tg-p9pw"><span style="font-weight:bold">ALUControlE</span></th>
    <th class="tg-r57t"><span style="font-weight:bold">Function</span></th>
    <th class="tg-lcep">Instruction</th>
  </tr></thead>
<tbody>
  <tr>
    <td class="tg-c3ow">000</td>
    <td class="tg-c3ow">Add</td>
    <td class="tg-baqh">add</td>
  </tr>
  <tr>
    <td class="tg-5zer">001</td>
    <td class="tg-5zer">Subtract</td>
    <td class="tg-2m5o">sub</td>
  </tr>
  <tr>
    <td class="tg-c3ow">010</td>
    <td class="tg-c3ow">AND</td>
    <td class="tg-baqh">and</td>
  </tr>
  <tr>
    <td class="tg-5zer">011</td>
    <td class="tg-5zer">OR</td>
    <td class="tg-2m5o">or</td>
  </tr>
  <tr>
    <td class="tg-c3ow">100</td>
    <td class="tg-c3ow">Set Less Than</td>
    <td class="tg-baqh">slt</td>
  </tr>
  <tr>
    <td class="tg-5zer">101</td>
    <td class="tg-5zer">Set Greater Than</td>
    <td class="tg-2m5o">sgt</td>
  </tr>
  <tr>
    <td class="tg-c3ow">110</td>
    <td class="tg-c3ow">Branch Equal</td>
    <td class="tg-baqh">beq</td>
  </tr>
</tbody></table>

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

