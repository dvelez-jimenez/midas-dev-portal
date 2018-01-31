# API REST de Anulaciones / refund

Necesitas el **access_token** obtenido en la **Autenticación** y el **id de la intención de pago** generado en el **paso 4**, para ejecutar una petición a la **API de Anulación /refund** de la siguiente forma:

```
 curl -X POST 'https://api.sandbox.connect.fif.tech/payments/gateways/quickpay/token/{id}/refund' \
  -H 'authorization: Bearer access_token' \
  -H 'content-type: application/json' \
  -d '{
	"refunded_amount":"1000"
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
	"refund_amount":"100kj"
}'
```

Obtendrás una respuesta similar a:

```
{
    "error_code": "GW01_102",
    "error_description": "One or more fields in the request contains invalid data",
    "meta_data": {
        "error_details": {
            "refunded_amount": "100kj",
            "requestID": "5174059161376438504011",
            "decision": "REJECT",
            "reasonCode": "102",
            "invalidField": "c:grandTotalAmount",
            "requestToken": "Ahj/7wSTGHx+we56IkpLiiDBlYjWmcePKh2oc6DIopcIJKnGgClvHKnhjkwNjKPr6M2kmXoxXL8sQJyYw+PsvRVr6RhYkj1J"
        }
    }
}
```

Al consultar el estado de la transacción:

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
        "capture_token": "c6496332-7a67-9f15-be83-b48eee4eee0c"
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
                    "_id": "5a71c6abc68669000f63df09"
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
        },
        "gateway_order": "INPA-0000004014"
    },
    "payer": {
        "payer_info": {
            "documentType": "RUT",
            "documentNumber": "123123123",
            "country": "CL",
            "full_name": "Andres Roa",
            "email": "jlprueba2@quickpay.com"
        },
        "payment_method": "QUICKPAY_TOKEN"
    },
    "links": [],
    "id": "23dd4bb1-1597-c62c-6fa8-1a6f8b7c80a0",
    "create_time": "2018-01-31T13:37:48.116Z",
    "update_time": "2018-01-31T13:38:03.780Z",
    "state": "paid",
    "invoice_number": "INPA-0000004014",
    "gateway": {
        "installments_number": 3,
        "merchantReferenceCode": "INPA-0000004014",
        "requestID": "5174058833396417504011",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj//wSTGHx9l6KtfSMLiiDBlYjWmcePKh2oc6DIopcIJKnGgClwgkqcaEwNjKPr8MmkmXoxXL8sBgTkxh8fZeirX0jCwAAAwgdd",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "570110",
            "avsCode": "1",
            "authorizedDateTime": "2018-01-31T13:38:03Z",
            "processorResponse": "1",
            "reconciliationID": "02XFZ3GGJCZCNAHQ",
            "paymentNetworkTransactionID": "111222",
            "ownerMerchantID": "falabella2",
            "processorTransactionID": "5d633c05702e4099b1aad55000541819"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-31T13:38:03Z",
            "amount": "4500",
            "reconciliationID": "02XFZ3GGJCZCNAHQ"
        },
        "additionalProcessorResponse": "c1b317b9-92e2-4962-af34-94dc7c47a050",
        "capture_token": "c6496332-7a67-9f15-be83-b48eee4eee0c",
        "resume": {
            "_id": "5a71c6bb0f94ef000f1ce8f7",
            "card_number": {
                "pan_last4": 1111,
                "pan_first6": 411111
            },
            "authorizations": {
                "code": "570110"
            },
            "transaction": {
                "gateway_id": "5174058833396417504011",
                "type": "CREDIT",
                "date": "2018-01-31T13:38:03.776Z",
                "currency": "CLP",
                "buy_order": "INPA-0000004014",
                "amount": 4500,
                "installments_number": 3
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
