# Bagueship / WordPress

Stack e-commerce WordPress + WooCommerce pour le projet Bagueship.

## Contenu

- `docker-compose.yaml` : WordPress, WooCommerce, MariaDB et bootstrap initial.
- `wordpress/wp-content/themes/bagueship/` : thème custom.
- `wordpress/wp-content/plugins/bagueship-core/` : bootstrap de contenu, menus, pages, produits et formulaires.
- `scripts/bootstrap.sh` : téléchargement WordPress officiel + installation et seed.
- `scripts/seed.php` : seed idempotent du site.

## Lancement

1. Copier `.env.example` en `.env` et renseigner les secrets.
2. S’assurer que le réseau Docker externe `edge` existe déjà.
3. Lancer la stack avec `docker compose up -d`.

Le bootstrap télécharge WordPress depuis l’image officielle `wordpress`, installe WooCommerce et active le thème Bagueship.

## Pages créées

- Accueil
- Boutique
- Panier
- Commande
- Mon compte
- Contact
- Suivi de commande
- Rétractation
- À propos
- FAQ
- Guide des tailles
- Entretien
- Livraison et retours
- Mentions légales
- CGV
- Confidentialité
- Cookies

## Réglages légaux

Les données légales du vendeur se renseignent dans `Réglages > Bagueship`.
Avant mise en production, il faut compléter :

- Raison sociale
- Forme juridique
- Adresse
- Email
- Téléphone
- SIRET / TVA
- Hébergeur
- Médiateur
- Contact données personnelles

