## Простой контур авторизации c простым php бэкендом


Архитектурный пример демонстриет подключения бэкенд php приложения к серверу авторизации [keycloack](https://www.keycloak.org/),
по протоколу [openidconnect](https://openid.net/connect/). В качестве web приложения в данный момент выступает, дефолтная встроенная тема сервера авторизации keycloack(в данный момент не реализовал клиента). Для подключения к серверу авторизации php-backend'а использовал [пакет Simple Keycloak Guard for Laravel / Lumen](https://github.com/robsontenorio/laravel-keycloak-guard).



## Первоначальная настройка


1. В /etc/hosts установите хост имя - my-contur.test или установите свое на свой вкус. 


2. Выполените в каталоге:

```bash

 docker-compose up -d

```


3. В адимнистративной панели сервера авторизации - http://<your_host_name>/auth/admin, перейдите в настройку области и скопируйте public key для этого необходимо: 

```bash

"Realm Settings" > "Keys" > "Algorithm RS256" Line > "Public Key" Button

```

4. В административной панеле сервера авторизации создайте тестовую учетную запись - users -> create user с следующими параметрами:

- email: test01@mail.com
- username: test01


5. Настройте бэкенд приложение:


```bash

docker-compose exec api_backend bash


composer install 


cp .env_example .env 


php artisan key:generate


#установите настройки подключение к базе данных:

DB_CONNECTION=pgsql
DB_HOST=backend_db
DB_PORT=5432
DB_DATABASE=test
DB_USERNAME=test
DB_PASSWORD=test



# установите переменные окружения для работы с сервером авторизации:


KEYCLOAK_REALM_PUBLIC_KEY="всавь сюда публичный ключ сервера авторизации скопированный на шаге 3. "
KEYCLOAK_USER_PROVIDER_CREDENTIAL="name" # идентификатор по которому будет происходить поиск учетных записей в бэкенде
KEYCLOAK_ALLOWED_RESOURCES="account" #имя клиента для бэкенд приложения.
KEYCLOAK_LOAD_USER_FROM_DATABASE=true ## включить поиск учетных запиисей в бэкенде


# сбросить конфиг кэша бэкенд приложения:

php artisan config:clear


php artisan migrate && php artisan db:seed --class="TestUser"


```


## Как тестировать


Войдите в панель управления сервером авторизации и перейдите в users, затем выбирите учетную запись в и выберите имперсонализировать учетную запись. Откроется панель управления учетной записи в бразере выберите Networks, затем 
в одном из маршрутов в ответе скопируйте токен доступа - access_token. 


```bash

curl --location --request GET 'http://my-contur.test/api_backend/api/test-auth' \
--header 'Authorization: Bearer <keycloack auth server jwt token>'


```

json response:


```bash

{
    "data": {
        "id": 1,
        "email": "test01@mail.com",
        "name": "test01"
    }
}

```
 


## Todo:

- Реализовать простое frontend приложение, которые демонструет взаимодействие с бэкендом.
- Дорабоать тему регистрацию и редактирование данных профиля в keyclok auth.
- Разработать синхронизацию учетных записей с базорй бэкендом на основе событийной модели.
- Решить проблему с импортом realm при первом развертывании сервера авторизации.
- Установить настройки по умолчанию для backend приложения.  