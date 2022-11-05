## Demo Backend REST API service



Create env settings:

```bash

#keycloack setting:

KEYCLOAK_REALM_PUBLIC_KEY=<keycloak valid key 
KEYCLOAK_USER_PROVIDER_CREDENTIAL=name
KEYCLOAK_ALLOWED_RESOURCES="account"
KEYCLOAK_LOAD_USER_FROM_DATABASE=true


```


set database env varible:

```bash

DB_CONNECTION=pgsql
DB_HOST=backend_db
DB_PORT=5432
DB_DATABASE=test
DB_USERNAME=test
DB_PASSWORD=test

```

filling fake data database:


```bash

php artisan migrate && php artisan db:seed --class="TestUser"

```

### Test rest api


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





