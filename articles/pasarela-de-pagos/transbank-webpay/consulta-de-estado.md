## 4. Consulta de Estado de la Transacción

Debes consultar el estado (state) de la transacción, para esto necesitas enviar el **access_token** (en el header de la petición) obtenido en la **Autenticación**, la **url self** obtenida en el [paso 2](intencion-de-pago-wp.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  http://api.staging-v2.walmartdigital.cl/checkout/payments/{id} \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN'
```

Tambien puedes consultar el estado (state) de la transacción, para esto necesitas enviar el **access_token** (en el header de la petición) obtenido en la **Autenticación**, la **transaction.gateway_order** obtenida en el [paso 2](intencion-de-pago-wp.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  http://api.staging-v2.walmartdigital.cl/checkout/payments/{invoice_number} \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN'
```


Obtendrás una respuesta silimar a:

```
{
    "_id": "5bc6449365a8b10028f43369",
    "intent": "sale",
    "additional_attributes": {
        "client_id": "163875586",
        "channel": "EC-GR-D",
        "local_id": "83",
        "shipping_groups": [
            {
                "id": "sg8008480046",
                "date": "20180906",
                "interval": "900-21:1000",
                "amount": "4500",
                "local_id": "83"
            }
        ]
    },
    "application": "5b635b3b71cd29001c5043ae",
    "redirect_urls": {
        "return_url": "http://localhost:8081/payments/static_redirection.html",
        "cancel_url": "http://localhost:8081/payments/static_redirection.html"
    },
    "transaction": {
        "gateway_order": "INPA-85001539720339417",
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
            "href": "http://api.staging-v2.walmartdigital.cl/checkout/payments/5bc6449365a8b10028f43369",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "http://api.staging-v2.walmartdigital.cl/checkout/payments/gateways/eve/presto/5bc6449365a8b10028f43369/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        }
    ],
    "updated_at": "2018-10-16T20:06:36.418Z",
    "created_at": "2018-10-16T20:05:39.417Z",
    "invoice_number": "INPA-85001539720339417",
    "state": "paid",
    "id": "5bc6449365a8b10028f43369",
    "gateway": {
        "orderId": "INPA-85001539720339417",
        "codRespuesta": "0",
        "medioPago": "PRESTO",
        "codTransaccion": "714810",
        "codAutorizacion": "999999",
        "idSesion": "",
        "montoTransaccion": "4500",
        "numCuotas": "0",
        "fechaTransaccion": "20181016",
        "horaTransaccion": "170457",
        "tipoTransaccion": "TR_NORMAL",
        "tipoPago": "VC",
        "resTransaccion": "DUMMY-EXITO",
        "digitosTc": "",
        "fechaContable": "20181016",
        "commercialCode": "714",
        "firma": "455492897152fb28dab23f104abc3d47feab9dd6915790e9a3e5c823bbeca6a9",
        "resume": {
            "response": {
                "code": 0
            },
            "transaction": {
                "installments_number": 0,
                "amount": 4500,
                "buy_order": "INPA-85001539720339417",
                "currency": "CLP",
                "date": "2018-10-16T20:06:36.417Z",
                "type": "CREDIT",
                "gateway_id": "714810"
            },
            "authorizations": {
                "code": "999999"
            },
            "_id": "5bc644cc65a8b10028f4336c"
        }
    }
}
```
Posibles estados de la transacción hasta este punto:
  
| State    | Definición                               |
| -------- | ---------------------------------------- |
| paid     | El cargo fue realizado exitosamente en la cuenta del cliente |
| rejected | El cargo no fue realizado |


