#!/bin/bash

#
# Варіант -1, літера- D (d)
#
awk -F: 'NR <= 101 && $1 ~ /^d/ {print $5}' /etc/passwd

# виводить на екран 5-тий стовпчик рядків файлу /etc/passwd, враховуючи наступні умови:
# -обробляються номери рядків не більше значення  варіанту 1 + 100;
# -значення 1-го стовпчику починається з символу, який співпадає з 1-ю латинською
# літерою прізвища - D
