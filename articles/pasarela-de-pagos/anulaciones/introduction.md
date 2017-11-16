# API REST de Anulaciones

Utilizando el **access_token** obtenido en la **Autenticación** y el **id (Token de la tarjeta)** generado en la **Intención de captura**, debes ejecutar una petición a la **API de Anulación /reverse** de la siguiente forma:

https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/73baab1e-f6f7-14cd-478b-b99b74acb546/reverse

```
 curl -v -X POST 'https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/{Token_de_tarjeta}/reverse' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token"
 -d '{
	      "reversal_amount":"4500"
     }' | json_pp
```

[Volver al menú anterior](../introduction.md)
