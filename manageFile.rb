require 'csv'

class ManageFile
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
    
    def read()
        alunos = [] 
        CSV.foreach(path, headers: true){ 
        |row| alunos << row.to_hash
        }
        return alunos
    end
    
end    
