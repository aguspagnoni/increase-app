# Increase App API

_Es una API RESTFul que consume datos de una API propia de increase_

## Descripción 🚀

_Este proyecto utilizas las gems [Sidekiq](https://github.com/mperham/sidekiq) y [Sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron)._
_Por medio un worker de Sidekiq se obtienen los datos de la API de increase, los cuales son almacenados en la base de datos local del proyecto_

### Como Usar 📋

_Una vez clonado el repositorio se procede a hacer lo siguiente:_

```
bundle install
```
_Para instalar todas las gems necesarias para el proyecto_
_Luego procedemos a crear la base de datos, con sus tablas y datos iniciales:_

```
rails db:create db:migrate db:seed
```
_Damos arranque al servidor local_

```
rails s
```

_Y finalmente le damos inicia a sidekiq ingresado este comando en la terminal:_

```
sidekiq
```

_De está manera se guardaran en la base de datos local la información proveniente de la API en intervalos de 10 minutos._

### Enpoints disponibles 🔧

_Para porder acceder al listado de todos clientes:_

```
http://localhost:3000/api/v1/clients
```

_Para acceder a la informacion de un cliente_

```
http://localhost:3000/api/v1/clients/:id_del_cliente
```

_Para acceder a los pagos correspondientes a un cliente_

```
http://localhost:3000/api/v1/clients/:id_del_cliente/payments
```

_Para acceder a las transacciones correspondientes a un cliente_

```
http://localhost:3000/api/v1/clients/:id_del_cliente/transactions
```