#!/bin/bash
set -eux

BINARY="usr/local/bin/bubblesort"

if [ ! -f "$BINARY" ]; then
  echo "Ошибка: бинарный файл не найден по пути $BINARY"
  exit 1
fi

# ---------- ТЕСТ 1: обычный набор чисел ----------
INPUT_1="5
5 3 1 4 2
"

EXPECTED_1="1 2 3 4 5"

RESULT_1=$(echo "$INPUT_1" | "$BINARY" | tail -n 1 | tr -s ' ' | sed 's/^ //;s/ $//')

if [ "$RESULT_1" = "$EXPECTED_1" ]; then
  echo "Тест 1 пройден"
else
  echo "Тест 1 не пройден"
  echo "Ожидалось: $EXPECTED_1"
  echo "Получено:  $RESULT_1"
  exit 1
fi

# ---------- ТЕСТ 2: отрицательные числа ----------
INPUT_2="6
-5 -10 0 7 3 -1
"

EXPECTED_2="-10 -5 -1 0 3 7"

RESULT_2=$(echo "$INPUT_2" | "$BINARY" | tail -n 1 | tr -s ' ' | sed 's/^ //;s/ $//')

if [ "$RESULT_2" = "$EXPECTED_2" ]; then
  echo "Тест 2 пройден"
else
  echo "Тест 2 не пройден"
  echo "Ожидалось: $EXPECTED_2"
  echo "Получено:  $RESULT_2"
  exit 1
fi

# ---------- ТЕСТ 3: один элемент ----------
INPUT_3="1
42
"

EXPECTED_3="42"

RESULT_3=$(echo "$INPUT_3" | "$BINARY" | tail -n 1 | tr -s ' ' | sed 's/^ //;s/ $//')

if [ "$RESULT_3" = "$EXPECTED_3" ]; then
  echo "Тест 3 пройден"
else
  echo "Тест 3 не пройден"
  echo "Ожидалось: $EXPECTED_3"
  echo "Получено:  $RESULT_3"
  exit 1
fi

echo "Все тесты успешно пройдены"

