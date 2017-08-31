# Obtener Resultado de la captura
Cuando se ha creado una intención de captura a través de Quickpay Connect, es necesario que el cliente ingresé la información de la tarjeta a capturar y con ello finalizar el proceso de la transacción asociada a una intención. 

>**Nota:**
>Para la integración a través de "redirección de pagina completa", se debe enviar al cliente a la url indicada con la relación **capture_url** que se encuentra en el campo links, enviada en la respuesta de la API al crear una intención de captura.

Una vez que el cliente haya enviado la información de la tarjeta a capturar, de acuerdo al método de captura elegido, Quickpay Connect retornará el control (contexto) al comercio usando las url's de exito y error establecidas en la creación de la intención (**redirect_urls**), finalizando el proceso de captura y entregando el control al comercio.

## Obtener el detalle de un captura
Para obtener el detalle de una intención de captura (o captura finalizada si es que el cliente ya ha ingreso la información necesario para la captura),es necesario realizar una llamada a la url indicada con la relación **self** que se encuentra en el campo links enviada en la respuesta de creación de la intención de captura. 

Además de lo anterior, es necesario enviar en el encabezado **Authorization** el token de acceso usado en la creación de la intención a través de la API RESTful de captura. 

A continuación se presenta un ejemplo de un JSON de respuesta al consultar el servicio de consulta de detalle enviado en la respuesta de una intención:

````javascript
{
  "id": "6b89dfb5-230e-e2a2-5e13-b5582d455061",
  "capture": "CREDIT_CARD",
  "capture_method": "TOKENIZATION",
  "application": "acb361cc-e4e7-24fb-d4e2-17bb3aa74066",
  "cardholder": {
    "reference_id": "Merchant_id_reference",
    "country": "CL"
  },
  "create_time": "2017-07-14T02:50:38.007Z",
  "update_time": "2017-07-14T02:50:38.007Z",
  "state": "captured",
  "capture_number": "INCA-0000000009",
  "redirect_urls": {
    "return_url": "http://www.mysite.cl/success",
    "cancel_url": "http://www.mysite.cl/cancel"
  },
  "gateway": {
    "panFirst4": "4111",
    "panLast6": "111111",
    "merchantReferenceCode": "Merchant_id_reference",
    "requestID": "5009299866656681904011",
    "decision": "ACCEPT",
    "reasonCode": "100",
    "requestToken": "AhjzbwSTD44AKFDrJkeLigFP6s7cxpSYAOEsMmkmW6QHAX2gJgAA8A6E",
    "paySubscriptionCreateReply": {
        "reasonCode": "100",
        "subscriptionID": "5009299866656681904011"
    }
  }
}
````

| Nombre        | Tipo            | Descripción  | Requerido |
| ------------- | --------------- | ------------ | --------- |
| id            | String (Guid)   | Identificador único de la intención              | Sí |
| capture       | Enum [:arrow_upper_right:](enumeration-capture.md)           | Tipo de Captura establecida en la intención.             | Sí |
| capture_method| Enum [:arrow_upper_right:](enumeration-capture-method.md)            | Método de Captura que se usará   | Sí |
| application   | String (Guid)   | Identificador de la aplicación del comercio quien solicito la captura              | Sí |
| cardholder | Object        | Datos del tarjeta habiente | Sí |
| cardholder.reference_id | String        | Identificador externo del comercio | No |
| cardholder.country | String (ISO 3166-1)        | País de residencia del tarjeta habiente | Sí |
| cardholder.name | String      | Nombre del tarjeta habiente tal como se muestra en la tarjeta | Sí |
| create_time | String (ISO 8601) | Fecha de creación de la intención | Sí |
| update_time | String (ISO 8601) | Fecha de actualización de la intención | Sí |
| state | Enum [:arrow_upper_right:](enumeration-state.md) | Estado actual de la intención | Sí |
| capture_number | String (Correlativo) | Identificador legible de la intención | Sí |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura | Sí |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa | Sí |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida | Sí |
| gateway | Object      | Datos de la captura (varía dependiendo del metodo de captura establecido ) | Sí |

>**Nota:**
>El campo **gateway** varía dependiendo del método de captura seleccionado por el comercio para realizar la captura y puede variar en el tiempo dependiendo de las modificaciones que realize cada provedor de captura especifico en su plataforma.

## Pasos Siguientes
Al crear una intención de captura , ya es posible comenzar con el proceso de captura del mismo por el cliente y actualizar una intención de captura a una captura completada para finalizar el proceso y comenzar con el proceso de ejecución de cobros a una tarjeta.

[Ejecutar un cobro a una tarjeta >](create-charge.md)