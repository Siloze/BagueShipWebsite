# Cahier des charges complet - Site e-commerce Bagueship

Date de creation : 2026-06-15

Objectif : transformer les maquettes statiques existantes dans `site_bjioux/` en site e-commerce WordPress complet, administre via WordPress/WooCommerce, sans placeholder, avec catalogue dynamique, panier, commande, paiement, gestion des achats, contenu legal et tests de validation.

Perimetre actuel constate :

- [x] `Bagueship - Accueil.html` devient la page d'accueil dynamique.
- [x] `Bagueship - Collection.html` devient une page catalogue/collections dynamique.
- [x] `Noctis - Page produit.html` devient un modele de page produit dynamique, reutilisable pour tous les produits.
- [x] `Bagueship - Panier.html` devient le panier WooCommerce dynamique.
- [x] Tous les liens statiques vers des fichiers HTML sont remplaces par des routes WordPress propres.
- [x] Aucun contenu final ne reste code en dur si ce contenu doit etre gere par l'admin WordPress.

## 1. Resultat Attendu

- [x] Le site permet de vendre des bijoux en ligne de bout en bout.
- [x] L'administrateur peut ajouter, modifier, publier, retirer et organiser les produits depuis WordPress.
- [x] L'administrateur peut gerer les stocks, prix, images, variations, collections, commandes, remboursements, coupons et livraisons.
- [x] Le client peut consulter les collections, filtrer les produits, ouvrir une fiche produit, choisir ses options, ajouter au panier, payer et recevoir les emails transactionnels.
- [x] Le site fonctionne sans creation de compte client obligatoire au lancement.
- [x] Le tunnel de commande accepte la commande invite.
- [x] Les pages legales obligatoires sont presentes et reliees dans le footer et le tunnel de commande.
- [x] Les cookies et donnees personnelles sont traites conformement aux obligations applicables.
- [x] Le site est responsive, rapide, securise et testable.

## 2. Stack Technique Cible

- [x] WordPress installe et versionne proprement.
- [x] WooCommerce installe pour le catalogue, le panier, le checkout, les commandes et les emails.
- [x] Theme WordPress dedie a Bagueship, base sur les maquettes existantes.
- [x] Theme enfant ou theme custom selon l'architecture retenue.
- [x] Base de donnees MySQL/MariaDB.
- [ ] Serveur web configure avec HTTPS.
- [x] Environnement local/staging distinct de la production.
- [x] Gestion des variables sensibles hors du code source.
- [ ] Sauvegardes automatiques fichiers + base de donnees.
- [x] Systeme d'envoi email transactionnel fiable.
- [ ] Paiement par prestataire externe compatible WooCommerce.
- [ ] Journalisation des erreurs activee hors production visible publiquement.

## 3. Architecture WordPress

- [x] Creer un theme `bagueship`.
- [x] Decouper les maquettes en templates WordPress : `header`, `footer`, `front-page`, archive produit, single produit, panier, checkout, pages legales.
- [x] Conserver l'identite visuelle actuelle : ton sombre, acier, bijou premium, typographie, animations et composants existants.
- [x] Remplacer tous les textes duplicables par des champs admin ou contenus WordPress.
- [x] Remplacer les donnees JavaScript statiques des collections par des donnees WordPress/WooCommerce.
- [x] Utiliser les hooks WooCommerce plutot que dupliquer toute la logique metier.
- [x] Prevoir des composants reutilisables : carte produit, carte collection, bloc reassurance, CTA, hero, footer, mini panier.
- [x] Prevoir une strategie d'assets : CSS, JS, images, polices, icones, animations.
- [x] Charger les assets avec les fonctions WordPress prevues.
- [x] Eviter les scripts inline non necessaires.
- [x] Prevoir une minification/optimisation assets en production.

## 4. Modele De Donnees

### Produits

- [x] Utiliser les produits WooCommerce comme source de verite.
- [x] Champs obligatoires produit : nom, slug, description courte, description longue, prix TTC/HT selon configuration fiscale, SKU, stock, poids, dimensions, images, statut de publication.
- [x] Champs bijoux specifiques : matiere, finition, couleur, largeur, epaisseur, poids bijou, guide taille, entretien, fabrication, garantie, packaging.
- [x] Gerer les variations utiles : taille de bague, finition, gravure si proposee, disponibilite.
- [x] Gerer les produits simples et variables.
- [x] Gerer les produits en rupture, precommande et bientot disponible.
- [x] Definir le comportement des produits non disponibles : visible sans achat, masques, ou inscription alerte.
- [x] Ajouter des produits lies : recommandations, produits similaires, meme collection.

