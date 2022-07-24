# README
This is an Ruby on Rails API built for an assignment for Reconcept. The requirements can be found at the bottom. I have used Postman to test the API. The database design can be found [here](https://dbdiagram.io/d/62d920e70d66c746552045f1).

## To run the project
This is a normal RoR project so there are no special instructions to get the server running. To initiate the database:

```
rails db:create
rails db:migrate
rails db:seed
```

To test the API within Postman there is a [JSON file](Reconcept%20code%20assignment.postman_collection.json) included within this project and can be imported.

## The assignment
As described in the mail.

> Het doel van de opdracht is het bouwen van een simpele API voor een twitter-achtige applicatie.
>
> Er gelden de volgende requirements:
>
> Users
> - [x] Het moet mogelijk zijn om een gebruiker aan te maken/aan te passen. Een gebruiker hoeft alleen maar basis velden te hebben zoals user_name en email. (Er hoeft geen compleet registratie en login systeem gebouwd te worden, het simpel aanmaken van een gebruiker is voldoende)
>
> Messages
> - [x] Het moet mogelijk zijn voor een gebruiker om een bericht aan te maken/aan te passen/te verwijderen
> - [x] Het moet mogelijk zijn om een overzicht te krijgen van alle berichten
> - [x] Het moet mogelijk zijn om een overzicht te krijgen van alle berichten van een gebruiker
>
> Tags
>
> - [x] Het moet mogelijk zijn om meerdere tags toe te voegen en te verwijderen van een bericht.
> - [x] Het moet mogelijk zijn om een overzicht te krijgen van alle berichten die een bepaalde tag hebben
> - [x] Het moet mogelijk zijn om een overzicht te krijgen van alle tags en hoe vaak ze gebruikt worden

## To do
- [ ] Add possibility to add/remove existing tags to posts (PUT request instead of PATCH)
- [ ] Validations

## Further implementation
- Add serializing of data (see [Stack Overflow](https://stackoverflow.com/questions/52508432/rails-4-render-json-with-multiple-objects-and-includes) and [ActiveModelSerializers](https://github.com/rails-api/active_model_serializers/tree/0-10-stable))
