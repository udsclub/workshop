# UDSC workshop
## Инструкция по установке Docker-контейнера 
*(необходимое ПО)*

В воркшопе используется сборка библиотек Anaconda, тетрадки Jupyter, Xgboost, TensorFlow и некоторые другие библиотеки. Все это можно не устанавливать, а использовать Docker-контейнер (требования: около 4 Гб места на диске, 4 Гб RAM). [Введение](https://habrahabr.ru/post/310460/) в Docker. Рекомендуется тем, кто использует Windows, c \*NIX проще самостоятельно установить необходимое (см. Dockerfile). 

Инструкция:
- скачать данный репозиторий
- на Windows скорее всего придется [включить](http://www.sysprobs.com/disable-enable-virtualization-technology-bios) в BIOS виртуализацию, если раньше не использовали виртуальные машины или Docker
- установить [Docker](https://docs.docker.com/engine/installation/)
- установить [Docker Compose](https://docs.docker.com/compose/install/)
- перейти в командной строке/терминале в скачанный каталог workshop
- выполнить docker-compose up. Первый раз это займет продолжительное время
- открыть localhost:7777 (в файле *docker-compose.yml* можно поменять порт 7777 на любой другой)
- далее можно выполнить тетрадку [check_docker.ipynb](https://github.com/udsclub/workshop/blob/master/notebooks/check_docker.ipynb) и убедиться, что нужные библиотеки подключаются

Контейнеры Docker, как правило, занимают много места на диске.
- *docker ps* – посмотреть весь список контейнеров
- *docker stop $(docker ps -a -q)* – остановить все контейнеры
- *docker rm $(docker ps -a -q)* – удалить все контейнеры
- *docker images* - посмотреть весь список образов
- *docker rmi \<image_id\>* – удалить ненужный образ

Доступная и понятная [документация](https://docs.docker.com/engine/getstarted/) Docker с примерами

Установка на Windows 7
Установить Docker Toolbox (https://docs.docker.com/toolbox/toolbox_install_windows/)
Запустить Docker Quickstart Terminal. Если выдает ошибку, то нужно переустановить VirtualBox (http://download.virtualbox.org/virtualbox/5.1.20/VirtualBox-5.1.20-114628-Win.exe)
После установки еще раз запустить Docker Quickstart Terminal. При этом нужно разрешить запуск VIrtual Box и не выключать его.
После запуска  Docker Quickstart Terminal он выведет ваш IP который в дальнейшем нужно будет использовать для подключения к ноутбуку.
Например IP 192.168.99.100
Пишем в адресной строке браузера: 192.168.99.100:7777
Токен можно узнать из строки workshop   |    http://localhost:8888/?token=10b1f25765fa86cef44e23b5f28fe26a1b27627096969ad1