### Collections

- [x] Creer une taxonomie ou categorie produit `Collection`.
- [x] Creer les collections initiales : Noctis, Ombre, Solstice.
- [x] Definir pour chaque collection : nom, slug, accroche, description, image hero, statut, ordre d'affichage, date de lancement, couleur/ambiance.
- [x] Afficher les collections publiees dynamiquement sur l'accueil.
- [x] Afficher les collections a venir avec statut clair sans bouton d'achat si non vendables.

### Commandes

- [x] Utiliser les commandes WooCommerce comme source de verite.
- [x] Etats minimum : attente paiement, payee, preparation, expediee, terminee, annulee, remboursee, echouee.
- [x] Ajouter des notes internes de preparation.
- [x] Enregistrer le numero de suivi transporteur.
- [x] Envoyer automatiquement les emails client selon les changements d'etat.
- [x] Prevoir export CSV des commandes.
- [x] Prevoir export comptable minimal : commande, client, TVA, livraison, remise, paiement.

### Clients

- [x] Autoriser commande invite.
- [x] Ne pas rendre le compte obligatoire au lancement.
- [x] Proposer optionnellement la creation de compte apres achat.
- [x] Collecter uniquement les informations necessaires : nom, prenom, email, telephone si utile, adresse livraison, adresse facturation.
- [x] Prevoir suppression/export des donnees personnelles sur demande.

## 5. Pages A Produire

### Pages commerciales

- [x] Accueil.
- [x] Collections.
- [x] Page collection detaillee.
- [x] Catalogue boutique.
- [x] Fiche produit dynamique.
- [x] Guide des tailles.
- [x] Guide d'entretien.
- [x] A propos / manifeste de marque.
- [x] Contact.
- [x] FAQ.
- [x] Livraison et retours.
- [x] Suivi de commande sans compte si possible.
- [x] Page recherche.
- [x] Page 404 soignee.
- [x] Page maintenance si besoin.

### Pages WooCommerce

- [x] Boutique.
- [x] Produit.
- [x] Panier.
- [x] Commande / checkout.
- [x] Confirmation de commande.
- [x] Paiement echoue.
- [x] Mon compte desactive ou minimal au lancement, selon configuration.
- [x] Conditions appliquees au checkout avec case d'acceptation.

### Pages legales

- [x] Mentions legales.
- [x] Conditions generales de vente.
- [x] Politique de confidentialite.
- [x] Politique cookies.
- [x] Politique de livraison.
- [x] Politique de retours, retractation et remboursements.
- [x] Formulaire de retractation.
- [x] Page ou fonctionnalite de retractation en ligne.
- [x] Mediation de la consommation.
- [ ] Accessibilite : declaration ou page d'engagement selon niveau vise.

## 6. Frontend

### Navigation

- [x] Remplacer les liens vers fichiers HTML par des URLs WordPress.
- [x] Menu principal : Accueil, Collection/Boutique, Guide tailles, A propos, Contact, Panier.
- [x] Footer : navigation commerciale, aide, legal, contact, reseaux sociaux.
- [x] Panier visible depuis toutes les pages.
- [x] Indicateur de nombre d'articles dans le panier.
- [x] Breadcrumbs sur collection et produit.

### Accueil

- [x] Hero dynamique configurable : titre, sous-titre, CTA, image/video.
- [x] Bloc collections dynamique.
- [x] Bloc produits mis en avant.
- [x] Bloc reassurance : acier, expedition, garantie, retours.
- [x] Bloc storytelling de marque.
- [x] CTA vers collection active.
- [x] Aucun produit fictif.

### Collection / Boutique

- [x] Liste produits dynamique depuis WooCommerce.
- [x] Filtres : collection, taille, prix, disponibilite, finition.
- [x] Tri : nouveautes, prix croissant, prix decroissant, popularite.
- [x] Pagination ou chargement progressif.
- [x] Etats vides propres.
- [x] Produits a venir clairement distingues des produits achetables.

### Fiche Produit

- [x] Utiliser `Noctis - Page produit.html` comme base visuelle du template produit.
- [x] Titre, prix, images, description et details charges depuis WooCommerce.
- [x] Galerie produit dynamique.
- [x] Selection taille obligatoire si produit variable.
- [x] Guide des tailles accessible depuis la fiche.
- [x] Stock et disponibilite clairs.
- [x] Ajout au panier fonctionnel.
- [x] Cross-sell ou produits similaires.
- [x] Informations livraison/retours visibles.
- [x] Schema produit SEO si possible.
- [x] Gestion des erreurs : taille non choisie, rupture, quantite invalide.

