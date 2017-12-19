## 2. Crear una Intención de Captura

Luego de obtener la autorización de captura del cliente a través de tu ecommerce, es necesario crear una intención de captura.

Para comenzar con el proceso, debes ejecutar una llamada a la api de captura **/captures** con al menos la siguiente información:

- En el encabezado **Authorization** de la llamada es necesario enviar el **access_token** previamente obtenido en el servidor de autorización.
- En el cuerpo del mensaje JSON, se debe establecer el campo **capture** a **CREDIT_CARD**.
- Enviar las **url's de redirección** cuando la captura se complete con exito o cuando la captura no haya podido ser completada.
- El **método de captura** de acuerdo a la selección de la plataforma en línea.
- Un identificador que pertenezca al comercio para asociar la captura a un dato único **reference_id**
- La información de **transaccion(es)** a pagar definida(s) de acuerdo a la compra de productos seleccionados por el cliente.

```
curl -X POST 'https://api.sandbox.connect.fif.tech/tokenization/captures' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer ACCESS TOKEN" \
 -d '{
  "capture": "CREDIT_CARD",
  "capture_method": "TOKENIZATION",
  "cardholder": {
    "reference_id": "001389",
    "country": "CL",
    "name": "Mati 1",
    "email": "JLPrueba1@gmail.com"
  },
  "billing": {
    "line1": "Miraflores 222",
    "city": "Santiago",
    "state": "Region Metropolitana",
    "country": "CL"
  },
  
  "redirect_urls": {
    "return_url": "https://requestb.in/sfoogtsf",
    "cancel_url": "http://www.mysite.cl/cancel"
  }
}' | json_pp
```

**Detalle de los campos de la Petición**

| Nombre        | Tipo            | Descripción  | Requerido |
| ------------- | --------------- | ------------ | --------- |
| capture      | Enum    | Tipo de Captura solicitada en la intención.             | Sí |
| capture_method| Enum      | Método de Captura para la tarjeta   | Sí |
| cardholder | Object        | Datos del tarjetahabiente | Sí |
| cardholder.reference_id | String        | Identificador externo del comercio | No |
| cardholder.country | String      | País de residencia del tarjetahabiente | Sí |
| cardholder.name | String      | Nombre del tarjetahabiente tal como se muestra en la tarjeta | Sí |
| cardholder.email | String      | Email del tarjetahabiente | Sí |
| billing | String      | Dirección de facturación asociada a la tarjeta  | Sí |
| billing.line1 | String      | Dirección de facturación | Sí |
| billing.line2 | String      | Dirección 2 de facturación | No |
| billing.city | String      | Ciudad para facturación | Sí |
| billing.state | String      | Comuna de facturación | Sí |
| billing.country | String     | País de facturación| Sí |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura | Sí |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa | Sí |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida | Sí |

El resultado de la llamada a la API de captura, será una intención de captura en su estado inicial (**created**), que contendrá el, o los links HATEOAS relacionados con la llamada, como por ejemplo , el link que se deberá ejecutar para proceder con la **captura de la tarjeta** y finalizar el proceso de captura. 

A continuación se presenta ejemplo de un JSON como respuesta al crear una intención de captura a través de la API RESTful de captura:

```
{
    "capture": "CREDIT_CARD",
    "capture_method": "TOKENIZATION",
    "application": "28adb999-7a2e-70b8-c092-e4c16a9e9e0a",
    "redirect_urls": {
        "return_url": "https://requestb.in/sfoogtsf",
        "cancel_url": "http://www.mysite.cl/cancel"
    },
    "billing": {
        "line1": "Miraflores 222",
        "city": "Santiago",
        "state": "Region Metropolitana",
        "country": "CL"
    },
    "cardholder": {
        "reference_id": "001389",
        "country": "CL",
        "name": "Mati 1",
        "email": "JLPrueba1@gmail.com"
    },
    "id": "42743d48-7699-0d00-ef45-a68c587e662d",
    "create_time": "2017-10-24T02:27:28.985Z",
    "update_time": "2017-10-24T02:27:28.985Z",
    "state": "created",
    "capture_number": "INCA-50000000006",
    "links": [
        {
            "href": "https://api.sandbox.connect.fif.tech/tokenization/captures/42743d48-7699-0d00-ef45-a68c587e662d",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/tokenization/captures/gateways/credit/card/42743d48-7699-0d00-ef45-a68c587e662d/capture",
            "rel": "capture_url",
            "method": "REDIRECT"
        }
    ]
}
```
**Detalle de los campos de la Respuesta**

| Nombre        | Tipo            | Descripción  | Requerido |
| ------------- | --------------- | ------------ | --------- |
| id            | String (Guid)   | Identificador único de la intención              | Sí |
| capture       | Enum          | Tipo de Captura establecida en la intención.             | Sí |
| capture_method| Enum           | Método de Captura que se usará   | Sí |
| cardholder | Object        | Datos del tarjetahabiente | Sí |
| cardholder.reference_id | String        | Identificador externo del comercio | No |
| cardholder.country | String       | País de residencia del tarjetahabiente | Sí |
| cardholder.name | String      | Nombre del tarjetahabiente tal como se muestra en la tarjeta | Sí |
| cardholder.email | String      | Email del tarjeta  | Sí |
| billing | String      | Dirección de facturación asociada a la tarjeta  | Sí |
| billing.line1 | String      | Dirección de facturación | Sí |
| billing.line2 | String      | Dirección 2 de facturación | No |
| billing.city | String      | Ciudad para facturación | Sí |
| billing.state | String      | Comuna de facturación | Sí |
| billing.country | String     | País de facturación| Sí |
| create_time | String (ISO 8601) | Fecha de creación de la intención | Sí |
| update_time | String (ISO 8601) | Fecha de actualización de la intención | Sí |
| state | Enum  | Estado actual de la intención | Sí |
| capture_number | String (Correlativo) | Identificador legible de la intención | Sí |
| links | Array[ link ] | Arreglo de Link HATEOAS para la ejecución de operaciones disponibles sobre la intención | Sí |
| link | Object | Enlace bajo formato HATEOAS, sobre la definición de una operación disponible en una intención | Sí |
| link.href | String (Url) | Dirección URL de la operación | Sí |
| link.rel | Enum  | Relación de la operación sobre una intención | Sí |
| link.method | Enum  | Verbo HTTP solicitado para la ejecución de la operación | Sí |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura | Sí |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa | Sí |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida | Sí |


**Detalle de las URLs generadas:**

+ URL 1 (**rel: self**): desde esta URL puedes consultar la información de la intención de captura.
+ URL 2 (**rel: capture_url**): desde esta URL debes acceder al formulario de captura de la tarjeta.

Ir al paso [3. Mostrar formulario de Captura de tarjeta](formulario-captura-tarjeta.md)
