# Logica-programablee
Decodificación de Número Primo con 4 Variables en FPGA
## Descripción
---

En esta práctica se diseñó un sistema en Verilog que permite identificar si un número binario de 4 bits es un número primo.

El número se ingresa mediante 4 switches de la FPGA y el resultado se muestra encendiendo un LED cuando el número es primo.

La implementación se realizó utilizando la tarjeta DE10-Lite y el software Intel Quartus Prime Lite.

Objetivo

Desarrollar un circuito digital que:

Lea 4 switches (SW[3:0]).

Interprete su valor como un número binario entre 0 y 15.

Determine si el número es primo.

Encienda un LED cuando el número sea primo.

Materiales Utilizados

Tarjeta FPGA DE10-Lite

Cable USB Blaster

Intel Quartus Prime Lite

Código en Verilog

Funcionamiento

Los 4 switches representan un número binario de 4 bits.

El sistema analiza el número ingresado.

Si el número es primo, el LED se enciende.

Si el número no es primo, el LED permanece apagado.

Números Primos en el Rango de 4 Bits (0–15)

Los números primos dentro de este rango son:

2 (0010)

3 (0011)

5 (0101)

7 (0111)

11 (1011)

13 (1101)

Los demás valores no son números primos.

Entradas y Salidas

Entradas:

SW[3:0] → 4 switches

Salida:

LED → Indicador de número primo

Resultado

Al probar distintas combinaciones en los switches:

Si el número es primo → LED encendido.

Si el número no es primo → LED apagado.
