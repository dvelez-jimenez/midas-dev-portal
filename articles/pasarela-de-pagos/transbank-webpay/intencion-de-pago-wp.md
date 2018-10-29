## 4. Intención de Pago

Para completar el pago con el **token de la tarjeta** debes ingresar el **id** obtenido previamente de la **return_url** en el campo **capture_token** de la petición a la API de **Intención de Pago /payments**, el **access_token** generado en el [paso 1](obtener-token-acceso.md) y hacer el llamado de la siguiente forma:

```
curl -X POST \
  https://api.staging-v2.peanuthub.com/checkout/payments \
  -H 'authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJwcmltYXJ5c2lkIjoiMjhhZGI5OTktN2EyZS03MGI4LWMwOTItZTRjMTZhOWU5ZTBhIiwidW5pcXVlX25hbWUiOiJUb2lwYXRvLmNvbSIsImdyb3Vwc2lkIjoiQVBQTCIsImlzcyI6IkZhbGFiZWxsYSIsImF1ZCI6IldlYiIsInR5cGUiOiJCZWFyZXIiLCJzY29wZSI6W10sImlhdCI6MTUxMzE3Nzk1OCwiZXhwIjoxNTEzMTc4ODU4fQ.OYBksN1EvNBU012fJt4IhUnQ5g0szPXPmivD2GvprLczjbG6Pd7HeSyWddSCVOAwAXfycNMzwn0nb_6VdYMqbSzE3T9Bu0Oqzih4b_BfLLb4EwpRQ3L0ObFNkJTI2hfIMUNJQ5ohT8b2yR-1SiehAUd0Tlkb3zrh2aDP9AYVZGqkjLdnwQOpBtXVs6VmntXnb3_MklOU7U0BylB1kVG40t9qfSxf79DYTcr3JWs6LdCFDThkudMZtJfnjYsOoqt--Iv8BzhCU7Eft1Isf2Qfqn_1-p778E7r4yQY1GREuAsXPNfnnHxi7gOVVQ1owq1aekqt4m4ML-VLow8pUx5duYw' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: fdd285bc-5f48-7c71-b306-19ee7d04941e' \
  -d '{ 
   "intent": "sale", 
   "payer": { 
     "payer_info": { 
       "email": "david.munoz@peanuthub.cl", 
       "full_name": "David Muñoz",
       "country": "CL",
       "document_number": "123123123",
       "document_type": "RUT"
     }, 
     "payment_method": "EVE_PRESTO"
   }, 
   "transaction": { 
     "reference_id": "OD0000233", 
     "description": "Transaction detailed description", 
     "soft_descriptor": "Short Description", 
     "amount": { 
       "currency": "CLP", 
       "total": 4500, 
       "details": { 
         "subtotal": 810, 
         "tax": 190, 
         "shipping": 0, 
         "shipping_discount": 0 
       } 
     }, 
     "item_list": { 
       "shipping_address": { 
         "line1": "Miraflores 222", 
         "city": "Santiago", 
         "country_code": "CL", 
         "phone": "+56 9 1234 5674", 
         "type": "HOME_OR_WORK", 
         "recipient_name": "David Muñoz" 
       }, 
       "shipping_method": "DIGITAL", 
       "items": [ 
         { 
           "sku": "1231232", 
           "name": "Destornillador 2344", 
           "description": "Destornillador SCL - ONT", 
           "quantity": 1, 
           "price": 4500, 
           "tax": 0 
         } 
       ] 
     } 
   }, 
   "redirect_urls": { 
     "return_url": "https://checkout.peanuthub.com/redirections/payment_success.html", 
     "cancel_url": "https://chao.com" 
   }
 }'
 ```
**Detalle de los Campos de la Petición**

