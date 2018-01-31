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

Al consultar el estado de la transacción (self):

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/{id} \
  -H 'authorization: access_token' \
 ```

Obtendrás una respuesta similar a:

```
{  
   "intent":"sale",
   "additional_attributes":{  
      "capture_token":"c6496332-7a67-9f15-be83-b48eee4eee0c"
   },
   "application":"195d24b8-ff4b-1803-a405-cbcd5e8a8b7d",
   "redirect_urls":{  
      "return_url":"https://requestb.in/sfoogtsf",
      "cancel_url":"https://chao.com"
   },
   "transaction":{  
      "reference_id":"OD0000233",
      "description":"Transaction detailed description",
      "soft_descriptor":"Short Description",
      "item_list":{  
         "shipping_method":"DIGITAL",
         "items":[  
            {  
               "sku":"1231232",
               "name":"Destornillador 2344",
               "description":"Destornillador SCL - ONT",
               "quantity":1,
               "price":4500,
               "tax":0,
               "_id":"5a71c6abc68669000f63df09"
            }
         ],
         "shipping_address":{  
            "line1":"Miraflores 222",
            "city":"Santiago",
            "country_code":"CL",
            "phone":"+56 9 1234 5674",
            "type":"HOME_OR_WORK",
            "recipient_name":"Andres Roa"
         }
      },
      "amount":{  
         "currency":"CLP",
         "total":4500,
         "details":{  
            "subtotal":810,
            "tax":190,
            "shipping":0,
            "shipping_discount":0
         }
      },
      "gateway_order":"INPA-0000004014"
   },
   "payer":{  
      "payer_info":{  
         "documentType":"RUT",
         "documentNumber":"123123123",
         "country":"CL",
         "full_name":"Andres Roa",
         "email":"jlprueba2@quickpay.com"
      },
      "payment_method":"QUICKPAY_TOKEN"
   },
   "links":[  

   ],
   "id":"23dd4bb1-1597-c62c-6fa8-1a6f8b7c80a0",
   "create_time":"2018-01-31T13:37:48.116Z",
   "update_time":"2018-01-31T15:13:53.784Z",
   "state":"refunded",
   "invoice_number":"INPA-0000004014",
   "gateway":{  
      "refunded_amount":"1000",
      "merchantReferenceCode":"INPA-0000004014",
      "requestID":"5174116336326044504008",
      "decision":"ACCEPT",
      "reasonCode":"100",
      "requestToken":"Ahj/7wSTGH1J4j7Lc0/IiiDBlYjWmcePKh2oc6DIopcIJKnGgClwCxV6fkwK+h9fhk0ky9GK5fliBOTGHx9l6KtfSMLASxr/",
      "purchaseTotals":{  
         "currency":"CLP"
      },
      "ccCreditReply":{  
         "reasonCode":"100",
         "requestDateTime":"2018-01-31T15:13:53Z",
         "amount":"1000",
         "reconciliationID":"02XFZ3GGJCZCNAHQ"
      }
   }
}
```

Podrás observar que el **state** de la transacción continúa siendo **paid** debido a que la anulación no fue procesada.
  
[Volver al menú anterior](../pasarela-de-pagos/api-tokenizacion-pago/introduction.md)
