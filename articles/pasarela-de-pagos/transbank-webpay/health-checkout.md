# Health Check Api checkout

Puedes consultar el estado del servicio de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/health
  
```

Cuando el status del servicio es **UP** recibirás una respuesta similar a:

```
{
    "status": "UP",
    "up_time": "265:54:27",
    "info": {
        "profile": "PROD",
        "name": "midas-checkout",
        "version": "1.0.0",
        "logging": {
            "level": "info"
        }
    }
}
```
