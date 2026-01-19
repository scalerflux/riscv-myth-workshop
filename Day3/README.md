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
 <img width="3550" height="2382" alt="image" src="https://github.com/user-attachments/assets/de01b917-cc19-4949-8702-13302cb94928" />

#### Combinational Calculator
<!-- ![Combinational Calculator]() -->

<img width="3840" height="2302" alt="image" src="https://github.com/user-attachments/assets/892b4949-1afd-42b4-8109-cf141fdaec31" />


---

## D3SK2 - Sequential Logic

What's a flip-flop? 

They basically drive the value at their input to their output, but only when the clock rises. They hold their output value until the next rising edge of their clock input. We'll use D fip-flops here

---

#### Fibonacci Sequence
<!-- ![Fibonacci]() -->

This is how the cicuit looks like, with each rising clock edge, the values will propagate through the flops, shifting one flop to the right, producing the waveform. we'll just add a reset to intialize the cicuit with two 1s to begin the sequence
<img width="2940" height="992" alt="image" src="https://github.com/user-attachments/assets/06377dc2-827a-4524-b0ec-4ef91b890beb" />

In TL-Verilog, we can reference the previous and previous-previous versions of $num as >>1$num and >>2$num. Unlike RTL, in TL design we need not assign these explicitly. They are implicitly available for use, and the need for flip-flops is implied.
<img width="2488" height="760" alt="image" src="https://github.com/user-attachments/assets/aee9a9e2-e245-44aa-a4c4-04c8365a12bd" />

<img width="3836" height="2286" alt="image" src="https://github.com/user-attachments/assets/5c87e626-7beb-431a-a538-c3bf14f5099d" />




#### Counter
<!-- ![Counter]() -->

#### Sequential Calculator
<!-- ![Sequential Calculator]() -->
K going back to the combination calculator we did, a calculator usually holds onto result value and uses it as the first operand in the next computation. If you enter "* 16" in the calculator, it mutliplies sixtenn to the previous result. Let’s update our calculator to act like this wherein essentially the flil-flop holds on to the first/previous result value. Each cycle, we’ll perform a new calculation, based on the previous result.

This previous result is state. And wherever we have state, we must have a $reset that will set that state to a known value. As in a real calculator, we will reset the value to zero.

<img width="3840" height="2000" alt="image" src="https://github.com/user-attachments/assets/4161aab6-559b-44b4-a771-7e34b16eee80" />


![calculator](https://github.com/user-attachments/assets/bd3b2d90-5ebf-4233-90f2-39fde7045800)







---

## D3SK3 - Pipelined Logic

<img width="3182" height="1148" alt="image" src="https://github.com/user-attachments/assets/d07ba68d-9bd2-4824-8b1f-60bdbb88b271" />



---

#### Pipeline Error Detection
<!-- ![Pipeline Errors]() -->
**Goal**: Determine if a transaction is valid or has encountered errors (like bad input, overflow, or divide-by-zero) as it moves through a 6-stage pipeline.
**Mechanism**: Accumulate error flags stage-by-stage.
Instead of checking everything at the end, each stage passes its error status to the next.
**Logic**: `Current_Error = Previous_Error OR Current_Stage_Condition`

<img width="3838" height="2038" alt="image" src="https://github.com/user-attachments/assets/bdedb17a-d70d-4c45-849e-ce9bdbc9c932" />


#### Counter n Calculator
<!-- ![2-Cycle Calculator]() -->

# Putiing the calulator n counter in stage @1 of calc pipeline

* the cnt is incresing(annoted white line)
* val1 is getting the out value from the first operation for next operation


<img width="3840" height="2486" alt="image" src="https://github.com/user-attachments/assets/6adb313b-e66d-4170-bc89-817b64a70eb7" />

#### Cycle calculator

<img width="3840" height="1640" alt="image" src="https://github.com/user-attachments/assets/af30b532-02da-42f4-9e8e-9eb0a20b230b" />


The diagram looks something like this-> <img width="2146" height="1848" alt="image" src="https://github.com/user-attachments/assets/f6fc5b21-b156-4cda-9b76-646ab2c57080" />







---

## D3SK4 - Validity



---

#### Calculator with Validity
<!-- ![Calculator Validity]() -->

#### Total Distance Calculator
<!-- ![Total Distance]() -->

---

## Key Takeaways
- 

---

*Workshop: RISC-V MYTH | Date: 2026-01-16*
