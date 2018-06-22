## 4. Consulta de Estado de la Transacción

Con la url **self** obtenida en el [paso 2](intencion-de-pago-wp.md) puedes consultar el estado de la transacción de la siguiente forma:

```curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: Bearer access_token
```

> Donde access_token es el **token de acceso** generado en el [paso 1](obtener-token-acceso.md) y el **id** es el id de la intención de pago generado en el [paso 2](intencion-de-pago-wp.md).

Obtendrás una respuesta similar a:

```
{
    "_id": "5b2d271b2246c1001537ea8f",
    "application": "5ae72af3b6a973000fabfd35",
    "gateway": {
        "accountingDate": "0622",
        "buyOrder": "PEI001",
        "cardDetail": {
            "cardNumber": "6623"
        },
        "detailOutput": [
            {
                "sharesNumber": 0,
                "amount": "1000",
                "commerceCode": "597020000541",
                "buyOrder": "PEI001",
                "authorizationCode": "1213",
                "paymentTypeCode": "VD",
                "responseCode": 0
            }
        ],
        "sessionId": "5b2d271b2246c1001537ea8f",
        "transactionDate": "2018-06-22T16:43:19.023Z",
        "urlRedirection": "https://webpay3gint.transbank.cl/filtroUnificado/voucher.cgi",
        "VCI": "TSY",
        "transaction_token": "e5676d18a2523c0bb0bcc3ff73cc3bb3620e88afb5bf8fdbe08609c5ff4afa69",
        "resume": {
            "response": {
                "code": 0
            },
            "transaction": {
                "installments_number": 0,
                "amount": 1000,
                "buy_order": "PEI001",
                "currency": "CLP",
                "date": "2018-06-22T16:44:11.541Z",
                "type": "DEBIT",
                "gateway_id": "5b2d271b2246c1001537ea8f"
            },
            "authorizations": {
                "code": "1213"
            },
            "card_number": {
                "pan_last4": "6623"
            },
            "_id": "5b2d275b2246c1001537ea90"
        }
    },
    "additional_attributes": {
        "reconciliation_unique_number": "PEI001"
    },
    "redirect_urls": {
        "return_url": "https://peinau.azureedge.net/redirections/payment_success.html",
        "cancel_url": "http://portal.sandbox.connect.fif.tech"
    },
    "transaction": {
        "gateway_order": "INPA-1529685787553",
        "reference_id": "OC",
        "description": "Transaction detailed description",
        "soft_descriptor": "Transaction Short description",
        "item_list": {
            "shipping_method": "DIGITAL",
            "items": [
                {
                    "thumbnail": "http://portal.sandbox.connect.fif.tech/bundles/app/css/images/e-commerce-demo/product-icon.png",
                    "sku": "TRK345-2",
                    "name": "Flight 2344",
                    "description": "Flight SCL - ONT",
                    "quantity": 2,
                    "price": 500,
                    "tax": 0
                }
            ],
            "shipping_address": {
                "line1": "General Carol Urzua 1020, Depto 102A",
                "city": "Santiago",
                "country_code": "CL",
                "phone": "+56 9 8762 1244",
                "type": "HOME_OR_WORK",
                "recipient_name": "Jhon Doe Son"
            }
        },
        "amount": {
            "currency": "CLP",
            "total": 1000,
            "details": {
                "subtotal": 1000,
                "tax": 0,
                "shipping": 0,
                "shipping_discount": 0
            }
        }
    },
    "payer": {
        "payer_info": {
            "email": "decontreras@falabella.cl",
            "full_name": "Andres Roa",
            "country": "CL",
            "document_number": "107872388",
            "document_type": "RUT"
        },
        "payment_method": "TRANSBANK_WEBPAY"
    },
    "links": [
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/5b2d271b2246c1001537ea8f",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/transbank/webpay/5b2d271b2246c1001537ea8f/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/5b2d271b2246c1001537ea8f/edit",
            "rel": "update_url",
            "method": "PUT"
        }
    ],
    "update_time": "2018-06-22T16:44:11.542Z",
    "create_time": "2018-06-22T16:43:07.553Z",
    "invoice_number": "INPA-1529685787553",
    "state": "paid",
    "intent": "sale",
    "id": "5b2d271b2246c1001537ea8f"
}
```
[Volver al inicio](introduction.md)
