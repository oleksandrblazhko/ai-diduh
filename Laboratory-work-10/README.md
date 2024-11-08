### 2.1 Теоретичне завдання зі створення історій виконання транзакцій

2.1.1 Історія квазіпаралельного успішного виконання транзакцій для протоколу 1-го ступеня блокування.
</br></br>
T1= R[A] R[B] W[A] C1</br>
T2= W[D] R[B] W[B] C2</br>
T3= R[D] W[D] C3</br>
</br></br>
**H(T1,T2,T3)=r1[A] r1[B] X1[A] w1[A] C1 r2[B] X1[B] w2[B] C2 r3[D] X2[D] w3[D] C3**

</br></br>

Таблиця блокувань:

| Назва         | Встановлені блокування        |          Запити на блокування |
|---------------|-------------------------------|-------------------------------|
| A             | X1                            |                               |
| B             | X1                            | X2                            |
| D             |                               |                               |



Опис таблиці блокування транзакцій до моменту першої фіксації змін однієї з транзакцій у вигляді масиву на мові програмування С:

```
char* lock_table[][3] = {
    { "A", "X1", "" },
    { "B", "X1", "X2" },
    { "D", "", "" }
};
```
</br></br>

2.1.2 Визначення Deadlock та граф очікування.
</br></br>
*(створимо граф очікування транзакцій)*
</br></br>
Граф очікування:</br>
T1 блокує [A] і [B]</br>
T2 блокує [D] і запитує [B], чекає звільнення [B] від T1</br>
T3 запитує [D] та чекає звільнення [D] від T2</br>
(Цикл: T1 → T2 → T3 → T1)
</br></br>

Масив для графа очікування у вигляді на мові С:

```
char* wait_graph[][2] = {
    { "T2", "T1" }, // T2 чекає T1
    { "T3", "T2" }, // T3 чекає T2
    { "T1", "T3" }  // T1 чекає T3
};
```
</br></br>
#### Висновок:
Граф очікування має цикл - наявність стану **Deadlock**. 

</br></br>

2.1.3 Історія квазіпаралельного успішного виконання транзакцій для протоколу 2-го ступеня блокування.
</br></br>
**H(T1,T2,T3)=r1[A] r1[B] X1[A] w1[A] X2[D] w2[D] X3[D]–Wait w1[B] C1 U1 X2[B] w2[B] C2 U2 X3[D] w3[D] C3 U3**
</br></br>
Таблиця блокувань:

| Назва         | Встановлені блокування        |          Запити на блокування |
|---------------|-------------------------------|-------------------------------|
| A             | X1                            |                               |
| B             | X1                            | X2                            |
| D             | X2                            | X3                            |
</br></br>
```
char* lock_table_2PL[][3] = {
    { "A", "X1", "" },   // A заблокована T1
    { "B", "X1", "X2" }, // B заблокована T1, запитано блокування від T2
    { "D", "X2", "X3" }  // D заблокована T2, запитано блокування від T3
};
```
</br></br>

2.1.4: Граф очікування
</br></br>
Масив для графа очікування транзакцій:

```
char* wait_graph[][2] = {
    { "T3", "T2" }  // T3 чекає на T2, !!! Deadlock не виникає
};
```
</br></br>
У цьому випадку є тільки один елемент очікування: T3 чекає на T2, але після фіксації T2 звільняє блокування [D], і T3 може завершити свою роботу без Deadlock.
</br></br>
#### Висновок:
Для протоколу 2-го ступеня блокування стану Deadlock - немає.</br></br>
</br></br></br></br>

### 2.2 Налаштування бази даних
</br></br>
![2 2 1](https://github.com/user-attachments/assets/67f17ff4-a2e5-4009-9ca7-f5fb731dbc7e)
</br></br>
![2 2 2](https://github.com/user-attachments/assets/a95e0c51-95ad-43eb-9808-2bc255d9f8f3)
</br></br>
![2 2 3](https://github.com/user-attachments/assets/603a3766-61eb-438c-be44-4089b772a7c9)

</br></br>

2.2.3 -2.2.6 Створення SQL запита:

```
-- 2.2.3: Створення таблиці person
CREATE TABLE person (
    p_id INTEGER,
    name CHAR(20),
    bd DATE
);

-- 2.2.4: Додавання рядка
INSERT INTO person VALUES
(1, 'Jobs', '2000-04-01');

-- 2.2.5: Додавання рядка з транслітерацією мого прізвища Didukh
INSERT INTO person VALUES
(2, 'Didukh', '2024-10-27');

-- 2.2.6: Перегляд змісту таблиці person
SELECT * FROM person;
```
![2 2 4-6](https://github.com/user-attachments/assets/f1bced40-fd30-4131-98d8-c0cd3b8746c1)

</br></br></br></br>

### 2.3 Керування квазіпаралельним виконанням транзакцій з використанням команд блокування
</br></br>
2.3.1 Створення SQL-файлу для транзакцій з 1-м ступенем блокування:
</br></br>
![2 3 1](https://github.com/user-attachments/assets/4e45eead-f073-4f92-92b8-8b66e0f80d6b)
</br></br>
```
BEGIN;

-- Операція блокування
LOCK TABLE person IN EXCLUSIVE MODE;

-- Операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція зміни значення
UPDATE person SET name = 'Steve' WHERE p_id = 1;

-- Повторна операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція фіксації
COMMIT;

-- Транзакція №2
BEGIN;

-- Операція блокування
LOCK TABLE person IN EXCLUSIVE MODE;

-- Операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція зміни значення
UPDATE person SET name = 'Bill' WHERE p_id = 1;

-- Повторна операція читання
SELECT * FROM person WHERE p_id = 1;

-- Операція фіксації
COMMIT;
```
</br></br>
2.3.3 - 2.3.6 Виконання транзакцій у псевдотерміналах:

![2 3 3](https://github.com/user-attachments/assets/b7de50a1-8476-4f82-81bd-9c722248c0ac)
</br></br>
![2 3 4a](https://github.com/user-attachments/assets/6c295a16-036e-414b-a0d2-14b683754c86)
</br></br>
![2 3 4](https://github.com/user-attachments/assets/497affe4-d706-4ab1-9119-28e35746abf9)
</br></br>
![2 3 5a](https://github.com/user-attachments/assets/328b41a4-a695-49d0-8ffa-ac04a31c0028)
</br></br>
![2 3 6](https://github.com/user-attachments/assets/798d4e45-aa8a-4932-bcaf-4ebc52871741)
</br></br></br></br>

### 2.4 Керування квазіпаралельним виконанням транзакцій при наявності Deadlock-станів.
</br></br>
2.4.1 Створення файлу
</br>
![2 4 1](https://github.com/user-attachments/assets/c33eb004-b7f7-46ad-b147-547f31e77c01)
</br></br>
2.4.2 Виконати модифіковані транзакції
</br></br>
![2 4 2](https://github.com/user-attachments/assets/6441d8e3-835f-4a77-9dfc-4409dd41ffae)

</br></br></br></br>






