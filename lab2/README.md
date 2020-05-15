# Лабораторная работа №2 #

## Описание ##

Это работа направлена на понимание как работать с дисками в ***UNIX*** системах, использовать *RAID* (технология виртуализации данных для объединения нескольких физических дисковых устройств в логический модуль для повышения отказоустойчивости и производительности), а также *LWM* (Менеджер логических томов).

[В первой части](#part1) нам предстоит разобраться *LVM* и *RAID*, во время установки *Debian* системы.

[Во второй части](#part2) мы проведем эмуляцию отказа работы одного из дисков

[В третьей части](#part3) мы добавим новый диск и перенесем раздел

<h2 id="part1">Часть 1</h2>

Изначально в работе я использую два виртуальных диска по 6.4 гб каждый.

![\images\1.1.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.1.png)

Во время установки дойдя до разметки дисков. Я создаю на каждом из виртуальных дисков таблицу разделов размером 512 мб, и точкой монтирования **/boot**.

![\images\1.2.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.2.png)

Поскольку одновременно использовать точкой монтирования **/boot** для двух дисков нельзя, для второго диска точкой монтирования я указал *None*. (~~на фото ошибка, позже я ее подправил…~~).  
В итоге получается такая картина:

![\images\1.3.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.3.png)

Затем переходим к настройке **RAID**.  
Я выбрал все свободное место на первом диске и настроил его в качестве типа раздела *physical volume for* ***RAID***. После чего проделал все то же самое для второго диска.  
В итоге я получил следующее:

![\images\1.4.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.4.png)

После я делал так:

* Configure software RAID
* Create MD device
* Software RAID device type (где выбрал *RAID1* - зеркальный дисковый массив)

![\images\1.5.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.5.png)

* Active devices for the RAID1 array (выбрал оба диска)

![\images\1.6.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.6.png)

* Spare devices (указал 0)

![\images\1.7.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.7.png)

* Active devices for the RAID1 array (выбрал разделы, которые я создавал под raid)

![\images\1.8.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.8.png)

В итоге у меня получилось следующее:

![\images\1.9.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.9.png)

На этом этапе c настройкой *RAID* я закончил и перешел к **LVM**.

При настройке я делал так:

* Configure the Logical Volume Manager
* Keep current partition layout and configure LVM: Yes
* Create volume group

![\images\1.10.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.10.png)

* Volume group name: system

![\images\1.11.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.11.png)

* Devices for the new volume group (здесь я выбрал RAID который создавал ранее)

![\images\1.12.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.12.png)

* Create logical volume
  * logical volume name: root
  * logical volume size: 2\5 от размера диска

![\images\1.13.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.13.png)

![\images\1.14.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.14.png)

* Проделал то же самое для var и log (1/5 размера диска)
* Display configuration details

После всего вышеперечисленного я получил это:

![\images\1.15.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.15.png)

Далее я разметил каждый созданный мною *LVM* том.

![\images\1.17.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.17.png)

И наконец закончил разметку.

![\images\1.18.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.18.png)

![\images\1.19.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.19.png)

![\images\1.20.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.20.png)

Теперь я запустил систему.  
Если вернуться к настройке *RAID*, то можно вспомнить что система не дала нам монтировать два диска к одному разделу. 
Поэтому сейчас я скопирую содержимое раздела */boot* с диска *sda1* на диск *sdb1*

![\images\1.21.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.21.png)

```bash
dd if=/dev/sda1 of=/dev/sd2
grub-install /dev/sdb
```

С помощью этих команд я скопировал содержимое раздела /boot с диска sd1 на диск sd2, а после выполнил установку ОС.
Благодаря этим действиям я обезопасил себя. Теперь если откажет первый диск, система все равно сможет запуститься.

Если я захочу посмотреть все диски в системе командой **fdisk -l**, то увижу следующее:

![\images\1.22.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.22.png)

Но более читаемый вид нам выдаст команда:

```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
```

![\images\1.23.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.23.png)

Если я захочу ознакомиться с информацией о текущем состоянии raid, то мне следует вывести содержимое /proc/mdstat:
```bash
cat /proc/mdstat
```

Вот еще несколько полезных команд 
* **pvs** - выводит информацию о физической памяти
* **lvs** - выводит информацию о Logical Volume
* **vgs** - выводит информацию о группе томов LVM

Благодаря проделанной работе я научился размечать диски, монтировать тома *LVM*, создавать *RAID*. 

<h2 id="part1">Часть 2</h2>

В этой части я эмулирую отказ диска, путем его удаления. Но так как у нас настроен RAID, наша система 
по прежнему будет работать.

Выведу на экран список дисков, что бы убедиться, что я удалил первый диск 

![\images\2.1.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.1.png)


А так же посмотрю состояние RAID

![\images\2.2.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.2.png)

Теперь нужно разобраться с данной проблемой. Для этого я создаю и подключаю к машине новый виртуальный диск **ssd3**.

![\images\2.3.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.3.png)

Перезапустил машину. И вывел список дисков, для того что бы убедиться что диск в системе.

![\images\2.4.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.4.png)
![\images\2.5.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.5.png)

Теперь я копирую таблицу разделов со старого диска на новый командой 

```bash
sfdisk -d /dev/sda | sfdisk /dev/sdb
```

А после добавляю в рейд массив новый диск командой

```bash
mdadm --manage /dev/md0 --add /dev/sdb2
``` 

Если посмотреть содержимое **/proc/mdstat** то можно заметить что синхранизация уже началась.
Теперь я вручную выполню синхранизация разделов 
```bash
dd if=/dev/sda of=/dev/sdb
``` 

![\images\2.6.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/2.6.png)

После всего проделанного можно сказать что проблема отказа диска была устранена. В этом задании я научился добавлять
новый диск в систему RAID, а так же синхронизировать его с дригими дисками.


<h2 id="part1">Часть 3</h2>

скоро появится