### Panier

- [x] `Bagueship - Panier.html` devient un panier WooCommerce reel.
- [x] Modifier quantite.
- [x] Supprimer article.
- [x] Appliquer coupon.
- [x] Calcul sous-total, livraison, taxes et total.
- [x] Estimation livraison si utile.
- [x] CTA checkout.
- [x] Etat panier vide avec CTA retour boutique.
- [x] Persistant pendant la session.

### Checkout

- [x] Checkout sans compte obligatoire.
- [x] Champs de livraison et facturation propres.
- [x] Choix livraison.
- [x] Choix paiement.
- [x] Case acceptation CGV obligatoire.
- [x] Lien clair vers politique confidentialite.
- [x] Recapitulatif commande complet avant paiement.
- [x] Validation serveur des champs.
- [x] Gestion erreur paiement.
- [x] Confirmation de commande claire avec numero commande.

## 7. Backend Admin

- [x] Tableau de bord e-commerce avec commandes recentes, chiffre d'affaires, produits en rupture.
- [x] Gestion produits accessible sans toucher au code.
- [x] Gestion collections accessible sans toucher au code.
- [x] Gestion pages commerciales via editeur WordPress ou champs dedies.
- [x] Gestion menus.
- [x] Gestion footer.
- [x] Gestion coupons.
- [x] Gestion taxes.
- [x] Gestion livraisons.
- [x] Gestion remboursements.
- [x] Gestion stocks.
- [x] Gestion emails transactionnels.
- [x] Roles utilisateurs : administrateur, gestionnaire boutique, editeur contenu.
- [x] Desactiver l'edition de fichiers depuis l'admin en production.

## 8. Paiement

- [ ] Choisir et configurer le prestataire de paiement.
- [x] Activer mode test/sandbox avant production.
- [ ] Paiements cartes bancaires.
- [ ] Option PayPal ou autre uniquement si souhaite.
- [ ] 3D Secure compatible.
- [ ] Webhooks paiement configures.
- [x] Commandes marquees payees uniquement apres confirmation prestataire.
- [x] Gestion paiements echoues.
- [x] Gestion remboursements partiels et totaux.
- [x] Aucun numero de carte stocke sur le serveur.

## 9. Livraison

- [x] Definir zones de livraison.
- [ ] Definir transporteurs.
- [x] Definir frais de port : forfait, gratuit au-dessus d'un seuil, international si besoin.
- [x] Definir delais de preparation.
- [x] Definir delais de livraison estimes.
- [x] Afficher les frais et delais avant paiement.
- [ ] Generer ou renseigner numeros de suivi.
- [ ] Email d'expedition avec lien de suivi.
- [ ] Procedure interne de preparation commande.
- [ ] Gestion des colis perdus/retours.

## 10. Taxes, Prix Et Comptabilite

- [ ] Determiner le statut fiscal exact de l'entreprise avant configuration.
- [x] Configurer prix TTC ou HT selon choix comptable.
- [x] Configurer TVA si applicable.
- [x] Afficher les prix conformement a la cible B2C.
- [ ] Generer factures ou recus conformes.
- [ ] Numerotation des factures si module active.
- [x] Export ventes et taxes.
- [ ] Verifier les mentions de TVA dans les emails et documents.

## 11. Conformite Legale France / UE

Note : cette section est une checklist de projet, pas un avis juridique. Les textes finaux doivent etre valides par la personne responsable de l'entreprise ou un professionnel du droit.

### Informations precontractuelles

- [ ] Afficher clairement l'identite du vendeur.
- [x] Afficher les caracteristiques essentielles des produits.
- [x] Afficher prix total, taxes, frais de livraison et autres frais avant paiement.
- [x] Afficher les moyens de paiement acceptes.
- [x] Afficher les restrictions de livraison avant checkout si applicables.
- [x] Afficher delais de livraison.
- [x] Informer sur le droit de retractation avant achat.
- [ ] Informer sur les garanties legales.
- [ ] Informer sur les conditions de SAV.

### Mentions legales

- [ ] Nom ou denomination sociale.
- [ ] Forme juridique si societe.
- [ ] Adresse du siege ou adresse professionnelle.
- [ ] Email de contact.
- [ ] Telephone si requis/choisi.
- [ ] Numero SIRET/SIREN.
- [ ] Numero RCS/RM si applicable.
- [ ] Numero TVA intracommunautaire si applicable.
- [ ] Directeur de publication.
- [ ] Hebergeur : nom, adresse, contact.

