require_relative 'manageFile.rb'

class DataBase
    attr_accessor :db
    
    def initialize(file_path)
        @db = load_db(file_path)
    end
    
    
    def load_db(file_path)
        ManageFile.new(file_path)
    end
    
    def email_already_exists?(email)
        db.detect{|aluno| aluno.get_email == email.to_s}
    end 
end