## 2. Intención de Pago

Para contiunar con el proceso de pago debes ingresar el **access_token** generado en el [paso 1](obtener-token-acceso.md) en el header de la petición y hacer el llamado de la siguiente forma:

```
curl -X POST 'https://api.sandbox.connect.fif.tech/checkout/payments' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN" \
 -d '{ 
{ 
   "intent": "sale", 
   "payer": { 
     "payer_info": { 
       "email": "jlprueba1@quickpay.com", 
       "full_name": "Andres Roa",
       "country": "CL",
       "documentNumber": "123123123",
       "documentType": "RUT"
     }, 
     "payment_method": "QUICKPAY_TOKEN"
   }, 
   "transaction": { 
     "reference_id": "OD0000233", 
     "gateway_order": "QP00009",
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
     "return_url": "https://peinau.azureedge.net/redirections/payment_success.html", 
     "cancel_url": "https://chao.com" 
   },
   "additional_attributes": {
  }
 }' | json_pp
```

Como respuesta obtendrás la siguiente información:

```
{
    "intent": "sale",
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
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/19a516df-b027-443e-be15-e44a41dbd94f/edit",
            "rel": "update_url",
            "method": "PUT"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/19a516df-b027-443e-be15-e44a41dbd94f/silent",
            "rel": "silent_charge",
            "security": [
                "Jwt"
            ],
            "method": "POST"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/19a516df-b027-443e-be15-e44a41dbd94f/refund",
            "rel": "refund_method",
            "security": [
                "Jwt"
            ],
            "method": "POST"
        },
        {
            "href": "https://api.sandbox.connect.fif.tech/checkout/payments/QP00009",
            "rel": "self_by_gateway_order",
            "security": [
                "ApiKey"
            ],
            "method": "GET"
        }
    ],
    "id": "19a516df-b027-443e-be15-e44a41dbd94f",
    "expiration_date": "2018-04-13T16:14:05.229Z",
    "create_time": "2018-04-10T16:14:05.309Z",
    "update_time": "2018-04-10T16:14:05.309Z",
    "state": "created",
    "invoice_number": "INPA-0000012364"
}
```

Obtendrás los Links:

- **self**: desde esta URL puedes consultar la información del pago.
- **approval_url**: debes desplegar esta URL al cliente para que pueda continuar con el pago.
- **refund_method**: te permite anular la transacción.
- **self_by_gateway_order**: desde esta URL también puedes consultar la información del pago utilizando el gateway_order.

Ir al paso [3. Mostrar Formulario de Pago Express Checkout](formulario-express-checkout.md)
