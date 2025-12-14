# Практична робота 15

- Bash Functions

[docs](https://www.w3schools.com/bash/bash_functions.php)

[docs with examples](https://rtfm.co.ua/en/bash-using-functions-with-examples/)

## Завдання:

### 1 Створити скрипт `funcs.sh`, який містить 3 функції:
- `hello()`  виводить привітання
- `today()`  виводить поточну дату
- `user()`  виводить ім’я користувача

Після оголошення викликати всі три функції по черзі.

`funcs.sh`
```bash
hello() {
    echo "Привіт!"
}

today() {
    date
}

user() {
    echo "Користувач: $USER"
}

hello
today
user
```

---

### 2 Створити скрипт `filesize.sh`, який:
- приймає ім’я файлу як аргумент
- має функцію `check_file()`, яка перевіряє, чи файл існує
- має функцію size(), яка виводить розмір файлу
- у разі відсутності файлу виводить повідомлення і завершує скрипт

`filesize.sh`
```bash
check_file() {
    if [ ! -f "$1" ]; then
        echo "Файл не існує"
        exit 1
    fi
}

size() {
    du -h "$1" | cut -f1
}

check_file "$1"
echo "Розмір файлу: $(size "$1")"
```

---

### 3 Створити скрипт `countwords.sh`, який:
- має функцію `readfile()`, що читає файл пострічково
- рахує кількість слів у файлі
- виводить загальний підсумок

`countwords.sh`
```bash
readfile() {
    total=0
    while read line; do
        words=$(echo "$line" | wc -w)
        total=$((total + words))
    done < "$1"

    echo "Всього слів: $total"
}

readfile "$1"
```

---

### 4 Створити скрипт `search.sh` - мініаналог `grep`:
- функція `search_word()` приймає слово і файл
- шукає слово
- виводить усі рядки, де воно зустрічається

`search.sh`
```bash
search_word() {
    grep "$1" "$2"
}

search_word "$1" "$2"
```

---

### 5 Створити скрипт `multilog.sh`:
- функція `save_log()` створює файл з логом у форматі `log_YYYYMMDD.txt`
- функція `write_log()` записує передане повідомлення у кінець логу
- функція `show_log()` відображає лог
- наприкінці скрипт повинен записати 3 повідомлення і показати лог

`multilog.sh`
```bash
save_log() {
    logfile="log_$(date +%Y%m%d).txt"
    touch "$logfile"
}

write_log() {
    echo "$1" >> "$logfile"
}

show_log() {
    cat "$logfile"
}

save_log
write_log "Перше повідомлення"
write_log "Друге повідомлення"
write_log "Третє повідомлення"
show_log
```

---

### 6 Створити скрипт `backupdir.sh`, який:
- приймає назву каталогу
- функція `backup()` створює архів `backup.tar.gz`
- функція `check_dir()` перевіряє, чи каталог існує
- якщо існує - запускається `backup()`
- якщо ні - показує повідомлення

`backupdir.sh`
```bash
check_dir() {
    if [ ! -d "$1" ]; then
        echo "Каталог не існує"
        exit 1
    fi
}

backup() {
    tar -czf backup.tar.gz "$1"
    echo "Архів створено: backup.tar.gz"
}

check_dir "$1"
backup "$1"
```

[Демонстрація](https://youtu.be/62bZBdThgsc)

---

## Висновок:

funcs.sh filesize.sh countwords.sh search.sh multilog.sh backupdir.sh