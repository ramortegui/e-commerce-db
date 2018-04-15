# Elixir script to generate sql statements for multiple database engines.
databases = ~w[db2 html informix ingres mysql-innodb mysql-myisam oracle postgres sas sqlite3 sqlite3fk sybase]


Enum.each(databases, fn(db) ->
  {statements, 0} = System.cmd("parsediasql",["--file","ECommerceDB.dia","--db",db])
  {:ok, file} = File.open("./export/ecommerce-db-#{db}.sql",[:write])
  IO.binwrite file, statements
  File.close(file)
end)


