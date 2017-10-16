## About your contributions to Peinau content

### Minor corrections
Minor corrections or clarifications you submit for documentation and code examples in this repo are covered by the general terms.


## Repository organization
The content in the peinau-docs repository follows the organization of documentation on https://docs.peinau.com/peinau/. This repository contains two root folders:

### \articles
The *\articles* folder contains the documentation articles formatted as markdown files with an *.md* extension. Articles are typically grouped by Peinau Services.

The *\articles* folder contains the *\media* folder for root directory article media files, inside which are subfolders with the images for each article.  The service folders contain a separate media folder for the articles within each service folder. The article image folders are named identically to the article file, minus the *.md* file extension.

### \includes
You can create reusable content sections to be included in one or more articles. 

## How to use markdown to format your topic
All the articles in this repository use GitHub flavored markdown.  Here's a list of resources.

* [Markdown basics](https://help.github.com/articles/markdown-basics/)


## Labels
In the public peinau-docs repository, automated labels are assigned to pull requests to help us manage the pull request workflow and to help let you know what's going on with your pull request:

* Contribution License Agreement related
  * cla-not-required: The change is relatively minor and does not require that you sign a CLA.
  * cla-required: The scope of the change is relatively large and requires that you sign a CLA.
* Change sent to author: The author has been notified of the pending pull request.
* ready-to-merge: Ready for review by our pull request review team.

**CLA**: Contributor License Agremment.

----
## Introducción a Peinau

Bienvenido al portal de desarrolladores de Peinau

Si quieres integrar un botón de pagos en tu sitio web de forma fácil, rápida y segura, somos tu mejor opción.

Además, utilizando Peinau nunca verás la información sensible de la tarjeta y con ello le daras mas seguridad a tus clientes.

Te ofrecemos las siguientes soluciones:

- [Pasarela de pagos](Articulos/Pasarela-de-pagos.md)
  - [API Tokenización y Pago](Articulos/Api-tokenizacion-pago.md)
  - [API Checkout](Articulos/Api-checkout.md)
  - [SDK Javascript](https://github.com/Peinau/peinau-javascript/blob/master/README.md)
  - [Anulaciones](Articulos/Anulaciones.md)

- [Motor de fraude](Articulos/Motor-de-fraude.md)

----
## Intermediate Proxy Pull

Componente Interno que permite la reducción PCI DSS hacia el producto Checkout.

[Guía de Funcionamiento](articles/intermediate-proxy-pull/introduction.md)

