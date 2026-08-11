__To list all tables__

```sql
\d
```
__To see the schema of a given table__
```sql
\d <table_name>
```

__Adding a new column to a table__
```sql
ALTER TABLE users
  ADD COLUMN role role NOT NULL DEFAULT 'user';
```

__Removing  new column to a table__
```sql
ALTER TABLE users
  DROP COLUMN columnName;
```

__Inserting a new record into the table__
```sql
INSERT INTO recyclables (name, icon, price, weight_classification) 
VALUES (
  'aluminium', 
  'https://res.cloudinary.com/dxv10krxo/image/upload/v1772807670/aluminium_k3msbg.png', 
  1000, 
  'kg'
);
```

__Delete a record from a table__
```sql
DELETE FROM users WHERE id = 8;
```

__Update a record in a table__

```sql
UPDATE users SET wallet_balance = 1000000 WHERE account_type = 'agent';
```

__CHANGING A COLUMN TYPE__

```sql
BEGIN

ALTER TABLE users 
ALTER COLUMN name TYPE varchar

END
```

__HOW TO RENAME A COLUMN__

```sql
ALTER TABLE table_name 
RENAME COLUMN old_column_name TO new_column_name;
```

__REMOVING A DEFALT FROM AN EXISTING COLUMN__

```sql
ALTER TABLE wallet_transactions 
    ALTER COLUMN child_type DROP DEFAULT;
```

__MAKING A COLUMN UNIQUE__

```sql
ALTER TABLE your_table_name
ADD CONSTRAINT constraint_name UNIQUE (your_column_name);
```

## LOCATION TYPES

You don't store "Lat" and "Lng" as two separate numbers. 
Instead, you store them in a single column of type GEOGRAPHY(Point, 4326).

```sql
CREATE EXTENSION IF NOT EXISTS postgis;
```

```sql
ALTER TABLE users 
ADD COLUMN location GEOGRAPHY(Point, 4326);
```
__NOTE__: 4326 is the standard spatial ID (SRID) for GPS coordinates (WGS 84).

__Inserting data__

When saving a user's location, you use a helper function. 
Crucial: PostGIS uses (Longitude, Latitude) order.

```sql
UPDATE users 
SET location = ST_SetSRID(ST_MakePoint(6.3350, 5.6013), 4326) 
WHERE id = 'user_123';
```

__The "Find Users within 2km" Query__

```sql
SELECT id, name, ST_Distance(location, 'SRID=4326;POINT(6.339 5.608)'::geography) as distance_meters
FROM users
WHERE ST_DWithin(
    location, 
    'SRID=4326;POINT(6.339 5.608)'::geography, 
    2000 -- Distance in meters (2km)
);
```

__Indexing for Speed__

```sql
CREATE INDEX users_location_idx ON users USING GIST (location);
```
## ENUM TYPES

__View all enums in publc shema__

```sql
SELECT
    t.typname AS enum_name,
    e.enumlabel AS enum_value
FROM pg_type t
JOIN pg_enum e ON t.oid = e.enumtypid
JOIN pg_namespace n ON n.oid = t.typnamespace
WHERE n.nspname = 'public'
ORDER BY t.typname, e.enumsortorder;
```


## Enums

__CREATING AN ENUM__

```sql
CREATE TYPE transaction_status AS ENUM (
  'pending',
  'paid',
  'failed',
  'admin_cancelled',
  'success',
  'reversed',
  'cancelled',
  'abandoned',
  'processing',
  'queued',
  'ongoing',
  'collected'
);
```

__CHANING AN EXISTING COLUMN TO MATCH A NEW TYPE__

```sql
BEGIN;

-- 1. Drop the existing default constraint
ALTER TABLE wallet_transactions ALTER COLUMN status DROP DEFAULT;

-- 2. Change the column type
ALTER TABLE wallet_transactions 
ALTER COLUMN status TYPE transaction_status 
USING status::text::transaction_status;

-- 3. Re-create the default constraint with the new type
-- (Replace 'pending' with whatever your previous default value was)
ALTER TABLE wallet_transactions ALTER COLUMN status SET DEFAULT 'pending'::transaction_status;

COMMIT;
```
__DELETING AN ENUM__

```sql
BEGIN; DROP TYPE IF EXISTS recycle_transaction_status_enum; COMMIT;
```

__ALTERING A TABLE TO NOT NULL FROM NULL__

```sql
UPDATE users SET device_id = 'DEFAULT_ID' WHERE device_id IS NULL;
```

```sql
ALTER TABLE users ALTER COLUMN device_id SET NOT NULL;
```

__REVERTING TO NULL__

```sql
ALTER TABLE users 
ALTER COLUMN device_id DROP NOT NULL;
```