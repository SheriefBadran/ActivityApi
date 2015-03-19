# EasyActApiHandler

## Installeringsmanual

Eftersom jag använder ett gem som heter device måste du genomföra ett par moment innan du kör rake db:setup, följ instruktionerna exakt!

* Gå in i filen config/initializers/device.rb och kommentera tillbaka föjande rad:
config.secret_key = '6c92e02ff1faacbce644b98bc8a35299a32a46ce2f8a0b343a47604ce6d1d6d104594eaf80fabfd17c750f395e429da49cff9170d11225cd2b6111b573a51d17'
Om den raden av någon anledning inte finns, skriv dit den.
* Skapa en fil i foldern config, filen måste heta secrets.yml.
* I secrets.yml skriver du sedan följande:
development:
  secret_key_base:
* Se till att det du lagt till i secrets.yml är formaterat exakt som i punkten ovan med radbyte och att båda ":" finns med.
* Gå nu till terminalen och kör rake secret
* Då får du tillbaka en secret_base_key som du klistrar in efter sista ":" secrets.yml enligt följande:
development:
  secret_key_base: c2238a8bca80f5928a60d2548ad838003b3ed806908818e21a84b30f48fbb2cfe0d0965b316c1b869de11ec056e37a68c89773ed079514172012ebd69bc3ba97

  Nyckeln du klistrat in ska inte vara skriven som en sträng!
* I terminalen, kör en rake db:setup.
* Kör bundle install. (tillagda gems: device, geocoder, rack-cors)
* Importera med följande länk i Postman: https://www.getpostman.com/collections/49ee035bad593596347e