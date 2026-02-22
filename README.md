# Analizador Léxico Lenguaje Subconjunto de Rust (L)

Este proyecto consiste en el diseño e implementación de un analizador léxico (o lexer) para un subconjunto del lenguaje **Rust**, denominado **L**. El desarrollo se realizó utilizando el metacompilador **Flex** en un entorno Windows, como parte de la asignatura *Lenguajes y Compiladores*.

## 1. Descripción del Lenguaje Diseñado (L)

El lenguaje **L** es un subconjunto simplificado de Rust que permite la declaración de variables, estructuras de control básicas y operaciones aritméticas. Está compuesto por:

* **Palabras Reservadas:** `let`, `mut`, `if`, `else`, `fn`, `return`.
* **Tipos de Datos:** `i32` (enteros).
* **Identificadores:** Nombres de variables (ej. `mi_variable`, `x1`).
* **Literales:** Números enteros (`10`, `500`).
* **Operadores:** `=`, `==`, `+`, `-`, `*`.
* **Delimitadores:** `{`, `}`, `(`, `)`, `;`, `:`.
* **Booleanos y True False:** Los booleanos literales `true` y `false`, al igual que el tipo de dato `bool`

## 2. Manual de Usuario del Metacompilador Flex

**Fast Lexical Analyzer Generator (Flex)** se trata de una herramienta que automatiza la creación de analizadores léxicos. En lugar de escribir el código de un autómata a mano, Flex permite:

1.  **Definir Patrones:** Usamos expresiones regulares para describir los componentes del lenguaje.
2.  **Acciones:** Asociamos código C a cada patrón para que se ejecute cuando se encuentre una coincidencia.
3.  **Generación de Código:** Flex traduce estas reglas a un programa en C (`lex.yy.c`) que implementa un **Autómata Finito Determinista (AFD)** eficiente.

## 3. Guía de Instalación e Implementación (dirigida a Windows)

### Requisitos Previos
* **WinFlexBison:** Extraído en una carpeta y posteriormente añadido al PATH del sistema para su uso.
* **MinGW (GCC):** Instalado y añadido al PATH para compilar el código C que se genera.

### Pasos para Compilar y Ejecutar

1.  **Generar el Analizador:**
    Abra una terminal en la carpeta del proyecto y ejecute:
    ```bash
    flex lexer_rust.l
    ```
    *Esto generará el archivo `lex.yy.c`. del que se habla previamente*

2.  **Compilar el Ejecutable:**
    ```bash
    gcc lex.yy.c -o lexerOf.exe
    ```

3.  **Ejecutar el Análisis:**
    Cree un archivo de prueba (en este caso fueron dos agregados directamente) y ejecute:
    ```bash
    ./lexerOf.exe prueba.txt
    ```
---
**Autores:** Ariadna Avila, Roxana Moreno, Hector Vasquez 

**Institución:** UNEG - Ingeniería en Informática  

**Asignatura:** Lenguajes y Compiladores
