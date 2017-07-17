require_relative 'manageFile.rb'

class DataBase
    attr_accessor :db
    attr_accessor :path
    
    def initialize(file_path)
        @path = file_path
        @db = load_db(file_path)
    end
    
    def email_already_exists?(email)
        db.detect{|aluno| aluno.get_uffmail == email.to_s}
    end 
    
    def get_aluno(mat)
        db.detect{|aluno| aluno.matricula == mat.to_s}
    end

    def load_db(file_path)
        ManageFile.new(file_path).read
    end

    def save(alunos)
        puts db.class
        puts alunos.class
        ManageFile.new(path).write(alunos.db)
    end
end

