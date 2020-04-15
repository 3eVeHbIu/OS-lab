# Лабораторная работа №2 #

## Описание ##

Это работа направлена на понимание как работать с дисками в ***UNIX*** системах, использовать *RAID* (технология виртуализации данных для объединения нескольких физических дисковых устройств в логический модуль для повышения отказоустойчивости и производительности), а также *LWM* (Менеджер логических томов).

[В первой части](#1part) нам предстоит разобраться *LVM* и *RAID*, во время установки *Debian* системы.

[Во второй…](#2part)

[В третьей…](#3part)

<h2 id='part1'>Часть 1</h2>

Изначально в работе я использую два виртуальных диска по 6.4 гб каждый.

![\images\1.1.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.1.png)

Во время установки дойдя до разметки дисков. Я создаю на каждом из виртуальных дисков таблицу разделов размером 512 мб, и точкой монтирования **/boot**.

![\images\1.2.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.2.png)

Поскольку одновременно использовать точкой монтирования **/boot** для двух дисков нельзя, для второго диска точкой монтирования необходимо указать *None*. (~~на фото ошибка, позже я ее подправил…~~).

В итоге получается такая картина.

![\images\1.3.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.3.png)

Затем переходим к настройке **RAID**.

Я выбрал все свободное место на первом диске и настроил его в качестве типа раздела *physical volume for* ***RAID***. После чего проделал все то же самое для второго диска. В итоге я получил следующее.

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

![\images\1.13.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.13.png)

    * logical volume name: root
    * logical volume size: 2\5 от размера диска

![\images\1.14.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.14.png)

* Проделал то же самое для var и log (1/5 размера диска)
* Display configuration details

После всего вышеперечисленного я получил это

![\images\1.15.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.15.png)

Далее я разметил каждый созданный мною *LVM* том.

![\images\1.17.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.17.png)

И наконец закончил разметку

![\images\1.18.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.18.png)

![\images\1.19.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.19.png)

![\images\1.20.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.20.png)

Теперь я запустил систему.
Если вернуться к настройке *RAID*, то можно вспомнить что система не дала нам монтировать два диска к одному разделу. Поэтому сейчас я скопирую содержимое раздела */boot* с диска *sda1* на диск *sdb1*

![\images\1.21.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.21.png)

Если я захочу посмотреть все диски в системе командой **fdisk -l**, то увижу следующее

![\images\1.22.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.22.png)

```bash
lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
```

![\images\1.23.png](https://raw.githubusercontent.com/sergo2048/OS-lab/master/lab2/images/1.23.png)
