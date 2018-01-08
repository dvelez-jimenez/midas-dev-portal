# Health Check Api de captura **/captures**

Puedes consultar el estado del servicio de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/tokenization/health
  
```

Cuando el status del servicio es **UP** recibirás una respuesta similar a:

```
{
    "status": "UP",
    "up_time": "410:31:00",
    "info": {
        "profile": "PROD",
        "name": "api-qpay-capture-card",
        "version": "1.0.25",
        "routePrefix": "/tokenization",
        "logging": {
            "level": "info"
        }
    }
}
```
