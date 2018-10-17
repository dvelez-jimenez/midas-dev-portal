## 4. Consulta de Estado de la Transacción

Debes consultar el estado (state) de la transacción, para esto necesitas enviar el **access_token** (en el header de la petición) obtenido en la **Autenticación**, la **url self** obtenida en el [paso 2](intencion-de-pago-wp.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN'
```

Tambien puedes consultar el estado (state) de la transacción, para esto necesitas enviar el **access_token** (en el header de la petición) obtenido en la **Autenticación**, la **transaction.gateway_order** obtenida en el [paso 2](intencion-de-pago-wp.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{invoice_number} \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN'
```


Obtendrás una respuesta silimar a:

```
{
    "intent": "sale",
    "_id": "19a516df-b027-443e-be15-e44a41dbd94f",
    "application": "ff462a80-f2a8-1390-06cf-57d5f9728b8d",
    "redirect_urls": {
        "return_url": "https://peinau.azureedge.net/redirections/payment_success.html",
        "cancel_url": "https://chao.com"
    },
    "transaction": {
        "reference_id": "OD0000233",
        "gateway_order": "QP00009",
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
                    "tax": 0,
                    "_id": "5acce2cd8d0f81000f9c5f5b"
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
            "full_name": "Andres Roa",
            "email": "jlprueba1@quickpay.com"
        },
        "payment_method": "QUICKPAY_TOKEN"
    },
    "links": [
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/19a516df-b027-443e-be15-e44a41dbd94f",
            "rel": "self",
            "security": [
                "ApiKey"
            ],
            "method": "GET"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/19a516df-b027-443e-be15-e44a41dbd94f/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        }
    ],
    "id": "19a516df-b027-443e-be15-e44a41dbd94f",
    "create_at": "2018-04-10T16:14:05.309Z",
    "update_at": "2018-04-10T16:19:56.253Z",
    "state": "paid",
    "invoice_number": "INPA-0000012364",
    "gateway": {
        "orderId": "INPA-0000012364",
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
                "buy_order": "INPA-0000012364",
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