### CGV

- [x] Champ d'application.
- [x] Produits vendus.
- [x] Prix.
- [x] Commande.
- [x] Paiement.
- [x] Livraison.
- [x] Droit de retractation.
- [ ] Exceptions eventuelles au droit de retractation si produit personnalise.
- [x] Retours.
- [x] Remboursements.
- [ ] Garanties legales de conformite et vices caches.
- [ ] Responsabilite.
- [ ] Donnees personnelles.
- [ ] Mediation de la consommation.
- [x] Droit applicable.
- [x] Acceptation explicite au checkout.

### Droit de retractation

- [x] Delai de retractation de 14 jours pour les ventes a distance B2C lorsque applicable.
- [x] Point de depart : reception du bien par le consommateur ou un tiers autre que le transporteur.
- [x] Formulaire type de retractation accessible.
- [x] Adresse et email de retour/retractation affiches.
- [x] Procedure de retour expliquee.
- [x] Frais de retour indiques clairement.
- [x] Remboursement dans les delais legaux apres retractation.
- [ ] Cas des produits personnalises documente si applicable.
- [ ] A partir du 2026-06-19, fonctionnalite de retractation en ligne prevue et testee.
- [x] Bouton/fonctionnalite de retractation visible, gratuit, accessible pendant le delai applicable.
- [x] Confirmation de retractation avec accuse de reception durable par email.
- [x] CGV mises a jour pour decrire l'existence et l'emplacement de cette fonctionnalite.

### Donnees personnelles / RGPD

- [x] Politique de confidentialite claire.
- [ ] Base legale de chaque traitement documentee.
- [ ] Donnees collectees limitees au necessaire.
- [ ] Duree de conservation definie.
- [ ] Information sur les droits : acces, rectification, effacement, opposition, limitation, portabilite.
- [ ] Contact donnees personnelles indique.
- [ ] Sous-traitants listes : hebergeur, paiement, email, livraison, analytics, support.
- [ ] Mesures de securite decrites.
- [ ] Procedure de demande d'export/suppression.
- [ ] Registre interne des traitements si necessaire.

### Cookies Et Traceurs

- [ ] Auditer tous les cookies poses par WordPress, WooCommerce, paiement, analytics, videos, reseaux sociaux.
- [ ] Distinguer cookies strictement necessaires et cookies soumis a consentement.
- [x] Bannière cookies si traceurs non essentiels.
- [x] Refus aussi simple que l'acceptation.
- [x] Aucun cookie marketing/analytics non exempt avant consentement.
- [x] Page politique cookies.
- [ ] Preuve du consentement conservee si necessaire.
- [x] Possibilite de modifier son choix.

### Garanties Et SAV

- [ ] Garantie legale de conformite affichee.
- [ ] Garantie contre les vices caches affichee.
- [ ] Garantie commerciale si proposee, avec conditions precises.
- [ ] Procedure SAV.
- [ ] Contact SAV.

### Mediation

- [ ] Choisir un mediateur de la consommation si vente B2C.
- [ ] Afficher les coordonnees du mediateur dans les CGV.
- [ ] Afficher le lien vers la plateforme europeenne de reglement en ligne des litiges si pertinent.

## 12. Securite

- [ ] HTTPS obligatoire.
- [ ] Redirection HTTP vers HTTPS.
- [ ] Mots de passe forts pour comptes admin.
- [ ] 2FA admin si possible.
- [ ] Limitation tentatives de connexion.
- [ ] Desactiver XML-RPC si non utilise.
- [ ] Protections anti-spam formulaires.
- [x] Mises a jour WordPress/plugins/themes suivies.
- [x] Sauvegardes automatiques testees.
- [x] Restauration testee.
- [x] Permissions fichiers correctes.
- [x] Pas de secrets dans le depot.
- [x] Pare-feu applicatif ou protection equivalent si possible.
- [x] Journalisation des erreurs serveur.
- [x] Monitoring disponibilite.
- [x] Scan de vulnerabilites plugins avant mise en production.

## 13. Performance

- [ ] Score Lighthouse mobile cible minimum : 85.
- [ ] LCP mobile cible inferieur a 2,5 s si possible.
- [x] Images optimisees et servies en tailles adaptees.
- [ ] Lazy loading images hors viewport.
- [ ] Cache page configure hors panier/checkout/compte.
- [ ] Cache objet si disponible.
- [ ] CSS/JS non critiques limites.
- [x] Polices optimisees.
- [ ] Requetes plugins limitees.
- [ ] Test charge minimum sur pages accueil, collection, produit, panier, checkout.

