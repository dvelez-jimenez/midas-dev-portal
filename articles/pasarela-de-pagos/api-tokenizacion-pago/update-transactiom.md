## ¿Cómo actualizar una intención de pago?

Necesitas el **access_token** obtenido en la **Autenticación** y el **id (Token de la tarjeta)** generado en la **Intención de captura**, para ejecutar una llamada a la **API de actualización /edit** de la siguiente forma:

```
 curl -v -X PUT 'https://api.sandbox.connect.fif.tech/checkout/payments/{Token_de_tarjeta}/edit' \
  
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token"
 -H 'postman-token: 1afaef16-88d9-dd06-bbbc-504eb1519161' \
 -d '{
"transaction": {
"item_list": {
"shipping_method": "DIGITAL",
"shipping_address":
{ "line1": "General Carol Urzua 7030, Depto 302B", "city": "Santiago", "country_code": "CL", "phone": "+56 9 8762 1244", "type": "HOME_OR_WORK", "recipient_name": "Jhon Doe Son" }
},
"amount": {
"currency": "CLP",
"total": 2000,
"details":
{ "subtotal": 2000, "tax": 0, "shipping": 0, "shipping_discount": 0 }
}
}
}'
 
```
Obtendras una respuesta similar a:

```
{
    "transaction": {
        "item_list": {
            "shipping_method": "DIGITAL",
            "items": [],
            "shipping_address": {
                "line1": "General Carol Urzua 7030, Depto 302B",
                "city": "Santiago",
                "country_code": "CL",
                "phone": "+56 9 8762 1244",
                "type": "HOME_OR_WORK",
                "recipient_name": "Jhon Doe Son"
            }
        },
        "amount": {
            "currency": "CLP",
            "total": 2000,
            "details": {
                "subtotal": 2000,
                "tax": 0,
                "shipping": 0,
                "shipping_discount": 0
            }
        },
        "reference_id": "OD0000233",
        "description": "Transaction detailed description",
        "soft_descriptor": "Short Description"
    },
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "a2797df2-c3b6-03d8-dabf-58ea0f73fcfe"
    },
    "application": "28adb999-7a2e-70b8-c092-e4c16a9e9e0a",
    "redirect_urls": {
        "return_url": "https://requestb.in/sfoogtsf",
        "cancel_url": "https://chao.com"
    },
    "payer": {
        "payer_info": {
            "documentType": "RUT",
            "documentNumber": "123123123",
            "country": "CL",
            "full_name": "Andres Roa",
            "email": "jlprueba1@quickpay.com"
        },
        "payment_method": "QUICKPAY_TOKEN"
    },
    "links": [],
    "id": "5e14bca9-37b5-faa6-1c79-84aa7a89a9ae",
    "create_time": "2017-12-13T20:35:41.418Z",
    "update_time": "2017-12-13T20:40:46.116Z",
    "state": "created",
    "invoice_number": "INPA-50000000978"
}

```
