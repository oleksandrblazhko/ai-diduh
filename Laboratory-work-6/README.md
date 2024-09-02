## Основи використання скриптової мови інтерпретатору оболонки командного рядку Unix-подібних ОС

<br>
<br>
<br>


### .1 Складна обробка текстового файлу утилітою AWK

<br>
<br>
<br>


2.1.1 Використовуючи утиліту AWK та відповідні команди одного командного рядку,
вивести на екран 5-тий стовпчик рядків файлу /etc/passwd, враховуючи наступні умови:
 обробляються номери рядків не більше значення вашого варіанту + 100;
 значення 1-го стовпчику починається з символу, який співпадає з 1-ю латинською
літерою вашого прізвища.

![2 1 1](https://github.com/user-attachments/assets/3c61cc18-e580-49ce-8586-b9a52f9c2a93)


2.1.2 Повторити рішення попереднього завдання, оформивши команди AWK в
окремому скрипт-файлі, який повинен мати права на виконання.

![2 1 2](https://github.com/user-attachments/assets/6b547082-1ca3-46a4-94a7-52c089692466)
<br>
![2 1 2-b](https://github.com/user-attachments/assets/143d65a7-e802-4a3c-9c25-c058cee9860c)

<br>
<br>
<br>


### 2 Робота з віртуальною файловою системою

<br>
<br>
<br>


2.2.1 Створити скрипт-файл на мові програмування Bash з назвою за шаблоном
Прізвище транслітерацією + OSParam, наприклад, BlazhkoOSParam.sh, який виводить на
екран лише окремі дані про параметри поточного стану ОС з віртуальної файлової системи
Procfs у відповідності із варіантом, представленим у стовпчику «Параметр пам`яті або
процесору» таблиці 3.
Під час виконання скрипт-файл повинен:
1) отримати назву параметру через параметр командному рядку, наприклад,
BlazhkoOSParam.sh par1, де par1 – назва параметру;
2) знайти значення параметру у відповідному за варіантом файлі;
3) вивести на екран значення параметру;
4) якщо параметр не знайдено, повідомити про помилку, наприклад: «параметр не
знайдено»;
5) якщо в командному рядку додається ще один параметр з назвою info,
наприклад, BlazhkoOSParam.sh par1 info,
тоді додатково вивести на екран опис призначення параметру українською мовою.

![2 2 1](https://github.com/user-attachments/assets/c4f419ca-ac8b-4a01-879f-6e5e0c6bc687)


2.2.2 Для перевірки правильності роботи скрипт-файлу необхідно його протестувати:
 з одним параметром;
 із двома параметрами.

![2 2 2](https://github.com/user-attachments/assets/4f4b4048-0827-4ca8-9003-e7413b2b7637)


<br>
<br>
<br>


### 3 Інтерактивне керування файлами

2.3.1 Створити скрипт-файл на мові програмування Bash, який виконує дії у
відповідності з варіантом, представленим у стовпчику «Назва скрипту-файлу» таблиці 3:
- ***my_create_empty_file*** – створити порожній файл (команда touch файл);
Для всіх варіантів передбачається наступний опис кроків алгоритму роботи програми:
1) запропонувати користувачу ввести назву об’єкту, використовуючи українське
запрошення;
2) перевірити у файловій підсистемі присутність об’єкту з такою назвою (для команд
видалення або зміни) або відсутність об’єкту з такою назвою (для команд створення),
використовуючи відповідні команди та файли;
3) якщо об’єкт відсутній (для команд видалення або зміни) або присутній (для команд
створення), тоді вивести на екран відповідне повідомлення про помилку та завершити роботу
програми;
4) якщо назва об’єкту не відповідає вказаному обмеженню, тоді вивести на екран
відповідне повідомлення про помилку та завершити роботу програми;
5) якщо назва об’єкту відповідає вказаному обмеженню (стовпчики «Обмеження на
довжину» та «Обмеження на зміст назви»), виконати відповідну команду.
У кроках алгоритму об’єктом може виступати звичаний файл, файл-зв’язок або каталог,
в залежності від варіанту завдання.
2.3.2 Для перевірки правильності роботи скрипт-файлу необхідно його протестувати:
 для команд видалення або зміни – попередньо створити об’єкт, виконати скриптфайл, а потім ще раз його виконати, щоб створити помилку;
 для команд створення – попередньо видалити об’єкт, виконати скрипт-файл, а потім
ще раз його виконати, щоб створти помилку.

![2 3 1](https://github.com/user-attachments/assets/91ef0887-4393-4b1c-9884-45b3531217f2)
<br>
![2 3 1a](https://github.com/user-attachments/assets/a69fe351-f2a4-46c1-98d3-a33eacc61c2f)
<br>
![2 3 1b](https://github.com/user-attachments/assets/a1f69adf-6843-48a3-9775-4d2d255ad92c)


<br>
<br>
<br>