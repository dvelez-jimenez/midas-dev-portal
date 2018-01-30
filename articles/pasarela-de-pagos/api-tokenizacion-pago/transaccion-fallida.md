# Ejemplo de transacción fallida

En este caso enviamos el token de una tarjeta vencida en la petición de la intención de pago.

Necesitas el **access_token** obtenido en la **Autenticación** y la **url silent charge** obtenida en el [paso 4](intencion-de-pago.md) para ejecutar una llamada a la **API de Silent Charge /silent** de la siguiente forma:

```
 curl -v -X POST 'https://api.sandbox.connect.fif.tech/checkout/payments/gateways/quickpay/token/25c30852-33ae-927a-02c9-80bc6c9afb74/silent' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token"
 -d '{
	"installments_number": 36
}'
```
Obtendras una respuesta similar a:

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "e246c3a8-da94-8394-d9f7-77d8445b9d46"
    },
    "application": "28adb999-7a2e-70b8-c092-e4c16a9e9e0a",
    "redirect_urls": {
        "return_url": "https://peinau.azureedge.net/redirections/payment_success.html",
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
                    "_id": "5a541a1adef5c0001432d1c1"
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
    "links": [],
    "id": "b81f9f63-3a21-2528-59cf-65614071da78",
    "create_time": "2018-01-09T01:25:46.942Z",
    "update_time": "2018-01-09T01:26:13.198Z",
    "state": "rejected",
    "invoice_number": "INPA-50000001456",
    "gateway": {
        "merchantReferenceCode": "INPA-50000001456",
        "requestID": "5154611727996227304008",
        "decision": "REJECT",
        "reasonCode": "202",
        "requestToken": "Ahj77wSTF26bmE8lkjpIilGnxJBrwgKjT4kg14SYGxlH0hMrSTL0Yrl+WAE5MXbpuYTyWSOkgAAAywvw",
        "ccAuthReply": {
            "reasonCode": "202"
        },
        "error": {
            "error_code": "202"
            "error_description": "CYBERSOURCE: Expired card"
        },
        "amount": 4500,
        "capture_token": "e246c3a8-da94-8394-d9f7-77d8445b9d46"
    }
}
```

Cuando el resultado del pago es fallido, el campo state de la respuesta tendrá el valor **rejected** y será posible ver el detalle en **gateway.error**.
