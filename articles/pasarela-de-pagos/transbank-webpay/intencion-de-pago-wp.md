## 2. Intención de Pago

Para contiunar con el proceso de pago debes ingresar el **access_token** generado en el [paso 1](obtener-token-acceso.md) y hacer el llamado de la siguiente forma:

```
curl -X POST 'https://api.sandbox.connect.fif.tech/checkout/payments' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token" \
 -d '{ 
   "intent": "sale", 
   "payer": { 
     "payer_info": { 
       "email": "jlprueba1@quickpay.com", 
       "full_name": "JL Prueba 1",
       "country": "CL",
       "documentNumber": "123123123",
       "documentType": "RUT"
     }, 
     "payment_method": "TRANSBANK_WEBPAY"
   }, 
   "transaction": { 
     "gateway_order": "PEI00000000000000020",
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
         "recipient_name": "JL Prueba 1" 
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
     "return_url": "https://requestb.in/sfoogtsf", 
     "cancel_url": "https://chao.com" 
   } 
 }' | json_pp
```

Como respuesta obtendrás la siguiente información:

```
{
    "application": "5ae72af3b6a973000fabfd35",
    "_id": "5b27c6b9e95b680015c7171c",
    "redirect_urls": {
        "return_url": "http://portal.sandbox.connect.fif.tech",
        "cancel_url": "http://portal.sandbox.connect.fif.tech"
    },
    "transaction": {
        "gateway_order": "PEI00000000000000020",
        "reference_id": "OD0000233",
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
            "document_type": "RUT",
            "document_number": "107872388",
            "country": "CL",
            "full_name": "Andres Roa",
            "email": "aroa@gmail.com"
        },
        "payment_method": "TRANSBANK_WEBPAY"
    },
    "links": [
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/5b27c6b9e95b680015c7171c",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/transbank/webpay/5b27c6b9e95b680015c7171c/pay",
            "rel": "approval_url",
            "method": "REDIRECT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/5b27c6b9e95b680015c7171c/edit",
            "rel": "update_url",
            "method": "PUT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/Numero_unico",
            "rel": "self_by_gateway_order",
            "method": "GET"
        }
    ],
    "update_time": "2018-06-18T14:50:33.919Z",
    "create_time": "2018-06-18T14:50:33.919Z",
    "invoice_number": "INPA-1529333433919",
    "state": "created",
    "intent": "sale",
    "id": "5b27c6b9e95b680015c7171c"
}
```

Obtendrás los Links:

- **self**: desde esta URL puedes consultar la información de la captura.
- **approval_url**: debes desplegar esta URL al cliente para que pueda continuar con el pago (formulario Webpay).
- **update_url**: te permite actualizar la intención de pago siempre y cuando esta se encuentre en **state:created**.

Ir al paso [3. Mostrar Formulario de Pago Transbank Webpay](formulario-pago-transbank.md)
