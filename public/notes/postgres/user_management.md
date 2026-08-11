# How reset a user password

- Backup

```bash
cp pg_hba.conf pg_hba.conf-backup
```

- Replace security

```txt
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
local   replication     all                                     trust
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
```

- Alter the password

```sql
ALTER USER my_user_name with password 'my_secure_password';
```


- List all users

```sql
\du
\du+ //Add description
```

- Connect to a database

```sql
psql -U bilal -d postgres
```

- To create a new user

```sql
CREATE USER user_name WITH PASSWORD 'password';
```

- Grant all priviledges

```sql
GRANT ALL PRIVILEGES ON DATABASE your_database_name TO bilal;
```

- Grant all priviledges on public schema of a database

```sql
\c databasename
grant all on schema public to bilal;
```
