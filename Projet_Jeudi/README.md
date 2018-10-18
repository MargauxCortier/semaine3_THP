# Projets validant du Jeudi 18 Octobre_semaine3_THP :collision: :collision:


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
ultimate_townhall
├── .gitignore
├── .env (pas sur le répo GitHub, bien entendu 😉)
├── README.md 							:vous vous trouvez sur le README.md
├── Gemfile												
├── Gemfile.lock
├── app.rb 								:lance l'application
├── data_base
│   └── town_hall.json
└── lib
    ├── app
    │   ├── json_scrapper.rb 			:inscrit les infos des mairies dans le .json
    │   ├── mailer.rb 					:envoie les emails
    │   ├── scrapper.rb 				:scrappe les infos des mairies
    │ 
    └── views
        ├── index.rb
```

1. En premier lieu veuiller lancer `$ bundle install` dans votre console.
2. Ensuite veuillez lancer le programme `$ ruby app.rb`.
3. :warning::warning: ne pas envoyer les mails :warning::warning:



