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
               
email = Email.new("teste@gmail.com")

puts aluno.email.generateEmail(aluno.nome)

#print "#{email.aluno.nome} \n#{email.aluno.matricula} \n#{email.aluno.email} \n#{email.aluno.uffmail} \n#{email.aluno.status}\n"


#puts email.generateEmail("Laura Azevedo Cunha")

alunos = ManageFile.new("./alunos.csv").read

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


sistema = Sistema.new(alunos)

sistema.start

# print file
