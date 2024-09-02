#!/bin/bash
# 
# LAB 6
#
####################################################################
# Перевірка наявності параметру
if [ -z "$1" ]; then
  echo "ERROR: вкажіть Параметр!"
  exit 1
fi

# Пошук значення параметра
parameter_value=$(grep "^$1:" /proc/meminfo | awk '{print $2}')

if [ -z "$parameter_value" ]; then
  echo "ERROR: параметр не знайдено"
  exit 1
fi

# Додаткова інформація
if [ "$2" == "info" ]; then
  case $1 in
    MemTotal)
      echo "MemTotal - загальний обсяг доступної RAM"
      ;;
    MemFree)
      echo "MemFree - обсяг вільної RAM"
      ;;
    *)
      echo "ERROR: інформативне повідомлення не доступне для цього параметра"
      exit 1
      ;;
  esac
  exit 0
fi

# Перевірка кількості підряд-  цифр
check_digits() {
  local value=$1
  local max_digits=$2
  if [[ "$value" =~ ([0-9])\1{$((max_digits - 1))} ]]; then
    return 1
  else
    return 0
  fi
}

# Конвертаціч значення
convert_size() {
  local size_kb=$1

  local size_mb
  size_mb=$(echo "scale=1; $size_kb / 1024" | bc)

  local size_gb
  size_gb=$(echo "scale=1; $size_mb / 1024" | bc)

  if [ "$(echo "$size_kb < 1024" | bc)" -eq 1 ]; then
    echo "${size_kb} kB"
  elif [ "$(echo "$size_mb < 1024" | bc)" -eq 1 ]; then
    echo "${size_mb} MB"
  else
    echo "${size_gb} GB"
  fi
}

# Визначення обмежень
case $1 in
  MemTotal)
    max_length=5
    max_consecutive_digits=2
    ;;
  MemFree)
    max_length=6
    max_consecutive_digits=3
    ;;
  *)
    echo "ERROR: параметр не підтримується цим скриптом"
    exit 1
    ;;
esac

# Конвертація
# Підготування до перевірки
converted_value=$(convert_size "$parameter_value")

# Перевірка довжини та кількості цифр підряд
# Отримання чистого значення для перевірки
clean_value=${converted_value//[^0-9.]}
if [ ${#clean_value} -le $max_length ] && check_digits "$clean_value" $max_consecutive_digits; then
  echo "$1: $converted_value"
else
  echo "$clean_value"
  echo "ERROR: значення параметра не відповідає обмеженням"
  exit 1
fi
