# Ejemplo de Active Record y validaciones

Para crear una tabla usar:

```
sqlite3 /tmp/sample.db
> create table people(id int primary key not null, name char[100] not null);
```

Correr una instancia de irb de la siguiente forma para jugar:

```
irb -I . -r sample.rb
```
