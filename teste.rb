require_relative 'aluno'
require_relative 'email'
require_relative 'manageFile'
require 'csv'

aluno = Aluno.new(
               "Wilker", 
               114083058,
               "2121",
               "teste@gmail.com",
               "teste@id.uff.br",
               "Ativo"
               )
               
email = Email.new("teste@gmail.com")

#print "#{email.aluno.nome} \n#{email.aluno.matricula} \n#{email.aluno.email} \n#{email.aluno.uffmail} \n#{email.aluno.status}\n"


puts email.generateEmail("Laura Azevedo Cunha")

alunos = ManageFile.new("./alunos.csv").read

alunos.each{|aluno|aluno.each{|k,v| puts v if k=="matricula"}}

# print file
