#!/bin/bash
#
# LAB 6
###################################################################
# Обмеження
max_len_name=5  # максимальна довжина
max_digits=2  # максимальна кількість цифр підряд

# Чи існує файл
check_exists() {
    [ -e "$1" ]
}

# Перевірка обмежень
validate_name() {
    if [[ "${#1}" -gt $max_len_name ]]; then
        echo "ERROR: назва не може бути довшою за $max_len_name символів"
        exit 1
    fi

    # Перевірка на підр. цифри
    if [[ "$1" =~ [0-9]{3,} ]]; then
        echo "ERROR: назва не може містити більше ніж $max_digits цифр підряд"
        exit 1
    fi
}

# Створення порожнього файлу
create_file() {
    validate_name "$1"
    if check_exists "$1"; then
        echo "ERROR: файл '$1' вже існує"
        exit 1
    fi
    touch "$1"
    echo "Порожній файл '$1' створено!"
    ls -la
}


echo "Введіть назву порожнього файлу:"
read filename
create_file "$filename"
