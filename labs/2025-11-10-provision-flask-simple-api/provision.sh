#!/usr/bin/env bash
# ============================================
# Provision script: автоматичне розгортання Flask-додатку
# ============================================

# Увімкнути режим: зупиняти виконання при будь-якій помилці (e) і логувати команди (x)
set -eux

# Оновлення пакетів
apt-get update -y

# Встановлення python3, pip, venv, git(не обов'язково), nano
apt-get install -y python3 python3-pip python3-venv git nano

# Створюємо директорію для Flask-додатку
mkdir -p /home/vagrant/python-app
cd /home/vagrant/python-app

# Створюємо ізольоване Python-середовище
python3 -m venv .env
# Активуємо середовище (тимчасово, лише в межах цього скрипту)
source .env/bin/activate
# Встановлюємо залежності для додатку
pip install flask shortuuid

# Копіюємо main.py з синхронізованої директорії /vagrant
# (там, де лежить Vagrantfile на хості)
cp /vagrant/main.py /home/vagrant/python-app/main.py

# Запускаємо Flask-додаток у фоні через nohup, щоб він не зупинився після завершення provision
# Вивід логів перенаправляємо у /home/vagrant/flask.log
nohup /home/vagrant/python-app/.env/bin/python /home/vagrant/python-app/main.py > /home/vagrant/flask.log 2>&1 &