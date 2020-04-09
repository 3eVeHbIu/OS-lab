# Лабораторная работа №1 #

Здесь вы сможете найти ~~снимки экрана~~ *скриншоты*, с решенными уровнями [SuzenEscape](https://github.com/bykvaadm/SuzenEscape). Я, в свою очередь,*постараюсь* объснить, как я сделал то или иное задание.

---

|chain1             |chain6             |chain7             |chain8             |chain11            |chain14            |
|-------------------|:-----------------:|------------------:|------------------:|------------------:|------------------:|
|[suzen1](#suzen1)  |[suzen14](#suzen14)|[suzen19][suzen19] |suzen25            |                   |                   |
|[suzen2](#suzen2)  |[suzen15](#suzen15)|[suzen20][suzen20] |suzen26            |                   |                   |
|[suzen3](#suzen3)  |[suzen16](#suzen16)|[suzen21][suzen21] |suzen25            |                   |                   |

---

Если вам интересны именно ***скрипты*** то их стоит искать [здесь](https://github.com/sergo2048/OS-lab/tree/master/lab3)

<h2 id='suzen1'> suzen1 </h2>

![/images/1.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/1.png)

Здесь все просто. Первое что мы делаем, это проверяем что лежит в текущей директории. Для этого мы используем команду **ls** (она выводит на экран имена файлов лежащих в данной директории ~~только если они не являются скрытыми~~). Видим что здесь имеется файл ***diary.txt***. Выводим его содаржимое на экран терминала при помощи команды **cat** и *вуаля*, ***флаг*** у нас в кармане.

## suzen2 (#suzen2) ##

Здесь все немного сложнее. Если мы будем использовать **ls** то увидим кучу странных файлов, и перебирать их вручную в поисках флага... Нууу такое себе... Открыв пару файлов, я заметил что их содержимое находится в неподдерживаемой терминалом кодировке. Поэтому мне пришло в голову использовать команду **awk** или **egrep** для поиску по паттерну. Но так как эти команды недоступны в этом уровне. Я решил просто *тупо* вывести содержимое файлов.
> "Тогда уж точно флаг не ускользнет."
Но сделал я это не вручную а при помощи цикла **for** в ***bash***. И если посмотреть повнимательнее, несложно найти флаг. Который все это время лежал в файле **:~/**.

![/images/2.1.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/2.1.png)
![/images/2.1.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/2.2.png)

## [suzen3](#suzen3) ##

Для решения этого уровня необхдимо прочитать файл построчно при помощи **bash**. Для этого отпровлям файл на *stdin*, и пока мы можем прочитать сторку, мы воводим ее на экран терминала.
Так можно увидеть содержимое файла используя только **bash** и ничего более.

![/images/3.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/3.png)

## suzen14 ##

В этом уровне нам достаточно адекватно использовать команды **cd** и **ls**, для того что бы найти то что мы ищем.

![/images/14.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/14.png)

## suzen15 ##

![/images/15.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/15.png)

## suzen16 ##

![/images/16.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/16.png)

## suzen17 ##

![/images/17.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/17.png)

## suzen18 ##

![/images/18.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/18.png)

## suzen19 ##

![/images/19.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/19.png)

## suzen20 ##

![/images/20.png](https://github.com/sergo2048/OS-lab/blob/master/lab1/images/20.png)
