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
        "capture_token": "58dcdf04-8f18-9159-503d-2f7928cb072e"
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
                    "_id": "5a71dfadc68669000f63df0d"
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
        "gateway_order": "INPA-0000004016"
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
    "id": "fa780805-223b-2679-cc05-11e54c42b2c3",
    "create_time": "2018-01-31T15:24:29.573Z",
    "update_time": "2018-01-31T15:25:02.814Z",
    "state": "refunded",
    "invoice_number": "INPA-0000004016",
    "gateway": {
        "refunded_amount": "1000",
        "merchantReferenceCode": "INPA-0000004016",
        "requestID": "5174123027446613604012",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj/7wSTGH1hp8i0HvasiiDBlYjWmcWPKh2odODViJb5Pf7egClvk9/uIEwK+h9fhk0ky9GK5fliBOTGH1g8w7SqEvqAXgPw",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccCreditReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-31T15:25:02Z",
            "amount": "1000",
            "reconciliationID": "02XFZ3EGJCZCSAUD"
        }
    }
}
```
| State    | Definición                               |
| -------- | ---------------------------------------- |
| refunded | La devolución se completó exitosamente   |

Al consultar el estado de la transacción (self):

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: access_token' \
 ```

Obtendrás una respuesta similar a:

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "58dcdf04-8f18-9159-503d-2f7928cb072e"
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
                    "_id": "5a71dfadc68669000f63df0d"
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
        "gateway_order": "INPA-0000004016"
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
    "id": "fa780805-223b-2679-cc05-11e54c42b2c3",
    "create_time": "2018-01-31T15:24:29.573Z",
    "update_time": "2018-01-31T15:25:02.814Z",
    "state": "refunded",
    "invoice_number": "INPA-0000004016",
    "gateway": {
        "refunded_amount": "1000",
        "merchantReferenceCode": "INPA-0000004016",
        "requestID": "5174123027446613604012",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj/7wSTGH1hp8i0HvasiiDBlYjWmcWPKh2odODViJb5Pf7egClvk9/uIEwK+h9fhk0ky9GK5fliBOTGH1g8w7SqEvqAXgPw",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccCreditReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-31T15:25:02Z",
            "amount": "1000",
            "reconciliationID": "02XFZ3EGJCZCSAUD"
        }
    }
}
```

## Ejemplo de Anulación fallida

En este caso enviamos la solicitud de anulación enviando letras en el refunded_ amount para generar el error.

Necesitas el **access_token** obtenido en la **Autenticación** y el **id de la intención de pago** generado en el **paso 4**, para ejecutar una petición a la **API de Anulación /refund** de la siguiente forma:

```
 curl -X POST 'https://api.sandbox.connect.fif.tech/payments/gateways/quickpay/token/{id}/refund' \
  -H 'authorization: Bearer access_token' \
  -H 'content-type: application/json' \
  -d '{
	"refunded_amount":"100kj"
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

Al consultar el estado de la transacción (self):

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: access_token' \
 ```

Obtendrás una respuesta similar a:

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "614e675f-8265-b53d-7d90-7c219d804574"
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
                    "_id": "5a720eba0f94ef000f1ce90c"
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
        "gateway_order": "INPA-0000004026"
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
    "id": "74dd75bc-56d2-aa75-95e7-be921fb2da38",
    "create_time": "2018-01-31T18:45:14.111Z",
    "update_time": "2018-01-31T18:45:24.786Z",
    "state": "paid",
    "invoice_number": "INPA-0000004026",
    "gateway": {
        "installments_number": 3,
        "merchantReferenceCode": "INPA-0000004026",
        "requestID": "5174243244016963304012",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj//wSTGH8MwB4n7jpMiiERpHmUZkGFKiMZTS1WZKNPiqNTJAVGnxVGpkkwNjKPr8MmkmXoxXL8sBgTkxh/DMAeJ+46TAAA6QQU",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "570110",
            "avsCode": "1",
            "authorizedDateTime": "2018-01-31T18:45:24Z",
            "processorResponse": "1",
            "reconciliationID": "D4GLQLABJD1J4ZV2",
            "paymentNetworkTransactionID": "111222",
            "ownerMerchantID": "falabella2",
            "processorTransactionID": "3d8c62c368e84e74ae65320a215d0c04"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-31T18:45:24Z",
            "amount": "4500",
            "reconciliationID": "D4GLQLABJD1J4ZV2"
        },
        "additionalProcessorResponse": "b67c21db-8200-43bf-8c68-6de58ac5e79f",
        "capture_token": "614e675f-8265-b53d-7d90-7c219d804574",
        "resume": {
            "_id": "5a720ec4c68669000f63df22",
            "card_number": {
                "pan_last4": 1111,
                "pan_first6": 411111
            },
            "authorizations": {
                "code": "570110"
            },
            "transaction": {
                "gateway_id": "5174243244016963304012",
                "type": "CREDIT",
                "date": "2018-01-31T18:45:24.785Z",
                "currency": "CLP",
                "buy_order": "INPA-0000004026",
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

> Los refund rechazados siempre tendrán un http code mayor o igual a 400.

[Listado de errores para Refund](errores-refund.md)
  
[Volver al menú anterior](../pasarela-de-pagos/api-tokenizacion-pago/introduction.md)