| Nombre                                   | Descripción                              | Tipo         | Requerido   |
| ---------------------------------------- | ---------------------------------------- | ------------ | ------------
| intent                                   | Identifica en tipo de transacción (sale) | string       |  Sí         |
| **payer**                                | **Pagador**                              | **object**   |           |
| **payer.payer_info**                     | **Información del cliente que está comprando en el sitio del  comercio** | **object**   |
| payer.payer_info.email                   | correo electrónico                       | string       |  Sí         |
| payer.payer_info.full_name               | nombre completo                          | string       |  Sí         |
| payer.payer_info.country                 | Nacionalidad                             | string       |  Sí         |
| payer.payer_info.documentNumber          | Número de identificación                 | string       |  Sí         |
| payer.payer_info.documentType            | Tipo de documento de identificación      | string       |  Sí         |
| payer.payment_method                     | Identifica el método de captura a utilizar  | string       |  Sí         |
| **transaction**                          | **Grupo de campos con la información de la transacción** | **object**   |           |
| transaction.gateway_order                | Número de la orden de compra. Id de transacción que es enviada al  gateway de pago. **Este valor debe ser unico** | string       |  No         |
| transaction.reference_id                 | El código de referencia de la transacción. Representa el identificador de  la transacción en el sistema del comercio. | string       |  No         |
| transaction.description                  | Descripción de la compra                 | string       |  No         |
| transaction.soft_descriptor              | Descripción corta de la transacción      | string       |  Sí         |
| **transaction.amount**                   | **Grupo de campos que detalla los montos de la compra** | **object**   |
| transaction.amount.currency              | Código ISO de la moneda asociada al monto de la compra. | string       |  Sí         |
| transaction.amount.total                 | Monto total de la compra que será descontado de la tarjeta o cuenta del  cliente | number          |  Sí         |
| **transaction.amount.details**           | Detalles del monto de la compra          |              |             |
| transaction.amount.details.subtotal      | Monto de la compra sin incluir impuesto  | number          |  Sí         |
| transaction.amount.details.tax           | Monto total de los impuestos             | number          |  Sí         |
| transaction.amount.details.shipping      | Costo del despacho                       | number          |  Sí         |
| transaction.amount.details.shipping_discount | Monto de descuento en costo de despacho  | number          |  Sí         |
| **transaction.item_list**                | **Información del producto(s)**         | **object**   |           |
| **transaction.item_list.shipping_address** | **Dirección de despacho (compras con despacho a domicilio)** | **object**   |  Sí         |
| transaction.item_list.shipping_address.line1 | Direccion de despaho                     | string       |  Sí         |
| transaction.item_list.shipping_address.city | Ciudad donde se realizará el despacho    | string       |  Sí         |
| transaction.item_list.shipping_address.country_code | Código de país donde se efectúa el despacho | string       |  Sí         |
| transaction.item_list.shipping_address.phone | Número de teléfono para la recepción de los productos despachados | string       |  Sí         |
| transaction.item_list.shipping_address.type | Tipo de despacho                         | string       |  Sí         |
| transaction.item_list.shipping_address.recipient_name | Nombre de la persona que recibirá el producto | string       |  Sí         |
| transaction.item_list.shipping_method    | Método de despacho de la compra: Digital, | string       |  Sí         |
| **transaction.item_list.items**          | **Grupo de campos que detalla los productos o servicios de la compra** | **objeto**   |  Opcional         |
| transaction.item_list.items.sku          | Código SKU                               | string       |  Sí         |
| transaction.item_list.items.name         | Nombre del producto                      | string       |  Sí         |
| transaction.item_list.items.description  | Descripción del producto                 | string       |  No         |
| transaction.item_list.items.thumbnail    | Imagen del producto                      | string       |  No         |
| transaction.item_list.items.quantity     | Cantidad                                 | string       |  Sí         |
| transaction.item_list.items.price        | Precio unitario (con impuesto)           | number          |  Sí         |
| transaction.item_list.items.tax          | Monto del impuesto del producto          | number          |  Sí         |
| **redirect_urls**                        | **Url de redirección dependiendo del estado de la captura una vez  finalizado el proceso de captura** | **objeto**   |
| redirect_urls.return_url                 | URL de notificación de pago exitoso      | string (url) |  Sí         |
| redirect_urls.cancel_url                 | URL de notificación de pago fallido      | string (url) |  Sí         |
| **additional_attributes**                | **Grupo de campos de uso exclusivo**     | **objeto**   |  Opcional         |
| additional_attributes.order_number       | Numero de Orden Asociado                 | string       |  Sí         |

El resultado de la llamada a la API de checkout, será una intención de pago en su estado inicial (created), que contendrá el, o los links HATEOAS relacionados con la llamada.

