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

| Nombre        | Tipo            | Descripción  | Requerido |
| ------------- | --------------- | ------------ | --------- |
| capture      | Enum [:arrow_upper_right:](enumeration-capture.md)    | Tipo de Captura solicitada en la intención.             | Sí |
| capture_method| Enum [:arrow_upper_right:](enumeration-capture-method.md)       | Método de Captura para la tarjeta   | Sí |
| cardholder | Object        | Datos del tarjeta habiente | Sí |
| cardholder.reference_id | String        | Identificador externo del comercio | No |
| cardholder.country | String ([ISO 3166-1 alpha-2](https://es.wikipedia.org/wiki/ISO_3166-1#Tabla_de_c.C3.B3digos_alfa-2_asignados_o_reservados))        | País de residencia del tarjeta habiente | Sí |
| cardholder.name | String      | Nombre del tarjeta habiente tal como se muestra en la tarjeta | Sí |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura | Sí |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa | Sí |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida | Sí |

## Procesamiento de una Intención de Captura

El resultado de la llamada a la API de captura, será una intención de captura en su estado inicial (**creada**), que contendrá el, o los links HATEOAS relacionados con la llamada, como por ejemplo , el link que se deberá ejecutar para proceder con la **captura de la tarjeta** y finalizar el proceso de captura. 

A continuación se presenta ejemplo de un JSON como respuesta al crear una intención de captura a través de la API RESTful de captura:

````bash
{
  "id": "ab6d3734-5dc6-7ba0-1a57-f73e6102efc1",
  "capture": "CREDIT_CARD",
  "capture_method": "TOKENIZATION",
  "cardholder": {
    "reference_id": "Merchant_id_reference",
    "country": "CL"
  },
  "create_time": "2017-07-14T02:25:18.928Z",
  "update_time": "2017-07-14T02:25:18.928Z",
  "state": "created",
  "capture_number": "INCA-0000000007",
  "redirect_urls": {
    "return_url": "http://www.mysite.cl/success",
    "cancel_url": "http://www.mysite.cl/cancel"
  },
  "links": [
    {
      "href": "https://api-capture-card-quickpay.azurewebsites.net/captures/ab6d3734-5dc6-7ba0-1a57-f73e6102efc1",
      "rel": "self",
      "method": "GET"
    },
    {
      "href": "https://api-capture-card-quickpay.azurewebsites.net/captures/gateways/credit/card/ab6d3734-5dc6-7ba0-1a57-f73e6102efc1/capture",
      "rel": "capture_url",
      "method": "REDIRECT"
    }
  ]
}
````

| Nombre        | Tipo            | Descripción  | Requerido |
| ------------- | --------------- | ------------ | --------- |
| id            | String (Guid)   | Identificador único de la intención              | Sí |
| capture       | Enum [:arrow_upper_right:](enumeration-capture.md)           | Tipo de Captura establecida en la intención.             | Sí |
| capture_method| Enum [:arrow_upper_right:](enumeration-capture-method.md)            | Método de Captura que se usará   | Sí |
| cardholder | Object        | Datos del tarjeta habiente | Sí |
| cardholder.reference_id | String        | Identificador externo del comercio | No |
| cardholder.country | String (ISO 3166-1)        | País de residencia del tarjeta habiente | Sí |
| cardholder.name | String      | Nombre del tarjeta habiente tal como se muestra en la tarjeta | Sí |
| create_time | String (ISO 8601) | Fecha de creación de la intención | Sí |
| update_time | String (ISO 8601) | Fecha de actualización de la intención | Sí |
| state | Enum [:arrow_upper_right:](enumeration-state.md) | Estado actual de la intención | Sí |
| capture_number | String (Correlativo) | Identificador legible de la intención | Sí |
| links | Array[ link ] | Arreglo de Link HATEOAS para la ejecución de operaciones disponibles sobre la intención | Sí |
| link | Object | Enlace bajo formato HATEOAS, sobre la definición de una operación disponible en una intención | Sí |
| link.href | String (Url) | Dirección URL de la operación | Sí |
| link.rel | Enum [:arrow_upper_right:](enumeration-link-rel.md) | Relación de la operación sobre una intención | Sí |
| link.method | Enum [:arrow_upper_right:](enumeration-link-method.md) | Verbo HTTP solicitado para la ejecución de la operación | Sí |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura | Sí |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa | Sí |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida | Sí |

> Algunos medios de pago, entregan links de funcionalidades mayores a las descritas en el ejemplo de respuesta indicado arriba, como por ejemplo el link opcional **"silent_charge"** que permite ejecutar transacciones inmediatas sin requerir aprobación previa del cliente.

## Pasos Siguientes

**Información:** Al crear una intención de pago , ya es posible comenzar con el proceso de aprobación del mismo por el cliente y actualizar una intención de pago a un pago completado para finalizar el proceso.

[Obtener aprobación del pago >](get-capture.md)