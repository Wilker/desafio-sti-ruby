require_relative 'email'
require_relative 'uffmail'
class Aluno
    attr_accessor :nome
    attr_accessor :matricula
    attr_accessor :telefone
    attr_accessor :email 
    attr_accessor :uffmail 
    attr_accessor :status
    
    def initialize(
                   nome,
                   matricula,
                   telefone,
                   email,
                   uffmail,
                   status
                   )
        @nome = nome 
        @matricula = matricula
        @telefone = telefone
        @status = status
        @email = Email.new(email)
        @uffmail = Uffmail.new(uffmail)
    end 
    
    def has_uffmail?
        
    end
    
end
