# API REST de Anulaciones

Necesitas el **access_token** obtenido en la **Autenticación** y el **id de la intención de pago** generado en el **paso 4**, para ejecutar una petición a la **API de Anulación /reverse** de la siguiente forma:

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
        "reversal_amount": "1000",
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
| reversed | La devolución se completó exitosamente   |

[Volver al menú anterior](../pasarela-de-pagos/api-tokenizacion-pago/introduction.md)
