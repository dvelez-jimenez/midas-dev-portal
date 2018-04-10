## 4. Consulta de Estado de la Transacción

Debes consultar el estado (state) de la transacción, para esto necesitas enviar el **access_token** (en el header de la petición) obtenido en la **Autenticación**, la **url self** obtenida en el [paso 2](intencion-de-pago-express.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/19a516df-b027-443e-be15-e44a41dbd94f \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer REEMPLAZAR AQUI EL ACCESS TOKEN'
```
Obtendrás una respuesta silimar a:

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
        }
    ],
    "id": "19a516df-b027-443e-be15-e44a41dbd94f",
    "expiration_date": "2018-04-13T16:14:05.229Z",
    "create_time": "2018-04-10T16:14:05.309Z",
    "update_time": "2018-04-10T16:19:56.253Z",
    "state": "paid",
    "invoice_number": "INPA-0000012364",
    "gateway": {
        "capture_token": "9615786e-52c9-7733-39db-5bf5d600e5d6",
        "payment_flow": "express_checkout",
        "installments_number": "1",
        "merchantReferenceCode": "INPA-0000012364",
        "requestID": "5233771897036565504009",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj//wSTG7ktAqSOzeAJig9GgwYMGDlLi7x5j7AUuLvHmPsmBsZR+khk0ky3SA32gQMCcmN3JaBUkdm8ASAA4yx9",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "155328",
            "avsCode": "1",
            "cvCode": "3",
            "authorizedDateTime": "2018-04-10T16:19:56Z",
            "processorResponse": "0",
            "reconciliationID": "QP00009",
            "ownerMerchantID": "falabella_cl",
            "processorTransactionID": "eeda1fd175e8e86b582e8934290f4e5dbfb50ba05d7a968b8afb93277a97aa55"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-04-10T16:19:56Z",
            "amount": "4500",
            "reconciliationID": "QP00009"
        },
        "additionalProcessorResponse": "2d13b5c5-1159-406b-8eaa-17c00d50b24d",
        "capture_data": {
            "panFirst6": "411111",
            "panLast4": "1111"
        },
        "resume": {
            "_id": "5acce42c8d0f81000f9c5f5e",
            "card_number": {
                "pan_last4": "1111",
                "pan_first6": "411111"
            },
            "authorizations": {
                "code": "155328"
            },
            "transaction": {
                "gateway_id": "5233771897036565504009",
                "type": "CREDIT",
                "date": "2018-04-10T16:19:56.250Z",
                "currency": "CLP",
                "buy_order": "INPA-0000012364",
                "amount": 4500,
                "installments_number": 1
            },
            "response": {
                "code": 100
            }
        }
    }
}
```
Posibles estados de la transacción:
  
| State    | Definición                               |
| -------- | ---------------------------------------- |
| paid  | El cargo fue realizado exitosamente en la cuenta del cliente |
| rejected | El cargo no fue realizado |
| refunded | Tiene al menos una devolución asociada |


Si deseas hacer la devolución al cliente, debes llamar a [API de Anulación (**refund_method**)](../../anulaciones/introduccion.md).
