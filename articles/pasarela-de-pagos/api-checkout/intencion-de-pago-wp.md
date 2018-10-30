## 2. Intención de Pago

Para completar el pago con el **token de la tarjeta** debes ingresar el **id** obtenido previamente de la **return_url** en el campo **capture_token** de la petición a la API de **Intención de Pago /payments**, el **access_token** generado en el [paso 1](obtener-token-acceso.md) y hacer el llamado de la siguiente forma:

```
export URL_API_MIDAS=http://api.staging-v2.walmartdigital.cl/checkout
export ACCESS_TOKEN= 'eyJhbGciO...duYw'
curl -X POST \
  "$URL_API_MIDAS/payments" \
  -H 'authorization: Bearer $ACCESS_TOKEN' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
  "intent": "sale",
  "payer": {
    "payer_info": {
      "email": "jlprueba1@quickpay.com",
      "full_name": "David Muñoz",
      "country": "CL",
      "document_number": "123123123",
      "document_type": "RUT"
    },
    "payment_method": "EVE_PRESTO"
  },
  "transaction": {
  	"reference_id":1,
    "description": "Transaction detailed description",
    "soft_descriptor": "Short Description",
    "amount": {
      "currency": "CLP",
      "total": 4500,
      "details": {
        "subtotal": 4000,
        "tax": 500,
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
        "recipient_name": "Andres Roa"
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
    "return_url": "{{URL_RESPUESTA_PAGO}}",
    "cancel_url": "{{URL_RESPUESTA_PAGO}}"
  },
  "additional_attributes": {
    "client_id": "163875586",
    "channel":"EC-GR-D",
    "local_id":"83",
    "shipping_groups": [
      {
        "id":"sg8008480046",
        "date":"20180906",
        "interval":"900-21:1000",
        "amount": "4500",
        "local_id":"83"
      }
    ]
  }
}'
 ```

> El **URL_API_MIDAS**, **ACCESS_TOKEN** y **URL_NEGOCIO** utilizados en esta petición son datos de prueba.
> **{{URL_API_MIDAS}}/payments** 
> el campo **URL_RESPUESTA_PAGO** de la petición sera la url para notificar la respuesta del pago realizado / si el cliente no dispone de una url puede enviar la url por defecto de midas **{{URL_API_MIDAS}}/payments/static_redirection.html**.

/

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
| **meta_data**                              | **Objeto para almacenar datos de la integración**     | **objeto**   || 

El resultado de la llamada a la API de checkout, será una intención de pago en su estado inicial (created), que contendrá el, o los links HATEOAS relacionados con la llamada.

A continuación se presenta ejemplo de un JSON como respuesta al crear una intención de pago a través de la API RESTful de checkout:

```
{
    "intent": "sale",
    "_id": "5bd6eda61a30be002a4625d8",
    "application": "5b635b3b71cd29001c5043ae",
    "redirect_urls": {
        "return_url": "{{URL_RESPUESTA_PAGO}}",
        "cancel_url": "{{URL_RESPUESTA_PAGO}}"
    },
    "transaction": {
        "gateway_order": "INPA-54731540812198469",
        "reference_id": "1",
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
                "recipient_name": "Andres Roa"
            }
        },
        "amount": {
            "currency": "CLP",
            "total": 4500,
            "details": {
                "subtotal": 4000,
                "tax": 500,
                "shipping": 0,
                "shipping_discount": 0
            }
        }
    },
    "payer": {
        "payment_method": "EVE_PRESTO",
        "payer_info": {
            "email": "jlprueba1@quickpay.com",
            "full_name": "David Muñoz",
            "country": "CL",
            "document_number": "123123123",
            "document_type": "RUT"
        }
    },
    "links": [
        {
            "href": "{{URL_API_MIDAS}}/payments/5bd6eda61a30be002a4625d8",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "{{URL_API_MIDAS}}/payments/gateways/eve/presto/5bd6eda61a30be002a4625d8/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        },
        {
            "href": "{{URL_API_MIDAS}}/payments/INPA-54731540812198469",
            "rel": "self_by_gateway_order",
            "method": "GET"
        }
    ],
    "updated_at": "2018-10-29T11:23:18.469Z",
    "created_at": "2018-10-29T11:23:18.469Z",
    "invoice_number": "INPA-54731540812198469",
    "state": "created",
    "id": "5bd6eda61a30be002a4625d8",
    "additional_attributes": {
        "shipping_groups": [
            {
                "local_id": "83",
                "amount": "4500",
                "interval": "900-21:1000",
                "date": "20180906",
                "id": "sg8008480046"
            }
        ],
        "local_id": "83",
        "channel": "EC-GR-D",
        "client_id": "163875586"
    }
}
```

> El **{{URL_API_MIDAS}}** mostrados en esta respuesta corresponde a la url de la integración de MIDAS.
> el campo **URL_RESPUESTA_PAGO** de la petición sera la url para notificar la respuesta del pago realizado / si el cliente no dispone de una url puede enviar la url por defecto de midas **{{URL_API_MIDAS}}/payments/static_redirection.html**.

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

Ir al paso [3. Mostrar Formulario de Pago Express Checkout](formulario-pago.md)
