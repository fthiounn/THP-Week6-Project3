# THP - Week 6 - Project 3 - Eventbrite : Devise et premières views
# Francois THIOUNN 

# Notes & Use :

- hosted on heroku at : 

# Projet : Stripe ton Eventbrite
  
1. Introduction
Nous allons continuer le projet Eventbrite pour faire en sorte que les utilisateurs peuvent rejoindre un événement. Comme tout événement a un prix, il te faudra faire payer l'utilisateur pour qu'il rejoigne l'événement.

2. Le projet
Voici comment cela va se passer :

Si un utilisateur atterrit sur la page de l'événement et que ce dernier n'est ni déjà participant, ni administrateur de l'événement, il peut cliquer sur un bouton qui va le rediriger vers une page contenant un formulaire d'inscription. Ce formulaire aura un checkout de Stripe qui lui demandera le prix de l'événement (participations#new)
Si l'utilisateur arrive à bien payer l'événement et que tout est en règle, cela va créer une participation associée à l'utilisateur et l'événement, puis il va être redirigé vers l'événement. La participation va stocker l'id Stripe de l'utilisateur, qui pourra resservir pour une opération future
Si le créateur d'un événement va sur le show d'un événement qu'il a créé, il peut avoir accès à un lien qui va le rediriger vers la liste des invités à l'événement (participations#index)
Cette page qui affiche les participants à un événement aura un lien pour modifier (ou supprimer) l'événement (events#edit)
Évidemment, ces deux pages vu plus haut sont inaccessibles aux personnes qui ne sont pas administratrices de l'événement
2.1. Paiement d'un événement
Sur la page d'un événement, si un utilisateur est connecté, et que ce dernier n'est ni créateur, ni déjà participant à l'événement, un lien "rejoindre l'événement" doit être visible sur la page. Ce lien doit renvoyer vers un formulaire à remplir pour rejoindre l'événement. Ce formulaire doit être branché à Stripe et doit faire payer à l'utilisateur le prix de l'événement.

Attention, il faut bien faire en sorte que si la carte bleue ne passe pas ou si le paiement échoue, on ne va pas créer en base une participation.

Si l'utilisateur paie l'événement, cela va donc créer la participation associée à l'événement et l'utilisateur, puis ce dernier va être redirigé vers la page de l'événement. N'oublie pas de stocker la stripe_id de l'utilisateur qui resservira pour une opération future 😉

Bien entendu, le paiement doit être fonctionnel en production (on autorise les clés APIs de test en prod).

2.2. La page pour la liste des invités
Afin de laisser la possibilité à un administrateur de voir la liste des invités, nous allons créer une page pour qu'il puisse gérer l'événement. Sur la page show d'un événement, si l'utilisateur qui la visionne est le créateur de l'événement, un lien pour "mon espace événement" doit apparaitre. Ce lien doit rediriger vers une page qui affiche la liste des invités participations#index. Cette page doit faire apparaitre un lien qui emmène vers une page d'édition de l'événement (events#edit). Cette page permettra d'éditer l'événement (events#update) et on pourra y voir un bouton pour supprimer l'événement (events#destroy).

Bien entendu, ces pages ne doivent absolument pas être accessibles par d'autres personnes que le créateur d'un événement (indice : une petite méthode bien placée en before_action dans le events_controller 😉)

2.3. BONUS : prix optionnel
Allez, exercice final : nous allons changer la base de données, les controllers, et les views pour autoriser les événements gratuits. Voici comment cela va se passer :

À la création, un événement peut avoir un prix de 0
À son affichage, un événement avec un prix de 0, peut être rejoint par un utilisateur du site. Ce dernier n'aura pas de checkout Stripe à remplir.
🚀 ALERTE BONNE ASTUCE
Ruby et Rails aiment vraiment beaucoup le code lisible. Écrire @event.price == 0 dans la view, ou dans le controller est cool, mais faire une méthode d'instance pour pouvoir écrire @event.is_free? est beaucoup plus facilement compréhensible.

N'hésite vraiment pas à utiliser les méthodes d'instances. Tout ce qui aide ton code à être plus lisible est en général très bien vu.

3. Rendu attendu
Eventbrite qui déchire !