

# Developing

Para instalar correctamente el programa en el modo de debug es necesario realizar los siguientes pasos

#### Clonación del repositorio
Desde una consola de comandos, sea powershell, cmd o lo que sea. Correr los siguientes comandos

Clonar el repositorio
```
git clone https://github.com/claudio2489/sindicato.git
```

Actualizar la dependencia en libs/db
```
cd libs/db
git pull
```
Acá va a preguntar por usuario y contraseña para oestedev.com, debido a que es un repositorio privado.
Autenticarse y la librería podrá actualizarse

*Nota*:

#### MySQL en linea de comandos:
Es necesario instalar el programa MySQL y correr el archivo 'consultas_db/inicio_db.sql', para eso hacemos lo siguiente

1. Abrir MySQL Command Line Client
2. Ingresar los comandos*:
  ```mysql
  CREATE TABLE nombre_de_base_de_datos;

  USE nombre_de_base_de_datos;

  ./ C:\direccion\del\archivo\consultas_db\inicio_db.sql
  ```

Nota*: nombre_de_base_de_datos debe ser reemplazado por el nombre que se le pondrá a la base de datos, debe coincidir con el nombre que colocará en el archivo database.ini

#### Database.ini:
1. Crear un archivo llamado 'database.ini' en la raíz del proyecto y guardarlo con el siguiente contenido:

  ```
  [DEFAULT]
  user = root
  password = contraseña
  host = 127.0.0.1
  database = nombre_de_base_de_datos
  ```

Nota: El nombre de usuario y contraseña dependen de la instalación de MySQL y los permisos que éste tenga sobre la base de datos. Para crear un usuario y contraseña que no sea root es necesario el siguiente comando en MySQL Command Line Client.

```
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'tu_contrasena';
```

Nota: localhost = 127.0.0.1
