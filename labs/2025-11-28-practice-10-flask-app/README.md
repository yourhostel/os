# Практична робота 10

---

## Мета: 
- Налаштування середовища та створення базового програмного забезпечення

1) Встановити віртуальну машину
2) Встановити пакети 

```bash
sudo apt install  git python3-pip python3.13-venv nano
```

3) Створити робочу директорію

```bash
mkdir python-app
cd python-app/
```

4) Створити віртуальне середовище

```bash
python3 -m venv .env
source .env/bin/activate
```

5) Встановити `flask` та `shortuuid`

```bash
pip install flask shortuuid
```

6) Створити файл `main.py` та вписати наступний код

```python
from flask import Flask
import shortuuid

app = Flask(__name__)

@app.route("/")
def hello_world():
    short_id = shortuuid.uuid()
    return short_id

if __name__ == '__main__':
  app.run(host='0.0.0.0')
```

7) Встановити докер за [інструкцією](https://docs.docker.com/engine/install/)

```bash
# Офіційний інстал-скрипт
curl -fsSL https://get.docker.com | sudo sh
# Додати себе в групу docker
sudo usermod -aG docker $USER
```

8) Створити файл залежностей для аплікації

```bash
pip freeze > packages.txt
```

9) Написати `Dockerfile` для аплікації та зібрати імейдж

```bash
docker build -t small-app -f Dockerfile .
```

10) Перевірити роботу за допогою команди

```bash
docker run -it -p 5000:5000 --rm small-app
```

11) Відкрити посилання за адресою віартуальної машини та порта 5000

12) Докерфайл прикрипити в документі до завдання

---

## Виконання:

[video](https://youtu.be/Ym77ec_QGbQ)