A continuación se presenta ejemplo de un JSON como respuesta al crear una intención de pago a través de la API RESTful de checkout:

```
{
    "intent": "sale",
    "additional_attributes": {
    },
    "application": "28adb999-7a2e-70b8-c092-e4c16a9e9e0a",
    "redirect_urls": {
        "return_url": "https://checkout.peanuthub.com/redirections/payment_success.html",
        "cancel_url": "https://chao.com"
    },
    "transaction": {
        "reference_id": "OD0000233",
        "description": "Transaction detailed description",
        "soft_descriptor": "Short Description",
        "item_list": {
            "shipping_method": "DIGITAL",
            "items": [
                {
                    "sku": "1231232",
                    "name": "Destornillador 2344",
                    "description": "Destornillador SCL - ONT",
                    "quantity": 1,
                    "price": 4500,
                    "tax": 0
                }
            ],
            "shipping_address": {
                "line1": "Miraflores 222",
                "city": "Santiago",
                "country_code": "CL",
                "phone": "+56 9 1234 5674",
                "type": "HOME_OR_WORK",
                "recipient_name": "David Muñoz"
            }
        },
        "amount": {
            "currency": "CLP",
            "total": 4500,
            "details": {
                "subtotal": 810,
                "tax": 190,
                "shipping": 0,
                "shipping_discount": 0
            }
        }
    },
    "payer": {
        "payer_info": {
            "document_type": "RUT",
            "document_number": "123123123",
            "country": "CL",
            "full_name": "David Muñoz",
            "email": "jlprueba1@peanuthub.cl"
        },
        "payment_method": "EVE_PRESTO"
    },
    "links": [
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/aedac5dc-49a2-87db-e373-aa44675951a7",
            "rel": "self",
            "security": [
                "ApiKey"
            ],
            "method": "GET"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/aedac5dc-49a2-87db-e373-aa44675951a7/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/aedac5dc-49a2-87db-e373-aa44675951a7/edit",
            "rel": "update_url",
            "method": "PUT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/aedac5dc-49a2-87db-e373-aa44675951a7/silent",
            "rel": "silent_charge",
            "security": [
                "Jwt"
            ],
            "method": "POST"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/aedac5dc-49a2-87db-e373-aa44675951a7/refund",
            "rel": "refund_method",
            "security": [
                "Jwt"
            ],
            "method": "POST"
        }
    ],
    "id": "aedac5dc-49a2-87db-e373-aa44675951a7",
    "create_time": "2018-01-15T15:57:20.191Z",
    "update_time": "2018-01-15T15:57:20.191Z",
    "state": "created",
    "invoice_number": "INPA-1244430504601613"
}
```
**Detalle de los campos agregados a la Respuesta**

| Nombre                                   | Descripción                              | Tipo         |
| ---------------------------------------- | ---------------------------------------- | ------------ |
| id                                       | Identificador unico de la intención      | string (Guid)|
| create_time                              | Fecha de creación de la intención        | string (ISO 8601)|
| update_time                              | Fecha de actualización de la intención   | string (ISO 8601)|
| invoice_number                           | Identificador legible de la intención    | string (correlativo)|
| application                              | Identificador interno    | string|
| links | Arreglo de Link HATEOAS para la ejecución de operaciones disponibles sobre la intención | array |
| **link** | Enlace bajo formato HATEOAS, sobre la definición de una operación disponible en una intención  | **objeto**  |
| link.href | Dirección URL de la operación | string (URL) |
| link.rel |Relación de la operación sobre una intención | Enum |
| link.method |Verbo HTTP solicitado para la ejecución de la operación|Enum|

**Detalle de las URLs generadas:**

- **self**: desde esta URL puedes consultar la información de la captura. [Ejemplo de ejecución de Self](self.md).
- **approval_url**: desde esta URL el cliente debe autorizar el pago.
- **self_by_gateway_order**: desde esta URL también puedes consultar la información del pago utilizando el gateway_order.

> Estas URLs son dinamicas, nunca debes guardarlas como variables de entorno. Siempre debes consultarlas desde aquí para continuar con los pasos siguientes.


[Consultar estado del servicio (Health Check)](health-checkout.md)

Ir al paso [3. Mostrar Formulario de Pago Express Checkout](formulario-pago-transbank.md)
