## 3.2. Invocar a servicio de Captura de tarjeta

Con la url **capture_card** obtenida en el [paso 2](crear-intencion-captura.md) puedes ejecutar una llamada al servicio de captura de tarjeta. Para ello, necesitas enviar la siguiente información:

- En el encabezado **Authorization** de la llamada es necesario enviar el **access_token** previamente obtenido en el servidor de autorización.
- En el cuerpo del mensaje JSON, se debe incluir la información de la tarjeta a capturar

```
curl -v -X POST 'https://api.sandbox.connect.fif.tech/tokenization/captures/gateways/peinau/capture/ef229c75-b250-9f15-fcf2-7f0dee0a6136/capture_card' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer $ACCESS_TOKEN_SB" \
 -d '{
  "card_number": "405188665",
  "expiry_month": "2",
  "expiry_year": "2020",
  "card_ccv": "123"
}' | json_pp
```

**Detalle de los campos de la Petición**

| Nombre        | Tipo            | Descripción  |
| ------------- | --------------- | ------------ |
| card_number      | Number    | Número de tarjeta.             |
| expiry_month| Number      | Mes de expiración de la tarjeta   |
| expiry_year | Number        | Año de expiración de la tarjeta |
| card_ccv | Number        | CCV de la tarjeta |

El resultado será la misma captura creada, pero esta vez en en estado (**captured**). 

A continuación se presenta ejemplo de un JSON como respuesta al realizarse una captura exitosa:

**Ejemplo de respuesta exitosa:**

```
{
    "capture": "PEINAU_CAPTURE",
    "capture_method": "TOKENIZATION",
    "additional_attributes": {
        "reemember_capture": true
    },
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
        "name": "Andres Roa",
        "email": "JLPrueba1@gmail.com"
    },
    "id": "597a0119-d2e6-663d-a40c-e6a2cfc2fd9f",
    "create_time": "2018-02-01T18:20:52.603Z",
    "update_time": "2018-02-01T18:21:32.247Z",
    "deletion_time": "2018-02-02T18:20:52.603Z",
    "state": "captured",
    "invoice_number": "INCA-50000001742",
    "gateway": {
        "merchantReferenceCode": "001389",
        "requestID": "5175092920666483104012",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "AhjzbwSTGIrXaIdcgJkMigFRp8Vnq5RMAH2CGTSTL0Yrl+WAEwAA4i4b",
        "paySubscriptionCreateReply": {
            "reasonCode": "100",
            "subscriptionID": "5175092920666483104012"
        },
        "panFirst6": "411111",
        "panLast4": "1111",
        "payment_token": "5175092920666483104012",
        "req_card_number": "xxxxxxxxxxxx1111"
    }
}
```

**Detalle de los campos**

| Nombre        | Tipo            | Descripción  |
| ------------- | --------------- | ------------ |
| id            | String (Guid)   | Identificador único de la intención (Token)             |
| capture       | Enum          | Tipo de Captura establecida en la intención.             |
| capture_method| Enum           | Método de Captura que se usará   |
| cardholder | Object        | Datos del cliente |
| cardholder.reference_id | String        | El código de referencia de la transacción. Representa el identificador de la transacción en el sistema del comercio |
| cardholder.country | String       | País de residencia del cliente |
| cardholder.name | String      | Nombre del cliente tal como se muestra en la tarjeta |
| cardholder.email | String      | Email del tarjeta  |
| billing | String      | Dirección de facturación asociada a la tarjeta  |
| billing.line1 | String      | Dirección de facturación |
| billing.line2 | String      | Dirección 2 de facturación |
| billing.city | String      | Ciudad para facturación |
| billing.state | String      | Comuna de facturación |
| billing.country | String     | País de facturación|
| create_time | String (ISO 8601) | Fecha de creación de la intención |
| update_time | String (ISO 8601) | Fecha de actualización de la intención |
| state | Enum  | Estado actual de la intención |
| invoice_number | String (Correlativo) | Identificador legible de la intención |
| panLast4      | String | Cuatro últimos números de la tarjeta |
| redirect_urls | Object      | Url de redirección dependiendo del estado de la captura una vez finalizado el proceso de captura |
| redirect_urls.return_url | String (Url)      | Url de redirección al producirse una captura exitosa |
| redirect_urls.cancel_url | String (Url)      | Url de redirección al producirse una captura fallida |


El **id** generado corresponde al **Token de la tarjeta**.

> **id de ejemplo**"id": "597a0119-d2e6-663d-a40c-e6a2cfc2fd9f"

Tabla de posibles respuestas:

| State    | Definición                               |
| -------- | ---------------------------------------- |
| captured | Se ha capturado la información de la tarjeta |
| rejected | Ocurrio un error y no se pudo completar la captura |

Ir al paso [4. Intención de Pago](intencion-de-pago.md)
