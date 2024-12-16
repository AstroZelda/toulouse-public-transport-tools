# TOULOUSE PUBLIC TRANSPORTS TOOLS

App utilitaire Android pour les transports en commun sur Toulouse

## Roadmap
- [x] Création de l'application
- [ ] Page d'accueil
- [ ] Page d'affichage des horaires
  - Pour l'instant, n'afficher que les prochains horaires des 5 arrêts favoris
- [ ] :one: Premier export d'apk


- [ ] Widget d'affichage des horaires
- [ ] :two: Deuxième export d'apk


- [ ] Page de liste des arrêts ?
  - [ ] Filtres et recherche
  - [ ] Page d'infos de l'arrêt sélectionné
  - [ ] Gestion des favoris ?
  - [ ] Affichage des horaires des arrêts définis comme favoris
  - [ ] Historisation des arrêts favoris, et ex-favoris (en cas de fausse manip)
- [ ] :three: Troisième export d'apk

## Build en local

Pour pouvoir faire tourner l'application de votre côté, il est nécessaire de créer un fichier local pour définir la clé d'API :
 - Récupérer une clé d'API auprès de la cellule OpenData de Tisseo :
    ```
    Pour obtenir une clé, merci d’envoyer un mail à opendata@tisseo.fr en indiquant :
     vos références : nom, prénom et/ou entreprise
     votre mail (pourra être utilisé pour communiquer des informations sur les API)
     vos utilisations prévues (nom de projet ? objectifs ?)
    ```
- Créer un fichier `/lib/private.env`
- Ajouter la clé d'API dans le fichier en suivant cette syntaxe : 
    ```dotenv
    API_KEY=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    ```

## Licences

![License: Public Domain](https://img.shields.io/badge/License-Public%20Domain-lightgrey.svg)  
Ce projet est publié dans le **domaine public** (Public Domain).

---

### Données utilisées

![License: ODbL](https://img.shields.io/badge/Data%20License-ODbL%201.0-blue.svg)  
Ce projet utilise des données fournies par une API sous licence **[Open Database License (ODbL)](https://data.toulouse-metropole.fr/page/licence/)**.  
Vous êtes invité à consulter les [termes de cette licence](https://opendatacommons.org/licenses/odbl/1.0/) si vous utilisez ou redistribuez ces données.