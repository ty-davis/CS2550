# Module 5 Notes

INSERT, UPDATE, DELETE statements

## INSERT

Used to put new data into a table.

```SQL
INSERT INTO TableName (Col1, Col2, Col3)
VALUES (Val1, Val2, Val3);
```

- `INTO` is optional
- Values have to match order
- Can leave out some columns that are allowed to be null
- Don't have to specify columns if you just use all of the columns from the Table definition

## UPDATE

Used to update data currently in the table (update one or more rows)

```SQL
UPDATE TableName
SET Col1 = Val1, Col2 = Val2, ...
WHERE Condition;
```

MySQL by default uses **Safe Updates** to prevent UPDATEs
and DELETE without any conditions or when you don't
update based on the key columns


## ROLLBACK and COMMIT

These are parts of transactions which are a way for use to make a large
group of changes at once when data would be incomplete if only part of
the transaction was successful.

MySQL has **@@autocommit** that we can use.

```SQL
ROLLBACK;
```

Use that to undo changes before they are committed.

## DELETE

Referential Integrity is the idea that Foreign Keys
need to point to existing information. If a Foreign
Key points to a row in another table that gets deleted,
then that would leave a Foreign Key pointing to information
that doesn't exist.

The four ways referential integrity errors occur:
- Primary key is deleted
- Foreign key is inserted
- Primary key is updated
- Foreign key is updated

```SQL
ON DELETE RESTRICT -- don't let the PK row get deleted
ON DELETE CASCADE  -- delete this row when PK row is deleted
ON DELETE SET NULL -- set this column to NULL when PK row is deleted
```