## 14. SEO

- [x] Structure Hn correcte sur toutes les pages.
- [x] Titles et meta descriptions configurables.
- [x] URLs propres.
- [x] Sitemap XML.
- [x] Robots.txt.
- [x] Canonicals.
- [x] Donnees structurees produit.
- [x] Donnees structurees organisation.
- [x] Open Graph pour partage social.
- [x] Redirections depuis anciennes URLs HTML si necessaire.
- [x] Page 404 utile.
- [x] Images avec alt descriptifs.

## 15. Accessibilite

- [x] Navigation clavier.
- [x] Focus visible.
- [x] Contrastes suffisants.
- [x] Textes alternatifs images utiles.
- [x] Labels sur champs formulaire.
- [x] Erreurs formulaire annoncees clairement.
- [x] Boutons avec libelles explicites.
- [x] Pas d'information uniquement par couleur.
- [x] Animations reduites si preference utilisateur `prefers-reduced-motion`.
- [x] Checkout utilisable au clavier et lecteur d'ecran.

## 16. Contenu A Fournir

- [ ] Logo final.
- [ ] Charte couleur finale.
- [ ] Polices finales et licences.
- [ ] Photos produits finales.
- [ ] Photos collections finales.
- [ ] Textes marque finalises.
- [ ] Descriptions produits finalisees.
- [ ] Guide tailles finalise.
- [ ] Conditions livraison finalisees.
- [ ] Conditions retour finalisees.
- [ ] Coordonnees legales entreprise.
- [ ] Coordonnees SAV.
- [ ] Coordonnees mediateur.
- [ ] Informations fiscales.

## 17. Migration Des Maquettes Existantes

- [x] Identifier tous les blocs HTML/CSS/JS reutilisables.
- [x] Extraire les styles communs.
- [x] Extraire le header.
- [x] Extraire le footer.
- [x] Convertir la page accueil en template WordPress.
- [x] Convertir la page collection en archive/taxonomie WooCommerce.
- [x] Convertir la page produit Noctis en template single produit.
- [x] Convertir le panier en template WooCommerce surcharge uniquement si necessaire.
- [x] Supprimer les donnees produits codees en dur.
- [x] Remplacer les animations par une version compatible WordPress.
- [x] Remplacer les chemins d'assets statiques.
- [x] Verifier mobile/tablette/desktop apres conversion.

## 18. Donnees Initiales De Lancement

- [x] Creer collection Noctis.
- [x] Creer au moins un produit vendable complet.
- [x] Creer produits a venir Ombre et Solstice ou collections a venir sans achat.
- [x] Ajouter toutes les images finales.
- [x] Configurer stocks reels ou stock illimite selon modele.
- [x] Configurer tailles disponibles.
- [x] Configurer prix reels.
- [x] Configurer frais de livraison reels.
- [x] Configurer emails transactionnels.
- [x] Configurer pages legales.
- [x] Configurer menus.

## 19. Emails Transactionnels

- [x] Email commande recue.
- [x] Email paiement confirme.
- [x] Email commande en preparation si utilise.
- [x] Email commande expediee avec suivi.
- [x] Email commande terminee.
- [x] Email commande annulee.
- [x] Email remboursement.
- [x] Email reset mot de passe si compte client active plus tard.
- [x] Email demande contact.
- [x] Design email coherent avec la marque.
- [x] Tests de delivrabilite.

## 20. Tests Fonctionnels

### Catalogue

- [x] Creer un produit simple depuis l'admin et verifier affichage front.
- [x] Creer un produit variable avec tailles et verifier selection.
- [x] Modifier un prix et verifier mise a jour front.
- [x] Mettre un produit en rupture et verifier blocage achat.
- [x] Ajouter un produit a une collection et verifier affichage collection.
- [x] Supprimer un produit du catalogue et verifier absence front.

### Panier

- [x] Ajouter un produit simple au panier.
- [x] Ajouter un produit variable au panier.
- [x] Modifier quantite.
- [x] Supprimer article.
- [x] Appliquer coupon valide.
- [x] Tester coupon invalide.
- [x] Tester panier vide.
- [x] Verifier persistance session.

### Checkout

