require 'csv'
require_relative 'aluno'

class ManageFile
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
 
=begin
    def read
        alunos = [] 
        CSV.foreach(path, headers: true){ 
        |row| alunos << row.to_hash
        }
        return alunos
    end
=end

    # Função para carregar cada linha do arquivo para um objeto da classe aluno
    def read
        aluno = CSV.read(path).collect{|row| Aluno.new *row}
    end
    
    def write(alunos)
        CSV.open(path, "w") do |row|
        alunos.each{|aluno| row << [aluno.nome,
                                    aluno.matricula,
                                    aluno.telefone,
                                    aluno.email.email,
                                    aluno.uffmail.email,
                                    aluno.status]}
        end
    end
                               
end    
