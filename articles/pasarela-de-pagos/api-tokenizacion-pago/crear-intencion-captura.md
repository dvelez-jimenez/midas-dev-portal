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

| Nombre        | Tipo            | Descripción  |
| ------------- | --------------- | ------------ |
| capture      | Enum    | Tipo de Captura solicitada en la intención.             |
| capture_method| Enum      | Método de Captura para la tarjeta   |
| cardholder | Object        | Datos del cliente |
| cardholder.reference_id | String        | Identificador externo del comercio |
| cardholder.country | String      | País de residencia del cliente |
| cardholder.name | String      | Nombre del cliente tal como se muestra en la tarjeta |
| cardholder.email | String      | Email del cliente |
| billing | String      | Dirección de facturación asociada a la tarjeta  |
| billing.line1 | String      | Dirección de facturación |
| billing.line2 | String      | Dirección 2 de facturación |
| billing.city | String      | Ciudad para facturación |
| billing.state | String      | Comuna de facturación |
| billing.country | String     | País de facturación|
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida |

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

| Nombre        | Tipo            | Descripción  |
| ------------- | --------------- | ------------ |
| id            | String (Guid)   | Identificador único de la intención              |
| capture       | Enum          | Tipo de Captura establecida en la intención. Este campo contiene el valor que enviaste en la petición.|
| capture_method| Enum           | Método de Captura que se usará. Este campo contiene el valor que enviaste en la petición.|
| cardholder | Object        | Datos del cliente. Este campo contiene el valor que enviaste en la petición. |
| cardholder.reference_id | String        |El código de referencia de la transacción. Representa el identificador de la transacción en el sistema del comercio. Este campo contiene el valor que enviaste en la petición. |
| cardholder.country | String       | País de residencia del cliente. Este campo contiene el valor que enviaste en la petición. |
| cardholder.name | String      | Nombre del cliente tal como se muestra en la tarjeta. Este campo contiene el valor que enviaste en la petición. |
| cardholder.email | String      | Email del cliente. Este campo contiene el valor que enviaste en la petición.|
| billing | String      | Dirección de facturación asociada a la tarjeta. Este campo contiene el valor que enviaste en la petición.  |
| billing.line1 | String      | Dirección de facturación. Este campo contiene el valor que enviaste en la petición. |
| billing.line2 | String      | Dirección 2 de facturación. Este campo contiene el valor que enviaste en la petición. |
| billing.city | String      | Ciudad para facturación. Este campo contiene el valor que enviaste en la petición. |
| billing.state | String      | Comuna de facturación. Este campo contiene el valor que enviaste en la petición. |
| billing.country | String     | País de facturación. Este campo contiene el valor que enviaste en la petición.|
| create_time | String (ISO 8601) | Fecha de creación de la intención |
| update_time | String (ISO 8601) | Fecha de actualización de la intención |
| state | Enum  | Estado actual de la intención |
| capture_number | String (Correlativo) | Identificador legible de la intención |
| links | Array[ link ] | Arreglo de Link HATEOAS para la ejecución de operaciones disponibles sobre la intención |
| link | Object | Enlace bajo formato HATEOAS, sobre la definición de una operación disponible en una intención |
| link.href | String (Url) | Dirección URL de la operación |
| link.rel | Enum  | Relación de la operación sobre una intención |
| link.method | Enum  | Verbo HTTP solicitado para la ejecución de la operación |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura. Este campo contiene el valor que enviaste en la petición. |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa. Este campo contiene el valor que enviaste en la petición. |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida. Este campo contiene el valor que enviaste en la petición. |


**Detalle de las URLs generadas:**

+ URL 1 (**rel: self**): desde esta URL puedes consultar la información de la intención de captura.
+ URL 2 (**rel: capture_url**): desde esta URL debes acceder al formulario de captura de la tarjeta.

Ir al paso [3. Mostrar formulario de Captura de tarjeta](formulario-captura-tarjeta.md)
