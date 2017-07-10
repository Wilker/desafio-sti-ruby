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
    alunos = CSV.read(path).collect{ |row| Aluno.new *row }
    end
end    
