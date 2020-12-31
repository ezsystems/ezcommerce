# Ibexa Commerce

[![Latest release](https://img.shields.io/github/release/ezsystems/ezcommerce.svg?style=flat-square)](https://github.com/ezsystems/ezplatform-ee/releases)
[![License](https://img.shields.io/packagist/l/ezsystems/ezcommerce.svg?style=flat-square)](LICENSE)

## What is Ibexa Commerce?
*Ibexa Commerce* is commercial Digital Experience Platform (DXP) software developed by Ibexa.

*Ibexa Commerce* derives from *[Ibexa Experience](https://github.com/ezsystems/ezplatform-ee)*. It is composed of a set of bundles. Ibexa Commerce, like Ibexa Experience, is built on top of the Symfony framework (Full Stack).

### How to get access to Ibexa Commerce?

While this meta repository, `ezcommerce`, is public to ease installation and upgrades, full access can be obtained in one of three ways:
- Request an online demo on [ibexa.co](https://www.ibexa.co/products)
- As a partner, download trial version from [Partner Portal](https://www.ibexa.co/partner-portal)
- As a customer with an Ibexa Commerce subscription, get full version from [Service Portal](https://support.ibexa.co/Downloads).
  Or by setting up [Composer Authentication Tokens](https://doc.ibexa.co/en/latest/getting_started/install_ez_platform/#set-up-authentication-tokens) for use in combination with this repository.

#### Further information:
Ibexa Platform is 100% open source and is the foundation for the commercial *Ibexa Digital Experience Platform* software which adds advanced features for editorial teams, 100% built on top of *Ibexa Platform* APIs.

- [Ibexa products roadmap](https://portal.productboard.com/ibexa/1-ibexa-dxp)
- Ibexa (commercial products and services): [ibexa.co](https://ibexa.co/)

## Installation
Installation instructions below are for installing a clean installation of Ibexa Commerce in latest version with _no_ demo content or demo website.
Full installation documentation is [in the online docs](https://doc.ibexa.co/en/latest/getting_started/install_ez_platform/#get-ibexa-platform).

- composer install
- bash install-solr.sh 8983
- composer ezcommerce-install
- php bin/console server:run

## COPYRIGHT
Copyright (C) 1999-2021 Ibexa AS (formerly eZ Systems AS). All rights reserved.

## LICENSE
This source code is available separately under the following licenses:

A - Ibexa Business Use License Agreement (Ibexa BUL),
version 2.3 or later versions (as license terms may be updated from time to time)
Ibexa BUL is granted by having a valid Ibexa DXP (formerly eZ Platform Enterprise) subscription,
as described at: https://www.ibexa.co/product
For the full Ibexa BUL license text, please see:
- LICENSE-bul file placed in the root of this source code, or
- https://www.ibexa.co/software-information/licenses-and-agreements (latest version applies)

AND

B - Ibexa Trial and Test License Agreement (Ibexa TTL),
version 2.2 or later versions (as license terms may be updated from time to time)
Trial can be granted by Ibexa, reach out to Ibexa AS for evaluation access: https://www.ibexa.co/about-ibexa/contact-us
For the full Ibexa TTL license text, please see:
- LICENSE file placed in the root of this source code, or
- https://www.ibexa.co/software-information/licenses-and-agreements (latest version applies)
