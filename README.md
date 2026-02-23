#  Demand Prediction & Decision Assistant

##  Présentation du projet

Ce projet a pour objectif de construire un système complet de prédiction de la demande produit par zone géographique et d’intégrer un assistant intelligent basé sur un modèle de langage (LLM) afin d’aider à la prise de décision logistique. À partir du dataset historique all_data.csv contenant les transactions de vente, nous avons développé un pipeline permettant de nettoyer et préparer les données, analyser la demande, construire un modèle de prédiction, visualiser les résultats et interagir avec un assistant capable de répondre à des questions métier en langage naturel.

L’objectif principal est de répondre à des questions opérationnelles telles que : Où devrais-je augmenter les stocks de ThinkPad Laptop ? Quelle ville montre la plus forte progression de la demande ? ou encore Comparer la demande entre Dallas (TX) et Houston (TX). Ce système permet ainsi de transformer les données brutes en recommandations concrètes.

##  Préparation et nettoyage des données

La première étape a consisté à nettoyer et préparer les données. Le dataset original contenait des lignes invalides, des en-têtes dupliqués et des colonnes avec des types incorrects. Nous avons supprimé les lignes incorrectes, converti les colonnes Quantity Ordered et Price Each en valeurs numériques et transformé la colonne Order Date en format date. Nous avons également supprimé les valeurs aberrantes, notamment les quantités ou prix négatifs ou nuls.

Ensuite, nous avons extrait la zone géographique à partir de la colonne Purchase Address afin de créer une variable zone au format "Ville (État)", par exemple "Dallas (TX)". Cette variable est essentielle pour analyser la demande par zone. Nous avons également créé des variables supplémentaires comme le revenu (Quantity Ordered × Price Each) et une variable temporelle year_month représentant le mois de la transaction.

## Analyse exploratoire des données

Une analyse exploratoire a ensuite été réalisée afin de comprendre la distribution de la demande. Nous avons calculé le nombre total d’unités vendues, le revenu et le nombre de commandes par produit et par zone. Des visualisations ont été générées pour observer la tendance de la demande dans le temps. Une heatmap a également été créée pour visualiser l’intensité de la demande selon les zones et les périodes. Ces visualisations permettent d’identifier rapidement les zones à forte demande et les tendances de croissance.

##  Modélisation de la demande

Deux approches ont été utilisées pour prédire la demande.

La première approche est un modèle baseline basé sur un score prédictif combinant une moyenne mobile pondérée exponentielle (EWMA) et la croissance sur les trois derniers mois. Ce score permet d’estimer la demande future en donnant plus d’importance aux ventes récentes et à la tendance. Ce modèle est simple, robuste et efficace pour identifier les zones prioritaires.

La seconde approche est un modèle de machine learning supervisé utilisant l’algorithme HistGradientBoostingRegressor. Ce modèle utilise comme variables explicatives la zone géographique, le mois, l’année et les ventes des mois précédents (variables de retard appelées lags). Le modèle est entraîné sur l’historique des ventes et permet de prédire la demande du mois suivant pour chaque zone. La performance est évaluée à l’aide de la métrique MAE (Mean Absolute Error). Ce modèle permet d’obtenir une prédiction quantitative plus précise de la demande future.

## Visualisations

 Une heatmap permet de visualiser la demande par zone et par période. 
 Malheuresement, j'ai pas pu faire la carte géographique.

##  Assistant intelligent basé sur un LLM

Un assistant intelligent basé sur un modèle de langage open-source a été intégré afin d’interpréter les résultats et répondre aux questions métier. Cet assistant utilise les résultats du modèle comme contexte et génère des réponses en langage naturel. Il est capable de recommander les zones où augmenter les stocks, d’identifier les zones avec la plus forte croissance et de comparer la demande entre deux villes. L’assistant ne calcule pas lui-même les prédictions, mais utilise les résultats du modèle pour générer des recommandations claires et actionnables. Cela permet de rendre le système accessible à des utilisateurs non techniques.

##  Exécution avec Docker

Le projet a été conteneurisé avec Docker afin de garantir la reproductibilité. Le fichier docker-compose.yml permet d’installer automatiquement toutes les dépendances nécessaires et de lancer Jupyter Notebook en local. L’utilisateur peut ensuite ouvrir le notebook via le navigateur et exécuter l’ensemble du pipeline.

Commande pour lancer le projet :

docker compose up --build

Puis ouvrir dans le navigateur :

http://localhost:8888

##  Structure du projet

Le projet est organisé de la manière suivante :

project/
│
├── notebooks/
│   └── test_data_eng_Hasina.ipynb
│
├── Dockerfile
├── docker-compose.yml
├── README.md

## Technologies utilisées

Ce projet utilise les technologies suivantes :

Python pour le traitement des données et la modélisation  
Pandas et NumPy pour la manipulation des données  
Scikit-Learn pour le modèle de machine learning  
Matplotlib pour les visualisations  
Transformers pour le modèle de langage  
Jupyter Notebook pour le développement  
Docker pour le déploiement  

##  Résultat final

Ce projet fournit un système complet permettant d’analyser les ventes, prédire la demande future, visualiser les résultats et assister la prise de décision. Il constitue une solution d’aide à la décision basée sur les données et l’intelligence artificielle, applicable à des problématiques réelles de gestion des stocks et de logistique.

##  Auteur

Projet réalisé dans le cadre d’un test technique Data Science / AI Engineer.