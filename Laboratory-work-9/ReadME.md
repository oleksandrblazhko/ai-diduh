## Основи програмного керування процесами в Unix-подібних ОС

### 2.1. Перегляд інформації про процес

2.1.1. Створення C-програми з назвою didukh_process_info.c яка виводить на екран таку інформацію: 
- ідентифікатор групи процесів, до якої належить процес;
- ідентифікатор процесу, що викликав цю функцію;
- ідентифікатор parent-процесу;
- ідентифікатор користувача процесу, який викликав цю функцію;
- ідентифікатор групи користувача процесу, який викликав цю функцію.
- 
![2 1 1](https://github.com/user-attachments/assets/6314803b-13a6-44af-8aad-206ce785c7f8)

![2 1 1-b](https://github.com/user-attachments/assets/195f78c9-62fb-4b55-9937-167bd3c1a2a3)

![2 1 1-c](https://github.com/user-attachments/assets/22287245-b7d0-46f6-a282-2e961be16cc5)

![2 1 1-x](https://github.com/user-attachments/assets/a688be36-dbe8-4d02-a89c-0e27b9273673)

2.1.2. Запуск дві копії програми у двох режимах:
- паралельне виконання двох процесів;
- конвеєрне виконання двох процесів.

  ![2 1 2](https://github.com/user-attachments/assets/58432e98-e658-489b-9be2-6e1461769512)

***Висновок:***
*У паралельному режимі обидві копії програми мають різні ідентифікатори груп процесів (кожна запускається в своєму процесі)
У конвеєрному режимі обидві програми мають однаковий ідентифікатор групи процесів (вони є дочірніми процесами одного й того ж процесу)*


### 2.2. Створення child-процесу

2.2.1. Створення C-програми, яка породжує процес та замінює образ процесу на команду ls -l -a :

![2 2 1](https://github.com/user-attachments/assets/bc343274-8b55-4bee-a532-26de43b76b88)

![2 2 1b](https://github.com/user-attachments/assets/55c24aec-8ac0-479a-89ce-136d6fefeec3)

2.2.2. Компіляція та перевірка програми:

![2 2 2](https://github.com/user-attachments/assets/a52bbb9e-a75e-43be-82f2-dd0d55a7a135)

### 2.3. Обмін сигналами між процесами

2.3.1. Створення C-програми, в якій процес очікує отримання сигналу SIGUSR2:

![2 3 1-get](https://github.com/user-attachments/assets/6bd15a64-b29f-482b-804e-e1d4db100e23)

2.3.2. Компіляція та запуск програми:

![2 3 2](https://github.com/user-attachments/assets/01a90952-6eb0-4e26-b758-8f8cd48210a3)

2.3.3. Створення C-програми, яка надсилає сигнал SIGUSR2 процесу:

![2 3 3](https://github.com/user-attachments/assets/1a068a56-77fc-420f-8b4d-cedc7f97c19e)

2.3.4. Компіляцію та запуск другої створеної С-програми та запуск її в іншому псевдотерміналі:

![2 3 4](https://github.com/user-attachments/assets/68815810-406a-47ee-8e0e-ec3cca985946)

### 2.4. Створення процесу-сироти
2.4.1. Створення C-програми з назвою «didukh_orphan»:

![2 4 1](https://github.com/user-attachments/assets/84affa5e-1398-4a1d-8dee-8bea9cd191ca)

2.4.2. Компіляція програми: 

![2 4 2a](https://github.com/user-attachments/assets/81635a82-70ea-4cd9-a58a-6909b178d79a)

![2 4 2](https://github.com/user-attachments/assets/b5d2192c-cb91-4013-bef8-10fb141c74a7)

### 2.5. Створення zombie-процесу

2.5.1.  Створення C-програми з назвою «didukh_zombie.c»:

![2 5 1](https://github.com/user-attachments/assets/7e932877-733c-4e12-88f3-8fd28225bd0b)

2.5.2. Компіляція та запуск:

![2 5 2](https://github.com/user-attachments/assets/1e7abefc-5801-42d3-84b7-3c670a4a4011)

![2 5 3](https://github.com/user-attachments/assets/351ed899-2354-4801-9021-5f87ff133e4c)


### 2.6. Попередження створення zombie-процесу

2.6.1. Створення C-програми з назвою «didukh_zombie_stop.c»:

![2 6 1](https://github.com/user-attachments/assets/df5fc375-15a1-48f8-be55-7df0ee01d2c0)

2.6.2. Компіляція та запуск:

![2 6 2](https://github.com/user-attachments/assets/322e173c-9ef4-4c1e-853d-6c2f2bed1561)

![2 6 3](https://github.com/user-attachments/assets/2273a7d2-65e3-4e52-a905-109de2da114d)

![2 6 3a](https://github.com/user-attachments/assets/14b1ca45-6d6c-462d-8a1d-cb008f485b27)


____________________________________________








