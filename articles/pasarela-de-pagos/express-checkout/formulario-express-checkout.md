## 3. Mostrar Formulario Express Checkout

Con la **approval_url** obtenida en el [paso 2](intencion-de-pago-express.md) puedes desplegar el formulario de pago Express Checkout.

![Ejemplo de Formulario Express Checkout](images/express-1.PNG)

El cliente debe ingresar los datos de la tarjeta, seleccionar las cuotas y aprobar el pago para que nuestro sistema pueda ejecutar el cargo a la tarjeta de crédito. 

El sistema redireccionará la url de éxito o error, según sea la respuesta recibida en la ejecución del pago.

> **Importante** Las urls anteriormente mencionadas son las que el comercio envió en el [paso 2](intencion-de-pago-express.md) en los atributos **"redirect_urls.return_url"** y **"redirect_urls.cancel_url"**.

Para finalizar debes consultar el estado de la transacción como se explica a continuación:
[4. Consultar Estado de la Transacción](consulta-de-estado-express.md)
