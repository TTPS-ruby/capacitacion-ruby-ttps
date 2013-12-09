!SLIDE smbullets transition=uncover small
# Configuraciones
* Rails es conocido por su lema: **convention over configuration**
  * Al aplicarlo, se reducen muchas configuraciones
  * No todas las configuraciones pueden eliminarse
  * Las aplicaciones requieren credenciales o API keys para poder funcionar
* El verisonado con **git** debe evitar el guardado de estas credenciales
* Una buena práctica para configurar estos datos es usar variables de entorno
  dado que:
  * La soportan todos SO como Windows, Mac y Linux, así como Heroku y otras
    plataformas de deployment
  * Las variables de ambiente pueden accederse desde ruby
  * Mantienen la privacidad del proyecto de forma independiente
  * La gema **[figaro](https://github.com/laserlemon/figaro)** permite setear
    variables desde el shell o desde un archivo de configuración
  * La gema **[dotenv](https://github.com/bkeepers/dotenv)** permite setear

!SLIDE smbullets transition=uncover small
# Cómo usar las variables de entorno
* Las variables de entorno se usan mediante la constante **ENV**. 
* Supongamos que se necesita configurar en alguna parte de nuestra aplicación
  rails, un servidor de mail

## Ejemplo de configuración de mail

	@@@ruby
	config.action_mailer.smtp_settings = {
	  address: "smtp.gmail.com",
	  port: 587,
	  domain: ENV["DOMAIN_NAME"],
	  authentication: "plain",
	  enable_starttls_auto: true,
	  user_name: ENV["GMAIL_USERNAME"],
	  password: ENV["GMAIL_PASSWORD"]
	}

¿De qué forma seteamos los valores **DOMAIN_NAME**, **GMAIL_USERNAME** y **GMAIL_PASSWORD**?

!SLIDE smbullets transition=uncover small
# Como setear las variables con figaro

  
	@@@ruby
	gem 'figaro'

## Instalamos la gema con bundler

	@@@bash
	$ bundle install
	...
	Using rails (4.0.1) 
	Installing figaro (0.7.0) 
	Using jbuilder (1.5.2) 
	...
	

## Verificamos se instaló

	@@@bash
	$ bundle exec rails generate
	...
	Figaro:
		figaro:install
	...

!SLIDE smbullets transition=uncover 
# Usando figaro
* Esta gema setea las variables de entorno antes de hacer cualquier otra cosa
* Los valores se leen desde un archivo: `config/application.yml`
* La gema entra en acción cuando se ejecute: `rails generate figaro:install`
* Al instalar figaro, se crea el archivo `config/application.yml` y apendea al
  `.gitignore` que se ignore esta configuracion
  * *De esta forma, los valores quedarán privados y no en el repositorio de git*

!SLIDE smbullets transition=uncover 
#Usando figaro
## Instalando figaro

	@@@bash
	$ bundle exec rails generate figaro:install
			create	config/application.yml
			append	.gitignore
	
## Editamos `config/application.yml`
	@@@ yaml
	GMAIL_USERNAME: mygmailusername
	GMAIL_PASSWORD: mygmailpassword
	development:
	  GMAIL_USERNAME: otherusername
	  GMAIL_PASSWORD: otherpassword

*Podemos setear las variables según el entorno*
