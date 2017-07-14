=begin
require_relative 'aluno'
require_relative 'email'
require_relative 'manageFile'
require_relative 'sistema'
require 'csv'

aluno = Aluno.new(
               "Wilker Oliveira Delfino", 
               114083058,
               "2121",
               "teste@gmail.com",
               "teste@id.uff.br",
               "Ativo"
               )              
=end


          
#email = Email.new("teste@gmail.com")

#puts aluno.email.generateEmail(aluno.nome)

#print "#{email.aluno.nome} \n#{email.aluno.matricula} \n#{email.aluno.email} \n#{email.aluno.uffmail} \n#{email.aluno.status}\n"


#puts email.generateEmail("Laura Azevedo Cunha")

#alunos = ManageFile.new("./alunos.csv").read

=begin
#testes de status e de existencia de uffmail
aluno = alunos.detect{|aluno| aluno.matricula == "105794"}
puts "encontrado? " + alunos.include?(aluno).to_s

active = aluno.status=="Ativo" ? true : false           
puts "ativo? " + active.to_s

uffmail = aluno.uffmail=="" ||aluno.uffmail.include?("@id.uff.br") ? true : false
puts "uffmail? " + uffmail.to_s

puts "##################"

aluno = alunos.detect{|aluno| aluno.matricula == "100484"}
puts "encontrado? " + alunos.include?(aluno).to_s

active = aluno.status=="Ativo" ? true : false           
puts "ativo? " + active.to_s 

uffmail = aluno.uffmail==nil || aluno.uffmail.include?("@id.uff.br")  ? false : true
puts "uffmail? " + uffmail.to_s

puts "##################"

aluno = alunos.detect{|aluno| aluno.matricula == "109647"}
puts "encontrado? " + alunos.include?(aluno).to_s

active = aluno.status=="Ativo" ? true : false           
puts "ativo? " + active.to_s 

uffmail = aluno.uffmail==nil || aluno.uffmail.include?("@id.uff.br")  ? false : true
puts "uffmail? " + uffmail.to_s
#fim testes de existênca de uffmail
=end


#sistema = Sistema.new(alunos)

#sistema.start

require_relative 'bd'
require_relative 'uffmail'
require_relative 'email_generator'

nome  = "Wilker de Oliveira Delfino"
def remove_prepositions!(nome)
   prep = ["e", "do", "da", "do", "das", "de", "di", "du"]
   nome.split(" ").delete_if{|x| prep.include?(x)}
end
remove_prepositions!(nome)

db = DataBase.new("./alunos.csv")
email_creator = EmailService.new(db)
email_creator.email_already_exists?("wilker_oliveira@id.uff.br")

puts email_creator.generateEmail("Wilker de Oliveira Delfino", Uffmail::PREFIX)

puts email_creator.generateEmail("Joao da Silva Saurosss", Uffmail::PREFIX)

