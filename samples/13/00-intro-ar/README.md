# Ejemplo de Active Record

Tratamos de correr la aplicacion que lista todos los productos en la db:

```
ruby main.rb
```

La salida inicial será un error porque no existe la tabla en la base de datos

## Creamos la tabla e insertamos un elemento

Dado que la base de datos se define en main.rb, nos conectamos a esa db:

```
sqlite3 /tmp/sample.db
> create table products(id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(255));
> insert into products(name) values('pelota'),('botines');
```

Debe utilizarse SQLite 3.7.11 o superior
