class Email

    PREFIX = '@email.com'

	attr_accessor :email
 
    def initialize(email)
        @email = email
    end

    def generateEmail(nome_aluno)
        emails = []
        nomes = nome_aluno.split(" ")
        emails << nomes[0] + "_" + nomes[1] + PREFIX
        emails << nomes.length > 2 ? nomes[0] + nomes[1].chr+ 
                    nomes[2].chr + PREFIX :
                    nomes[0]+nomes[1].chr + PREFIX
        #TODO refatorar para pegar  nomes < 3
        emails << nomes[0] + nomes[2] + PREFIX
        emails << nomes[0].chr + nomes[2] + PREFIX
        emails << nomes[0].chr + nomes[1] + nomes[2] + PREFIX
        
    return emails.map!(&:downcase)
    end
    
    
end 