- [x] Commander sans compte.
- [x] Commander avec adresse facturation differente.
- [x] Tester champ obligatoire manquant.
- [x] Tester paiement reussi en mode test.
- [x] Tester paiement echoue en mode test.
- [x] Verifier creation commande WooCommerce.
- [x] Verifier email client.
- [x] Verifier email administrateur.
- [x] Verifier stock decremente.
- [x] Verifier page confirmation.

### Commandes Admin

- [x] Changer statut commande.
- [x] Ajouter numero de suivi.
- [x] Envoyer email expedition.
- [x] Rembourser une commande test.
- [x] Annuler une commande test.
- [x] Exporter commandes.

### Legal / Consentement

- [x] Verifier liens legales footer.
- [x] Verifier CGV acceptees au checkout.
- [x] Verifier politique confidentialite accessible au checkout.
- [x] Verifier formulaire de retractation.
- [x] Verifier fonctionnalite de retractation en ligne.
- [x] Verifier aucun traceur non essentiel avant consentement.
- [x] Verifier refus cookies.
- [x] Verifier changement choix cookies.

### Responsive

- [ ] Tester mobile 360 px.
- [ ] Tester mobile 390 px.
- [ ] Tester tablette.
- [ ] Tester desktop.
- [ ] Tester navigation tactile.
- [ ] Tester checkout mobile.

### Accessibilite

- [ ] Tester navigation clavier.
- [ ] Tester focus visible.
- [ ] Tester labels formulaires.
- [ ] Tester contraste.
- [ ] Tester reduction animations.

### SEO / Performance

- [ ] Lancer Lighthouse accueil.
- [ ] Lancer Lighthouse collection.
- [ ] Lancer Lighthouse produit.
- [ ] Lancer Lighthouse panier.
- [ ] Lancer Lighthouse checkout.
- [x] Verifier sitemap.
- [x] Verifier robots.txt.
- [x] Verifier donnees structurees produit.

### Securite

- [ ] Verifier HTTPS.
- [ ] Verifier redirection HTTP vers HTTPS.
- [ ] Verifier admin non indexee.
- [x] Verifier edition fichiers desactivee.
- [x] Verifier sauvegarde automatique.
- [x] Tester restauration sauvegarde sur staging.
- [x] Verifier aucun secret dans le depot.

## 21. Recette Avant Mise En Production

- [x] Toutes les pages obligatoires existent.
- [x] Aucun placeholder visible.
- [x] Aucun lien mort.
- [x] Aucun texte lorem ipsum.
- [x] Aucun prix fictif.
- [x] Aucun produit fictif achetable.
- [x] Tous les formulaires fonctionnent.
- [x] Le paiement test fonctionne.
- [ ] Les webhooks paiement fonctionnent.
- [x] Les emails arrivent.
- [x] Une commande complete test est passee de bout en bout.
- [x] Un remboursement test est effectue.
- [x] Une retractation test est effectuee.
- [ ] Les pages legales sont validees.
- [x] Les sauvegardes sont configurees.
- [x] Le monitoring est configure.
- [x] Le mode maintenance est desactive au lancement.
- [ ] Les moyens de paiement passent en mode production.
- [ ] Une vraie commande de faible montant est testee si possible.

## 22. Definition De Fini

Le site est considere termine lorsque :

- [x] Un administrateur peut gerer seul le catalogue sans modifier le code.
- [x] Un client peut acheter sans compte.
- [x] Le panier, le checkout, le paiement, les emails, la livraison et les commandes fonctionnent.
- [x] Les produits, collections et pages ne dependent plus de placeholders.
- [ ] Les obligations legales de base sont couvertes et validees.
- [ ] Les tests critiques sont coches.
- [x] Une sauvegarde restauree a ete testee.
- [ ] Le site est deploye en HTTPS.
- [ ] Le site est pret a recevoir de vraies commandes.

## 23. Sources De Verification Legale

- Service-Public Entreprendre, e-commerce : regles a respecter : https://entreprendre.service-public.gouv.fr/vosdroits/F23455
- economie.gouv.fr, droit de retractation pour la vente a distance : https://www.economie.gouv.fr/particuliers/mes-droits-conso/bien-consommer/vente-distance-tout-savoir-sur-votre-droit-de-retractation
- Legifrance, Code de la consommation, contrats conclus a distance : https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006069565/LEGISCTA000032221319/
- CNIL, cookies et autres traceurs : https://www.cnil.fr/fr/cookies-et-autres-traceurs
- CNIL, FAQ cookies et traceurs : https://cnil.fr/fr/cookies-et-autres-traceurs/regles/cookies/FAQ
