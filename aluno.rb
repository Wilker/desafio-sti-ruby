class Aluno
    attr_accessor :nome
    attr_accessor :matricula
    attr_accessor :telefone
    attr_accessor :email #refatorar para incluir uma classe email
    attr_accessor :uffmail #refatorar para incluir uma classe email
    attr_accessor :status
    
    def initialize(
                   nome,
                   matricula,
                   telefone="",
                   email="",
                   uffmail="",
                   status="Inativo"
                   )
        @nome = nome 
        @matricula = matricula
        @telefone = telefone
        @email = email
        @uffmail = uffmail
        @status = status
    end
end
