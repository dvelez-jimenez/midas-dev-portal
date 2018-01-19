## 5. ¿Cómo realizar el cargo a la tarjeta?

Te ofrecemos dos opciones para realizar el cargo a la tarjeta del cliente, a continuación podrás ver el detalle de cada una: 

### 5.1 Approval

Si quieres utilizar esta opción, necesitas que el cliente apruebe el pago para ejecutar el cargo a la tarjeta de crédito. Para ello debes desplegar la ventana de aprobación del pago a partir de la **approval_url** obtenida en el [paso 4](intencion-de-pago.md).

![Ejemplo Approval](images/approval-1.png)

Debes consultar el estado (state) de la transacción, para esto necesitas el **access_token** obtenido en la **Autenticación**, la **url self** obtenida en el [paso 4](intencion-de-pago.md) y ejecutar la consulta de la siguiente forma:

```
curl -X GET \
  https://api.sandbox.connect.fif.tech/checkout/payments/5247451f-e709-bc97-b195-8725f5e5d09a \
  -H 'cache-control: no-cache' \
  -H 'Authorization: Bearer access_token'
```
Obtendrás una respuesta silimar a:

  ```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "db95da9e-b94c-0b40-a84b-4268b0ca18bb"
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
                    "_id": "5a29af7f6867b6000fe42a45"
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
    "id": "5247451f-e709-bc97-b195-8725f5e5d09a",
    "create_time": "2017-12-07T21:15:43.690Z",
    "update_time": "2017-12-07T21:16:02.340Z",
    "state": "paid",
    "invoice_number": "INPA-50000000915",
    "gateway": {
        "payment_flow": "with_token",
        "installments_number": "1",
        "merchantReferenceCode": "INPA-50000000915",
        "requestID": "5126813618226081704008",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj7/wSTFezU3sEAuihIilF5MQdkMgKi8mIOyGSYGxlHK2GTSTLdIDgL7QwJyYr2am9ggF0UJAAAjAl3",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "570110",
            "avsCode": "1",
            "authorizedDateTime": "2017-12-07T21:16:02Z",
            "processorResponse": "1",
            "paymentNetworkTransactionID": "111222",
            "ownerMerchantID": "falabella",
            "processorTransactionID": "6073acd1ed184b8cb4a85d8a68d778de"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2017-12-07T21:16:02Z",
            "amount": "4500"
        },
        "additionalProcessorResponse": "c7f3fc27-eb83-44f0-8429-5bf6918198a3",
        "capture_token": "db95da9e-b94c-0b40-a84b-4268b0ca18bb",
        "resume": {
            "_id": "5a29af926867b6000fe42a47",
            "card_number": {
                "panLast4": 1111
            },
            "authorizations": {
                "code": "570110"
            },
            "transaction": {
                "type": "CREDIT",
                "date": "2017-12-07T21:16:02.337Z",
                "currency": "CLP",
                "buy_order": "INPA-50000000915",
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
| reversed | Tiene al menos una devolución asociada |

### 5.2 Silent Charge

Con esta opción, no es requerida la aprobación del cliente para ejecutar el cargo a la tarjeta de crédito.

Necesitas el **access_token** obtenido en la **Autenticación** y la **url silent charge** obtenida en el [paso 4](intencion-de-pago.md) para ejecutar una llamada a la **API de Silent Charge /silent** de la siguiente forma:

```
curl -v -X PUT 'https://api.sandbox.connect.fif.tech/checkout/payments/{id}/silent' \
  
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token"
 -d '{  
   	"installments_number": 36,
     }'
 
