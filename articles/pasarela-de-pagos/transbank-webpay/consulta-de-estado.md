## 4. Consulta de Estado de la Transacción

Con la url **self** obtenida en el [paso 2](intencion-de-pago-wp.md) puedes consultar el estado de la transacción de la siguiente forma:

```curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: Bearer access_token
```

Donde access_token es el **token de acceso** generado en el [paso 1](obtener-token-acceso.md) y el **id** es el id de la intención de pago generado en el [paso 2](intencion-de-pago-wp.md).

Obtendrás una respuesta similar a:

```
{
    "intent": "sale",
    "application": "28adb999-7a2e-70b8-c092-e4c16a9e9e0a",
    "redirect_urls": {
        "return_url": "https://requestb.in/sfoogtsf",
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
                    "tax": 0,
                    "_id": "5a14412d3d3d6b001405ef48"
                }
            ],
            "shipping_address": {
                "line1": "Miraflores 222",
                "city": "Santiago",
                "country_code": "CL",
                "phone": "+56 9 1234 5674",
                "type": "HOME_OR_WORK",
                "recipient_name": "JL Prueba 1"
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
            "documentType": "RUT",
            "documentNumber": "123123123",
            "country": "CL",
            "full_name": "JL Prueba 1",
            "email": "jlprueba1@quickpay.com"
        },
        "payment_method": "TRANSBANK_WEBPAY"
    },
    "links": [],
    "id": "ffd9367d-5a9f-92de-fb24-0276a3156bf1",
    "create_time": "2017-11-21T15:07:26.024Z",
    "update_time": "2017-11-21T15:08:45.185Z",
    "state": "paid",
    "invoice_number": "INPA-50000000545",
    "gateway": {
        "accountingDate": "1121",
        "buyOrder": "INPA-50000000545",
        "cardDetail": {
            "cardNumber": "6623"
        },
        "detailOutput": [
            {
                "sharesNumber": 0,
                "amount": "4500",
                "commerceCode": "597020000541",
                "buyOrder": "INPA-50000000545",
                "authorizationCode": "1213",
                "paymentTypeCode": "VD",
                "responseCode": 0
            }
        ],
        "sessionId": "ffd9367d-5a9f-92de-fb24-0276a3156bf1",
        "transactionDate": "2017-11-21T15:07:44.204Z",
        "urlRedirection": "https://webpay3gint.transbank.cl/filtroUnificado/voucher.cgi",
        "VCI": "TSY"
    }
}
```
[Volver al inicio](../introduction.md)
