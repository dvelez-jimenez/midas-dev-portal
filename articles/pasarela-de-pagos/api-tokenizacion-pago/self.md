# ¿Cómo puedes consultar el estado de la transacción?

Debes llamar al self obtenido en la respuesta de la intención de pago de la siguiente forma:

```
curl -X GET \
  https://api.test.peinau.fif.tech/checkout/payments/{id} \
  -H 'authorization: access_token' \
 ```

Obtendrás una respuesta similar a:

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "cb9268d1-d966-0ae4-0d6d-8909c078c3d7"
    },
    "application": "195d24b8-ff4b-1803-a405-cbcd5e8a8b7d",
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
                    "_id": "5a5ce2ca25d349000f7ed52e"
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
    "links": [],
    "id": "78f5a033-2b76-b20f-59dc-b624495db45c",
    "create_time": "2018-01-15T17:20:10.893Z",
    "update_time": "2018-01-15T17:20:47.003Z",
    "state": "paid",
    "invoice_number": "INPA-0000003441",
    "gateway": {
        "payment_flow": "with_token",
        "installments_number": "1",
        "merchantReferenceCode": "INPA-0000003441",
        "requestID": "5160368463946965504008",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj//wSTF75/oSfnCtAIiiDBlYjWmcqPKhWY82rXbJclx8ZUwClyXHxlTEwNjKPp8MmkmXoxXL8sBgTkxe+f6En5wrQCAAAA1QRt",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "570110",
            "avsCode": "1",
            "authorizedDateTime": "2018-01-15T17:20:46Z",
            "processorResponse": "1",
            "reconciliationID": "02XFZ3JGJBYGMUW6",
            "paymentNetworkTransactionID": "111222",
            "ownerMerchantID": "falabella2",
            "processorTransactionID": "745153081f0d48fd8c55e4926a948729"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-15T17:20:46Z",
            "amount": "4500",
            "reconciliationID": "02XFZ3JGJBYGMUW6"
        },
        "additionalProcessorResponse": "3fb78121-eff5-45ff-8337-b0ea038e54f8",
        "capture_token": "cb9268d1-d966-0ae4-0d6d-8909c078c3d7",
        "resume": {
            "_id": "5a5ce2ef25d349000f7ed530",
            "card_number": {
                "pan_last4": 1111,
                "pan_first6": 411111
            },
            "authorizations": {
                "code": "570110"
            },
            "transaction": {
                "gateway_id": "5160368463946965504008",
                "type": "CREDIT",
                "date": "2018-01-15T17:20:47.002Z",
                "currency": "CLP",
                "buy_order": "INPA-0000003441",
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

# Ejemplo de Self rechazado

Enviando un id incorrecto

```
curl -X GET \
  https://api.test.peinau.fif.tech/checkout/payments/{id_incorrecto} \
  -H 'authorization: access_token' \
 ```

La respuesta obtenida es: 
Status http *500*
Glosa: *"DOCUMENT_NOT_FOUND"*
