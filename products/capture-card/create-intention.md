# Crear una Intención de Captura
Luego de obtener la autorización de captura del cliente a través su plataforma en línea, es necesario crear una intención de captura para comenzar con el proceso de captura a través de la plataforma Quickpay Connect. 

Para crear una intención de captura, se debe ejecutar una llamada a la api de captura **/captures** con al menos la siguiente información: 

- En el encabezado **Authorization** de la llamada es necesario enviar el **token de acceso** previamente obtenido en el servidor de autorización.
- En el cuerpo del mensaje JSON, se debe establecer el campo **capture** a **CREDIT_CARD**.
- Enviar las **url's de redirección** cuando la captura se complete con exito o cuando la captura no haya podido ser completado.
- El **método de captura** de acuerdo a la selección de la plataforma en línea.
- Un identificador del comercio asociado al tarjeta habiente para asociar la captura a un dato único que pertenece al comercio **reference_id**
- La información de **transaccion(es)** a pagar definida(s) de acuerdo a la compra de productos seleccionados por el cliente.

````bash
curl -v -X POST 'https://api-capture-card-quickpay.azurewebsites.net/captures' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer Your-Valid-Access-Token" \
 -d '{
  "capture": "CREDIT_CARD",
  "capture_method": "TOKENIZATION",
  "cardholder": {
    "reference_id": "Merchant_id_reference",
    "country": "CL"
  },
  "redirect_urls": {
    "return_url": "http://www.mysite.cl/success",
    "cancel_url": "http://www.mysite.cl/cancel"
  }
}'
````

| Nombre        | Tipo            | Descripción  |
| ------------- | --------------- | ------------ |
| capture       | Enumeración     | Tipo de Captura solicitada en la intención.             |
| capture_method| Enumeración        | Método de Captura para la tarjeta   |
| cardholder | Object        | Datos del tarjeta habiente |
| cardholder.reference_id | String        | Identificador externo del comercio |
| cardholder.country | String (ISO 3166-1)        | País de residencia del tarjeta habiente |
| cardholder.name | String      | Nombre del tarjeta habiente tal como se muestra en la tarjeta |