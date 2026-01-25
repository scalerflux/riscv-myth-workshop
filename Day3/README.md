# Day 3 - Digital Logic with TL-Verilog and Makerchip

## Table of Contents
- [D3SK1 - Combinational Logic](#d3sk1---combinational-logic-in-tl-verilog-using-makerchip)
- [D3SK2 - Sequential Logic](#d3sk2---sequential-logic)
- [D3SK3 - Pipelined Logic](#d3sk3---pipelined-logic)
- [D3SK4 - Validity](#d3sk4---validity)

---

## Introduction

### TL-Verilog
TL-Verilog (Transaction-Level Verilog) is an extension of SystemVerilog that simplifies hardware design by introducing higher-level abstractions. Key features:
- **Pipelines as first-class constructs** - Define pipeline stages with simple syntax (`|pipe`)
- **Implicit timing** - No need to manually manage clock signals in most cases  
- **Reduced code** - Typically 3-5x less code compared to traditional Verilog
- **Validity** - Built-in support for valid signals to reduce switching activity

### Makerchip IDE
[Makerchip](https://makerchip.com/) is a free, browser-based IDE for TL-Verilog development:
- Real-time compilation and simulation
- Integrated waveform viewer
- Visual diagram of your design
- No installation required

---

## D3SK1 - Combinational Logic in TL-Verilog using Makerchip


#### Mux(Multiplexer that can operate on vectors)
<!-- ![Mux]() -->
A multiplexer selects between multiple inputs based on a select signal
 <img width="3550" height="2382" alt="image" src="https://github.com/user-attachments/assets/de01b917-cc19-4949-8702-13302cb94928" />

#### Combinational Calculator
<!-- ![Combinational Calculator]() -->

<img width="3840" height="2302" alt="image" src="https://github.com/user-attachments/assets/892b4949-1afd-42b4-8109-cf141fdaec31" />
https://www.makerchip.com/sandbox/0Krfqh3JZ/0O7hzN

---

## Sequential Logic

What's a Flip-Flop?
Flip-flops are the fundamental building blocks of sequential logic. They:

* Drive the value at their input to their output only when the clock rises
* Hold their output value until the next rising clock edge
* Provide memory to digital circuits
* We use D flip-flops here—the simplest type that stores a single bit.

---

### Fibonacci Sequence
<!-- ![Fibonacci]() -->
The Fibonacci sequence demonstrates sequential logic beautifully. Each number is the sum of the two preceding ones.

Circuit behavior:

* With each rising clock edge, values propagate through the flops
* Values shift one flop to the right
* A reset initializes the circuit with two 1s to begin the sequence

 we'll just add a reset to intialize the cicuit with two 1s to begin the sequence
 
<img width="2940" height="992" alt="image" src="https://github.com/user-attachments/assets/06377dc2-827a-4524-b0ec-4ef91b890beb" />

In TL-Verilog, we reference previous cycle values using the >> operator:

>>1$num — Value of $num from 1 cycle ago
>>2$num — Value of $num from 2 cycles ago

"Unlike RTL, TL-Verilog doesn't require explicit flip-flop instantiation. The need for flip-flops is implied by referencing past values"



<img width="2488" height="760" alt="image" src="https://github.com/user-attachments/assets/aee9a9e2-e245-44aa-a4c4-04c8365a12bd" />

<img width="3836" height="2286" alt="image" src="https://github.com/user-attachments/assets/5c87e626-7beb-431a-a538-c3bf14f5099d" />





### Sequential Calculator

Building on our combinational calculator, a real calculator holds onto its result and uses it as the first operand in the next computation.

How it works:

* Enter * 16 → multiplies sixteen to the previous result
* The flip-flop holds the previous result value
* Each cycle performs a new calculation based on the previous result
* This previous result is STATE.

"⚠️ Important: Wherever we have state, we must have a $reset that sets that state to a known value. We reset the calculator to zero."
---
<img width="3840" height="2000" alt="image" src="https://github.com/user-attachments/assets/4161aab6-559b-44b4-a771-7e34b16eee80" />

---
https://www.makerchip.com/sandbox/0Krfqh3JZ/0P1h8v


![calculator](https://github.com/user-attachments/assets/bd3b2d90-5ebf-4233-90f2-39fde7045800)



---

## Pipelined Logic

<img width="3182" height="1148" alt="image" src="https://github.com/user-attachments/assets/d07ba68d-9bd2-4824-8b1f-60bdbb88b271" />



---

### Pipeline Error Detection
<!-- ![Pipeline Errors]() -->
**Goal**: Determine if a transaction is valid or has encountered errors (like bad input, overflow, or divide-by-zero) as it moves through a 6-stage pipeline.
**Mechanism**: Accumulate error flags stage-by-stage.

Instead of checking everything at the end, each stage passes its error status to the next.
**Logic**: `Current_Error = Previous_Error OR Current_Stage_Condition`

<img width="3838" height="2038" alt="image" src="https://github.com/user-attachments/assets/bdedb17a-d70d-4c45-849e-ce9bdbc9c932" />


### Counter n Calculator


Putiing the calulator n counter in stage @1 of calc pipeline

* the cnt is incresing(annoted white line)
* val1 is getting the out value from the first operation for next operation


<img width="3840" height="2486" alt="image" src="https://github.com/user-attachments/assets/6adb313b-e66d-4170-bc89-817b64a70eb7" />
https://www.makerchip.com/sandbox/0Krfqh3JZ/0Q1hMN

### Cycle calculator

<img width="3840" height="1870" alt="image" src="https://github.com/user-attachments/assets/83b3efd2-125c-4910-b8d4-dfb02c824c0d" />
https://www.makerchip.com/sandbox/0Krfqh3JZ/0Rghj5



The diagram looks something like this-> <img width="2146" height="1848" alt="image" src="https://github.com/user-attachments/assets/f6fc5b21-b156-4cda-9b76-646ab2c57080" />

<img width="3840" height="2486" alt="image" src="https://github.com/user-attachments/assets/11d0909a-3a1d-4962-b75f-77466742b6a3" />

---

##  Validity

<img width="3840" height="1814" alt="image" src="https://github.com/user-attachments/assets/387905b2-065d-4ee7-8ede-43d2984e0212" />

---

#### Calculator with Validity
<!-- ![Calculator Validity]() -->

<img width="3840" height="2486" alt="image" src="https://github.com/user-attachments/assets/deff3183-f9ae-4078-952c-0dcc8b5a7851" />

https://www.makerchip.com/sandbox/0Krfqh3JZ/0WnhrB#


####  Calculator with memory n recall 
<!-- ![Total Distance]() -->

<img width="3840" height="2486" alt="image" src="https://github.com/user-attachments/assets/18026a05-6cea-4df6-aa45-b0d51cfa093c" />
https://www.makerchip.com/sandbox/0Krfqh3JZ/0X6hEv#

---


