# Estrategia de Funcionamiento

La estrategia en la cual se basa este componente, se encuentra bajo el concepto de [Webhook](https://en.wikipedia.org/wiki/Webhook), que permite a un [Micro servicio](https://es.wikipedia.org/wiki/Arquitectura_de_microservicios) eliminar el nivel de acoplamiento fuerte contra otros servicios / microservicios permitiendo seguir manteniendo su resilencia y [bajo acoplamiento](https://en.wikipedia.org/wiki/Loose_coupling), inclusive cuando alguna pieza externa de funcionamiento critico se haya detenido por algúna falla en su funcionamiento.

Para lograr lo anterior, es necesario que el sistema de captura (tokenizador) implemente un sistema de eventos en que el componente **intermediate proxy pull** pueda subcribirse, y en el cual a su vez bajo el mismo concepto previamente explicado, permita que los componentes fuera de alcance PCI, puedan subscribirse para la comunicación de los datos no sensibles de captura a sus fuentes persistentes.

Resumiendo lo anterior, para el correcto funcionamiento de este componente intermediario en el ecosistema de **Quickpay Connect** es necesaria las siguientes configuraciones a nivel interno.

- **Subscripción** al evento de captura exitosa "card_captured", indicando la URL a la cual la información de captura (*datos no sensibles*) será enviada (pull). 
> **Nota:**
> En el contexto de  *Quickpay Connect*, es necesario configurar la URL base de recepción del componente API *intermediate proxy pull* a:  **{api-intermediate-proxy-pull}/captures/tokenization/webhook_callback** 

- **Subcripción** al evento de *intermediate proxy pull*, indicando la URL a la cual la información de captura, será enviada (pull).
> **Nota:**
> En el contexto de *Quickpay Connect*, es necesario configurar la URL base de recepcion del componente API *Checkout* a: **{api-checkout}/captures/tokenization/webhook_callback**.

  ![diagrama de secuencia][secuence-diagram]
  ->*Diagrama de secuencias*<-

# TLDR:

 **¿Porqué es necesario ejecutar dos envios de información (*tokenizador -> intermediate proxy pull -> checkout*) para finalmente enviar la información al componente checkout, cúando podriamos hacerlo directamente desde el tokenizador -> checkout?**
 
 Solo por el hecho de sacar del alcance PCI a la plataforma checkout, y que esta pueda estar fuera de las altas restricciones de los ambientes PCI, ya que cómo bien se plantea, facilmente podria ser una sola llamada, directamente del tokenizdor -> checkout, pero esta definición produciría que checkout estuviera dentro del alcance PCI; y  es por ello que el planteamiento de envio de la información sea tokenizador -> intermediate proxy pull -> checkout.

---

**¿Qué pasa si al momento de captura de una tarjeta la conexión entre el tokenizador y el intermediate proxy pull se pierde?**
 
Un sistema resiliente son aquellos sistemas que estan pensados en las fallas, y que por ende, aunque un componente externo falle, la solicitud de envió quedara encolada para ser re-intentada mas tarde, por lo que si por algún problema interno la malla de conexión entre ambos componentes encapsulados en la infraestructura PCI falla, el sistema de tokenizador , dejará encolada el envio de información para un tiempo mas adelante, hasta que el código de respuesta HTTP entregado por el sistema subscrito (intermediate proxy pull), sea un código HTTP exitoso (200,201,203,204, etc).

Mas Información: [The Reactive Manifesto](http://www.reactivemanifesto.org/es)

---


[Ver guía de funcionamiento](how-it-work.md)


[secuence-diagram]: images/how-it-work-1.png