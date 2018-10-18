# Jeudi 18 Octobre : Envoyeur d'emails fou :collision: :collision:


## La team :family: :

Noms | Pseudo Slack
------------ | -------------
Pauline Labaisse | @Pauline Labaisse :baby_chick:
Margaux Cortier | @Margaux Crt :penguin:
Irina Penkovskaia | @Ira P. :octocat:
Max de Ponfilly | @Max :tiger:
Hélène Martin | @Helene Cbm :panda_face:
Victor Gabella | @Chartie :bear:


## :floppy_disk: Le programme :floppy_disk: : 

Voici comment se décompose notre dossier :

```
Projet_Jeudi
├── .gitignore
├── .env (pas sur le répo GitHub, bien entendu 😉)
├── README.md 				:coucou vous etes 'ici'
├── Gemfile								
├── app.rb 				:lance le programme
├── data_base
│   └── town_hall.json 			:fichier de datas
└── lib
    ├── app
    │   ├── json_scrapper.rb 			:inscrit les infos des mairies dans le .json
    │   ├── mailer.rb 				:envoie les emails
    │   ├── scrapper.rb 			:scrappe les infos des mairies
    │ 	└── twitter.rb 				(:récupère tous les noms des mairies puis les follow)
    │							pas fini pour cause de ban
    └── views
        └── index.rb 				:fais l'interface entre tous les app
```

1. En premier lieu veuiller lancer `$ bundle install` dans votre console.
2. Ensuite veuillez lancer le programme `$ ruby app.rb`.
3. :warning::warning: ne pas envoyer les mails :warning::warning:



