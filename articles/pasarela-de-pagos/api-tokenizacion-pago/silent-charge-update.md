# ¿Necesitas actualizar la información del pago? 

Los campos que podrás actualizar son los siguientes:

* Montos
* Datos del despacho
* Lista de productos

**Siempre debes enviar el número de cuotas.**

Puedes enviar la petición de silent charge de la siguiente forma:

Necesitas el **access_token** obtenido en la **Autenticación** y la **url silent charge** obtenida en el [paso 4](intencion-de-pago.md) para ejecutar una llamada a la **API de Silent Charge /silent** de la siguiente forma:

```
curl -v -X PUT 'https://api.sandbox.connect.fif.tech/checkout/payments/{id}/silent' \
  
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer access_token"
 -d '{  
   "installments_number": 36,
   "transaction":{  
      "item_list":{  
         "shipping_method":"DIGITAL",
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
         "shipping_address":{  
            "line1":"Moneda 970, Piso 11",
            "city":"Santiago",
            "country_code":"CL",
            "phone":"+56 9 8762 1244",
            "type":"HOME_OR_WORK",
            "recipient_name":"Jhon Doe Son"
         }
      },
      "amount":{  
         "currency":"CLP",
         "total":2000,
         "details":{  
            "subtotal":2000,
            "tax":0,
            "shipping":0,
            "shipping_discount":0
         }
      }
   }
}'
 
```


