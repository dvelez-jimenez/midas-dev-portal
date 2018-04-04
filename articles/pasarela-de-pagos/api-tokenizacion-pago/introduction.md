# Split Checkout (Captura de tarjeta + Pago)

La integración mediante nuestra API te da un mayor control sobre el checkout en tu sitio, ya que el proceso se divide en dos etapas: Obtener un token de la tarjeta de crédito y realizar el cargo, y estas pueden ocurrir en momentos distintos.

Los pasos para realizar la integración son:

- [1. Obtener un Token de Acceso](obtener-token-acceso.md)
- [2. Crear una Intención de Captura](crear-intencion-captura.md)
- [3. Capturar tarjeta](captura-tarjeta.md)
  - [3.1. Captura de tarjeta mediante formulario (capture_url)](formulario-captura-tarjeta.md)
  - [3.2. Captura de tarjeta haciendo POST directamente a la API (capture_card)](silent-capture.md)
- [4. Intención de Pago](intencion-de-pago.md)
- [5. Realizar el cargo a la tarjeta](cargo-tarjeta.md)
