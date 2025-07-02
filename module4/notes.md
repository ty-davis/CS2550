# Module 4 notes - Ty Davis

## Notes from videos

```SQL
SELECT * FROM tablename;

SELECT col1, col2 FROM tablename;
```

Get rid of duplicates, put DISTINCT after SELECT:
```SQL
SELECT DISTINCT City FROM Users;
```

Change the order that the SELECT query is returned.
Multiple columns means sort by one column, then sort
by other column:

```SQL
SELECT * FROM tablename
ORDER BY col1 DESC, col2;
```

You can limit the number of results
```SQL
SELECT * FROM tablename LIMIT 1000;
```

Use WHERE clause to filter the results:

```SQL
SELECT * FROM tablename
WHERE col1 = 'hi';
```

Combine WHERE clause statements:

```SQL
SELECT * FROM tablename
WHERE col1 = 'hi' OR col2 > 100;
```

```SQL
Filter based on whether value is in list:
SELECT * FROM Users
WHERE City IN ('Ogden', 'Logan');
```

Match multiple strings with wildcards: % means any number
of wild letters, _ means just one placeholder letter

```SQL
SELECT * FROM tablename WHERE col1 LIKE "A%"; -- matches where col1 starts with "A";
```

Force case matching by using `LIKE BINARY`


### Functions in SQL

See tables from the Zybooks notes to see better lists of all of the functions.

Examples:

```SQL
SELECT min_salary, max_salary, sqrt(min_salary * max_salary) FROM tablename;
```

```SQL
SELECT concat(last_name, ', ', first_name) as full_name FROM employees; -- use alias with 'as'
```

```SQL
SELECT first_name, replace(first_name, 'y', 'k') FROM employees; -- changes y to k in the first_name
```


## Notes from Zybooks

Boolean/Arithmetic operators and things:
![Boolean/Arithmetic operators](./imgs/operators.png)

Operators on the same level go left to right in evaluation, otherwise it is
top to bottom.
![Operator Precedence](./imgs/operator_precedence.png)

NULL values operate with boolean operators in the following way:

![NULL and operations](./imgs/null_truth_tables.png)

Some numeric functions:
![Numeric Functions](./imgs/numeric_functions.png)


Some string functions:
![String Functions](./imgs/string_functions.png)


Some date functions:
![Date Functions](./imgs/date_functions.png)
