#!/bin/bash


echo "Inciando Programa"

read -p "Por favor insira seu nome: " nomeuser
echo "Olá, $nomeuser! Por favor insira dois valores e a operação que deseja realizar"

read -p "Digite o valor: " valor1
read -p "Digite o valor: " valor2
read -p "Agora digite a operação que deseja realizar (+, -, *, /, ^): " conta

case "$conta" in
    "+")
        resultado=$(echo "$valor1 + $valor2" | bc -l)
        echo "O resultado foi: $resultado"
        ;;
    "-")
        resultado=$(echo "$valor1 - $valor2" | bc -l)
        echo "O resultado foi: $resultado"
        ;;
    "*")
        resultado=$(echo "$valor1 * $valor2" | bc -l)
        echo "O resultado foi: $resultado"
        ;;
    "/")
        if [ "$valor2" == "0" ]; then
            echo "Erro: Divisão por zero não é permitida!"
        else
            resultado=$(echo "scale=4; $valor1 / $valor2" | bc -l)
            echo "O resultado foi: $resultado"
        fi
        ;;
    "**"|"^")
        resultado=$(echo "$valor1 ^ $valor2" | bc -l)
        echo "O resultado foi: $resultado"
        ;;
    *)
        echo "Desculpe, no momento essa operação não pode ser efetuada, aguarde atualizações"
        ;;
esac

echo "Programa Finalizado"
