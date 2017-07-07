require_relative 'aluno'
require_relative 'email'



aluno = Aluno.new(
               "Wilker", 
               114083058,
               "2121",
               "wilker.rj@gmail.com",
               "wilkeroliveira@id.uff.br",
               "Ativo"
               )
               
email = Email.new("Wilker.rj@gmail.com")

#print "#{email.aluno.nome} \n#{email.aluno.matricula} \n#{email.aluno.email} \n#{email.aluno.uffmail} \n#{email.aluno.status}\n"


puts email.generateEmail("Laura Azevedo Cunha")