```

[Si necesitas actualizar los datos del pago](silent-charge-update.md)

Obtendrás una respuesta en formato json. Dicha respuesta contendrá toda la información que previamente has enviado a la intención de pago y dependiendo del resultado del pago, se agrega lo siguiente:

Si el pago fue exitoso, verás el campo **state** con valor **paid** y un objeto llamado **gateway** que contiene la totalidad de información del pago exitoso. Esta información puede variar en formato dependiendo del gateway de pago utilizado. Dentro de **gateway**, verás el objeto llamado **resume**, el cual siempre tendrá la misma estructura y tus sistemas podrán utilizarlo siempre para obtener la información del pago.

Posibles estados de la transacción:

| State    | Definición                               |
| -------- | ---------------------------------------- |
| paid  | El cargo fue realizado exitosamente en la cuenta del cliente |
| rejected | Transacción fallida. El cargo no fue realizado |
| reversed | Tiene al menos una devolución asociada |

**Pago exitoso**
Descripción de los campos que deben utilizar tus sistemas para obtener la respuesta del pago

| Nombre    | Descripción                               |Tipo|
| -------- | ---------------------------------------- |-------|
| state  | Identifica el estado del pago |enum|
| gateway  | Identifica el grupo de campos con la información detallada del pago exitoso |object|
| gateway.resume | resumen de la información del pago exitoso |object|
| gateway.resume.id | Identificador interno de la aplicación |string|
| gateway.resume.card_number | datos del PAN truncado |object|
| gateway.resume.card_number.pan_last4 | Últimos 4 dígitos del PAN |number|
| gateway.resume.card_number.pan_first6 | Primeros 6 dígitos del PAN |number|
| gateway.resume.authorizations | Información del código de autorización |object|
| gateway.resume.authorizations.code | Código de autorización |string|
| gateway.resume.transaction | Datos de la transacción |object|
| gateway.resume.transaction.gateway_id | Identificador interno de la aplicación |string|
| gateway.resume.transaction.type | Tipo de transacción |enum (CREDIT / DEBIT)|
| gateway.resume.transaction.date | Fecha y hora de registro de transacción en el gateway |string|
| gateway.resume.transaction.currency | Tipo moneda |string|
| gateway.resume.transaction.buy_order | Número de la orden de compra que el comercio envio en el campo **transaction.gateway_order** de la intención de pago |string|
| gateway.resume.transaction.amount | Monto total de la compra que el comercio envió en el campo **transaction.amount.total** de la intención de pago |number|
| gateway.resume.transaction.installments_number | Número de cuotas que el comercio envió en el campo **installments_number** del silent charge |number|
| gateway.resume.response | Infromación del código de respuesta entregado por el gateway |object|
| gateway.resume.response.code | Código de respuesta entregado por el gateway |number|

Ejemplo de respuesta Silent charge (Json completo): 

```
{
    "intent": "sale",
    "additional_attributes": {
        "capture_token": "13b7c0f0-619b-ccf2-83e5-f33bcf2c4cd1"
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
                    "_id": "5a5ccf5f79c83f0014632599"
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
    "id": "aedac5dc-49a2-87db-e373-aa44675951a7",
    "create_time": "2018-01-15T15:57:20.191Z",
    "update_time": "2018-01-15T15:57:42.622Z",
    "state": "paid",
    "invoice_number": "INPA-50000001613",
    "gateway": {
        "installments_number": 36,
        "merchantReferenceCode": "INPA-50000001613",
        "requestID": "5160318622226245704012",
        "decision": "ACCEPT",
        "reasonCode": "100",
        "requestToken": "Ahj//wSTF73Ojl/8i1lMiiDBlYjWmciPKhWY82VamJcW4Q6B4ClxbhDoHkwNjKPp8MmkmXoxXL8sBgTkxe9zo5f/ItZTAAAA+hPE",
        "purchaseTotals": {
            "currency": "CLP"
        },
        "ccAuthReply": {
            "reasonCode": "100",
            "amount": "4500",
            "authorizationCode": "570110",
            "avsCode": "1",
            "authorizedDateTime": "2018-01-15T15:57:42Z",
            "processorResponse": "1",
            "reconciliationID": "02XFZ3HGJBYGMJZL",
            "paymentNetworkTransactionID": "111222",
            "ownerMerchantID": "falabella2",
            "processorTransactionID": "152e471b288543c89e2f33d2fe0ac722"
        },
        "ccCaptureReply": {
            "reasonCode": "100",
            "requestDateTime": "2018-01-15T15:57:42Z",
            "amount": "4500",
            "reconciliationID": "02XFZ3HGJBYGMJZL"
        },
        "additionalProcessorResponse": "2fd6e9c9-4280-4134-a0a2-a67ee8f79a3c",
        "capture_token": "13b7c0f0-619b-ccf2-83e5-f33bcf2c4cd1",
        "resume": {
            "_id": "5a5ccf76b35dd40014db701a",
            "card_number": {
                "pan_last4": 1111,
                "pan_first6": 411111
            },
            "authorizations": {
                "code": "570110"
            },
            "transaction": {
                "gateway_id": "5160318622226245704012",
                "type": "CREDIT",
                "date": "2018-01-15T15:57:42.622Z",
                "currency": "CLP",
                "buy_order": "INPA-50000001613",
                "amount": 4500,
                "installments_number": 36
            },
            "response": {
                "code": 100
            }
        }
    }
}
```

[Ejemplo de transacción fallida](transaccion-fallida.md)

Además, agregamos información específica del código entregado por el Gateway CyberSource (Estructura resume del JSON de respuesta). [Ver la lista de códigos de respuesta CyberSource aquí](cybersource_reason_code.md).

Si deseas hacer la devolución al cliente, debes llamar a [API de Anulación](../../anulaciones/introduccion.md).

[Volver al inicio](../introduction.md)
