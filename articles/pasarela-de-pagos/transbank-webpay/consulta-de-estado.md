## 4. Consulta de Estado de la Transacción

Con la url **self** obtenida en el [paso 2](intencion-de-pago-wp.md) puedes consultar el estado de la transacción de la siguiente forma:

```curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: Bearer access_token
```

Donde access_token es el **token de acceso** generado en el **paso 1** y el **id** es el id de la intención de pago generado en el **paso 3**.
  
  
