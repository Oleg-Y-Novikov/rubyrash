require 'pony'
require 'io/console'
require_relative 'create_email'
require_relative 'create_hash'

#my_mail = "novikov.oleg.gsx@mail.ru"

email = CreateEmail.new

hash = CreateHash.new(email)

#print hash.email_hash
Pony.mail(hash.email_hash)
#Pony.mail(CreateHash.new(email))