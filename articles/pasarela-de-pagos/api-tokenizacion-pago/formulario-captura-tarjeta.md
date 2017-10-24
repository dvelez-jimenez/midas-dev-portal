#### 3. Mostrar Formulario de Captura de tarjeta

Con la **capture_url** obtenida en el [paso 2](#2-crear-una-intención-de-captura) puedes desplegar el formulario de captura de tarjeta. [Puedes hacer clic aquí para ver un ejemplo de capture_url](https://quickpay-connect-capture-card.azurewebsites.net/captures/gateways/credit/card/61bf9053-dc08-15ea-7419-aba75cd3bea4/capture)

![Ejemplo de ventana Formulario](Portal02.jpg)

El cliente debe ingresar los datos solicitados en el formulario y hacer clic en **Usar esta tarjeta** para obtener el token de la tarjeta de crédito.

![Ejemplo datos a ingresar](Portal03.jpg)

La respuesta será enviada a la página de confirmacion indicada en la variable **"return_url"** de la petición a la [API de intención de Captura (paso 2)](#2-crear-una-intención-de-captura) o puedes consultar dicha respuesta llamando a la **API Revisión de Captura** de la siguiente forma:

```
 curl -X GET 'https://quickpay-connect-capture-card.azurewebsites.net/captures/{{id}}'
```

> Debes reemplazar el **id** por el obtenido en la respuesta de la **API de captura /captures** [paso 2](#2-crear-una-intención-de-captura).

**Ejemplo de respuesta enviada a la return_url:**

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
  "id": "fe5228dc-91ab-fa28-97ec-034bed089743",
  "create_time": "2017-10-12T20:29:36.035Z",
  "update_time": "2017-10-12T20:29:59.333Z",
  "state": "captured",
  "capture_number": "INCA-0000000047",
   "panLast4": "1111"
  }
}
```

El **id** generado corresponde al **Token de la tarjeta**.

> **id de ejemplo**"id": "fe5228dc-91ab-fa28-97ec-034bed089743"

[Ir al paso 4](intención-de-pago.md)
