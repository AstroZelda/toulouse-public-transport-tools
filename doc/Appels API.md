# Widget prochains passages L1 - Appels à l'API

## Récupération des operatorCode

- Appel rest pour récupérer les arrêts Tisseo : 
```
https://api.tisseo.fr/v2/stop_points.json?key=<API_KEY>
```
Format en sortie : 
```json
"expirationDate": "2024-10-22 21:09",
    "physicalStops": {
        "physicalStop": [
            {
                "handicappedCompliance": "1",
                "id": "stop_point:SP_4331",
                "lines": [
                    {
                        "network": "Tisséo",
                        "short_name": "302"
                    }
                ],
                "name": "08 Mai 1945",
                "operatorCodes": [
                    {
                        "operatorCode": {
                            "network": "Tisséo",
                            "value": "70161"
                        }
                    }
                ],
                "stopArea": {
                    "cityName": "MURET",
                    "id": "stop_area:SA_2127",
                    "name": "08 Mai 1945"
                }
            },
            ...
        ]
    }
}
```

- Requête JSON Path pour extraire les arrêts recherchés :
```jsonpath
$.physicalStops.physicalStop[?(@.stopArea.cityName == 'TOULOUSE' && @.stopArea.name == "<NOM DE L'ARRÊT>")]
```

- On repère les arrêts qui correspondent à la ligne que l'on veut emprunter. Il peut y en avoir plusieurs, alors on cherche dans `lines.short_name == "L1"`.
- On récupère les operatorCodes et on vérifie les données de chacun d'entre eux en faisant cet appel - <u>le filtre line:144 correspond à la ligne L1</u> : 
```
https://api.tisseo.fr/v2/stops_schedules.json?operatorCode=<CODE>&lineId=line:144
```
Format en sortie :
```json
{
    "departures": {
        "departure": [
            {
                "dateTime": "2024-10-22 21:19:29",
                "destination": [
                    {
                        "cityName": "TOULOUSE",
                        "id": "stop_area:SA_2179",
                        "name": "Sept Deniers - Salvador Dali"
                    }
                ],
                "line": {
                    "bgXmlColor": "#FF671B",
                    "color": "(255,103,27)",
                    "fgXmlColor": "#FFFFFF",
                    "id": "line:144",
                    "name": "Sept Deniers - Salvador Dali / Fonsegrives Entiore",
                    "network": "Tisséo",
                    "shortName": "L1"
                },
                "realTime": "yes"
            },
            ...
        ],
        "stop": {
            "id": "stop_point:SP_3758",
            "name": "Tilleuls",
            "operatorCode": "7061"
        },
        "stopArea": {
            "cityId": "admin:fr:31555",
            "cityName": "TOULOUSE",
            "id": "stop_area:SA_871",
            "name": "Tilleuls"
        }
    },
    "expirationDate": "2024-10-22 21:12"
    }
}
```

- Si toutes les infos concordent (L1, stopArea name, destination name) on peut noter l'operatorCode, sinon on continue à chercher ♥

## Codes associés aux arrêts de ligne

| Arrêt                                                        | operatorCode |
| ------------------------------------------------------------ | ------------ |
| **Tilleuls** - direction *Sept Deniers - Salvador Dali*      | 7060         |
| **François Verdier** - direction *Fonsegrives Entiore* / Gymnase de l'Hers | 6746         |
| **Jean Jaurès** - direction *Fonsegrives Entiore* / Gymnase de l'Hers | 3676         |
| **Jean d'Arc**  - direction *Fonsegrives Entiore / Gymnase de l'Hers* | 3708         |
| **Compans - Cafarelli** - direction *Fonsegrives Entiore / Gymnase de l'Hers* | 2563         |

## Paramètres supplémentaires

| Nom du paramètre | Description                      | Valeur                            |
| ---------------- | -------------------------------- | --------------------------------- |
| lineId           | Identifiant de la ligne (ici L1) | line:144                          |
| number           | Nombre de résultats à renvoyer   | 2 ou 3, selon rendu visuel désiré |

## Ligne L1

| ⮟ LINEO 1                    |
| ---------------------------- |
| SEPT DENIERS - SALVADOR DALI |
| COMPANS-CAFFARELLI           |
| JEANNE D'ARC                 |
| JEAN JAURES                  |
| FRANÇOIS VERDIER             |
| TILLEULS                     |
| FONSEGRIVE - ENTIORE         |

## Documentation

- https://data.toulouse-metropole.fr/explore/?sort=modified
-  [documentation developpeur api 2 [fr].pdf](documentation developpeur api 2 [fr].pdf) 
