# ¿Cómo puedes consultar el estado de la transacción?

Debes llamar al self obtenido en la respuesta de la intención de pago de la siguiente forma:

```
curl -X GET \
  http://api.staging-v2.walmartdigital.cl/checkout/payments/{id} \
  -H 'authorization: access_token' \
 ```

Obtendrás una respuesta similar a:

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

# Ejemplo de Self rechazado

Enviando un id incorrecto

```
curl -X GET \
  http://api.staging-v2.walmartdigital.cl/checkout/payments/{id_incorrecto} \
  -H 'authorization: access_token' \
 ```

La respuesta obtenida es:
``` 
{
    "error_code": "DOCUMENT_NOT_FOUND",
    "error_description": "the document you requested is not found",
    "meta_data": {
        "id_not_found": "INPA-85001539720339417asd",
        "collection_name": "intention"
    }
}
```

* Status http **500**
* Glosa: **"DOCUMENT_NOT_FOUND"**
