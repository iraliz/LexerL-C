%{
#include <stdio.h>
%}

/* para que flex no pida la librería extra al terminar */
%option noyywrap

%%
"let"           { printf("TOKEN: PALABRA_RESERVADA (let)\n"); }
"mut"           { printf("TOKEN: PALABRA_RESERVADA (mut)\n"); }
"if"            { printf("TOKEN: PALABRA_RESERVADA (if)\n"); }
"else"          { printf("TOKEN: PALABRA_RESERVADA (else)\n"); }
"fn"            { printf("TOKEN: PALABRA_RESERVADA (fn)\n"); }
"return"        { printf("TOKEN: PALABRA_RESERVADA (return)\n"); }

"i32"           { printf("TOKEN: TIPO_DATO (i32)\n"); }
"bool"          { printf("TOKEN: TIPO_DATO (bool)\n"); }

"true"          { printf("TOKEN: LITERAL_BOOL (true)\n"); }
"false"         { printf("TOKEN: LITERAL_BOOL (false)\n"); }

[a-zA-Z_][a-zA-Z0-9_]* { printf("TOKEN: IDENTIFICADOR (%s)\n", yytext); }
[0-9]+                 { printf("TOKEN: LITERAL_ENTERO (%s)\n", yytext); }

"=="            { printf("TOKEN: OPERADOR_COMPARACION (==)\n"); }
"="             { printf("TOKEN: OPORADOR_ASIGNACION (=)\n"); }
"+"             { printf("TOKEN: OPERADOR_ARITMETICO (+)\n"); }
"-"             { printf("TOKEN: OPERADOR_ARITMETICO (-)\n"); }
"*"             { printf("TOKEN: OPERADOR_ARITMETICO (*)\n"); }
":"             { printf("TOKEN: DELIMITADOR_TIPO (:)\n"); }
";"             { printf("TOKEN: DELIMITADOR (;)\n"); }
"{"             { printf("TOKEN: LLAVE_ABRE ({)\n"); }
"}"             { printf("TOKEN: LLAVE_CIERRA (})\n"); }
"("             { printf("TOKEN: PAREN_ABRE (()\n"); }
")"             { printf("TOKEN: PAREN_CIERRA ())\n"); }

[ \t\n\r]+      { /* ignorar espacios, tabulaciones y saltos de línea */ }

.               { printf("ERROR LÉXICO: Carácter no reconocido [%s]\n", yytext); }

%%

/* Apartado para la función principal y poder ejecutar el lexer */
int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            printf("Error: No se pudo abrir el archivo %s\n", argv[1]);
            return 1;
        }
    }
    printf("--- Comenzando con el analisis lexico ---\n");
    yylex();
    printf("--- El analisis ha finalizado ---\n");
    return 0;
}