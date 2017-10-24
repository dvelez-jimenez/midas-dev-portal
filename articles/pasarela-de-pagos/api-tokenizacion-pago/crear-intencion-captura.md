## 2. Crear una Intención de Captura

Luego de haber obtenido el **access_token** y con la información mínima del cliente, se debe crear una **intención de captura**.

Utilizando dicho **access_token**, debes ejecutar una llamanda a la **API de captura /captures** de la siguiente forma:

```
curl -X POST 'https://quickpay-connect-capture-card.azurewebsites.net/captures' \
 -H "Content-Type: application/json" \
 -H "Authorization: Bearer ACCESS TOKEN" \
 -d '{
  "capture": "CREDIT_CARD",
  "capture_method": "TOKENIZATION",
  "cardholder": {
    "reference_id": "001389",
    "country": "CL",
    "name": "Mati 1",
    "email": "JLPrueba1@gmail.com"
  },
	"billing": {
    "line1": "Miraflores 222",
    "city": "Santiago",
    "state": "Region Metropolitana",
    "country": "CL"
  },
	
  "redirect_urls": {
    "return_url": "https://requestb.in/sfoogtsf",
    "cancel_url": "http://www.mysite.cl/cancel"
  }
}' | json_pp
```

Como respuesta obtendrás la siguiente información:

```
{
    "capture": "CREDIT_CARD",
    "capture_method": "TOKENIZATION",
    "application": "a3be1bc6-438a-c35e-e603-b15f2d30cfb9",
    "redirect_urls": {
        "return_url": "https://requestb.in/sfoogtsf",
        "cancel_url": "http://www.mysite.cl/cancel"
    },
    "billing": {
        "line1": "Miraflores 222",
        "city": "Santiago",
        "state": "Region Metropolitana",
        "country": "CL"
    },
    "cardholder": {
        "reference_id": "001389",
        "country": "CL",
        "name": "Mati 1",
        "email": "JLPrueba1@gmail.com"
    },
    "id": "f445ffde-c746-e0ce-1fc6-751f8c633800",
    "create_time": "2017-10-12T20:17:24.907Z",
    "update_time": "2017-10-12T20:17:24.907Z",
    "state": "created",
    "capture_number": "INCA-0000000046",
    "links": [
        {
            "href": "https://quickpay-connect-capture-card.azurewebsites.net/captures/f445ffde-c746-e0ce-1fc6-751f8c633800",
            "rel": "self",
            "method": "GET"
        },
        {
            "href": "https://quickpay-connect-capture-card.azurewebsites.net/captures/gateways/credit/card/f445ffde-c746-e0ce-1fc6-751f8c633800/capture",
            "rel": "capture_url",
            "method": "REDIRECT"
        }
    ]
}
```

Detalle de las URLs generadas:

+ URL 1 (**rel: self**): desde esta URL puedes consultar la información de la intención de captura.
+ URL 2 (**rel: capture_url**): desde esta URL debes acceder al formulario de captura de la tarjeta.

[Ir al paso 3](formulario-captura-tarjeta.md)
