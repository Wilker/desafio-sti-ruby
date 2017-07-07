class Email


	attr_accessor :email
 
    def initialize( email)
        @email = email

    end

    def generateEmail(nome_aluno)
        emails = []
        nomes = nome_aluno.split(" ")
        emails[0] = nomes[0] + "_" + nomes[1] + "@id.uff.br"
        emails[1] = nomes.length > 2 ? nomes[0] + nomes[1].chr+ 
                    nomes[2].chr + "@id.uff.br" :
                    nomes[0]+nomes[1].chr + "@id.uff.br"
        #TODO refatorar para pegar  nomes < 3
        emails[2] = nomes[0] + nomes[2] + "@id.uff.br"
        emails[3] = nomes[0].chr + nomes[2] + "@id.uff.br"
        emails[4] = nomes[0].chr + nomes[1] + nomes[2] + "@id.uff.br"
        
    return emails.map!(&:downcase)
    end
    
    
end 
