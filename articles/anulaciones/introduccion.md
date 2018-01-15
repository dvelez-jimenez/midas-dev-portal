# API REST de Anulaciones

Necesitas el **access_token** obtenido en la **Autenticación** y el **id de la intención de pago** generado en el **paso 4**, para ejecutar una petición a la **API de Anulación /refund** de la siguiente forma:

```
 curl -X POST 'https://api.sandbox.connect.fif.tech/payments/gateways/quickpay/token/{id}/refund' \
  -H 'authorization: Bearer access_token' \
  -H 'content-type: application/json' \
  -d '{
	"refund_amount":"1000"
}'
```

Obtendrás una respuesta similar a:

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "5d90b091-d9a3-429b-5faf-46150ebb64eb"
    },
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
                    "_id": "5a294a3f4bddb8000f673eff"
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
    "id": "5dbe2208-c819-4f0e-d4fd-d451d479fef2",
    "create_time": "2017-12-07T14:03:43.534Z",
    "update_time": "2017-12-07T14:06:54.530Z",
    "state": "refunded",
    "invoice_number": "INPA-50000000901",
    "gateway": {
        "refund_amount": "1000",
        "merchantReferenceCode": "INPA-50000000901",
        "requestID": "5126556142216262304009",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj77wSTFelCIa/pQcEJilF5MPYrQAKi8mHsapCYFfQ5WwyaSZbpAcBfbAnJivSe7384Y3wEAAAA2QbX",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccCreditReply": {
            "reasonCode": "100",
            "requestDateTime": "2017-12-07T14:06:54Z",
            "amount": "1000"
        },
        "message": "payment refunded"
    }
}
```
| State    | Definición                               |
| -------- | ---------------------------------------- |
| refunded | La devolución se completó exitosamente   |

**Ejemplo de Anulación fallida**

En este caso enviamos la solicitud de anulación por un monto mayor al de la compra.

Necesitas el **access_token** obtenido en la **Autenticación** y el **id de la intención de pago** generado en el **paso 4**, para ejecutar una petición a la **API de Anulación /refund** de la siguiente forma:

```
 curl -X POST 'https://api.sandbox.connect.fif.tech/payments/gateways/quickpay/token/{id}/refund' \
  -H 'authorization: Bearer access_token' \
  -H 'content-type: application/json' \
  -d '{
	"refund_amount":"10000"
}'
```

Obtendrás una respuesta similar a:

```
{
    "reversal_amount": "10000",
    "requestID": "5160368849236752404011",
    "decision": "ERROR",
    "reasonCode": "150",
    "requestToken": "Ahj/7wSTF76A/5Mr7Q4riiDBlYjWmcqPKhWY82rXbJclx8ZUwClyXHxmNkwOnEH08ADSTL0Yrl+WIE5MXvn+hJ+cK0Ag/Sjj",
    "ccCreditReply": {
        "reasonCode": "150"
    },
    "message": "CYBERSOURCE_CREDIT_FAILED"
}
```

Al consultar el estado de la transacción:

```
curl -X GET \
  https://api.test.peinau.fif.tech/checkout/payments/7{id} \
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

Podrás observar que el **state** de la transacción continúa siendo **paid** debido a que la anulación no fue procesada.
  
[Volver al menú anterior](../pasarela-de-pagos/api-tokenizacion-pago/introduction.md)
