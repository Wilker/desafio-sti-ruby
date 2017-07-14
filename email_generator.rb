class EmailService

    attr_accessor :db
    attr_reader modificador = 0
    def initialize(db)
        @db = db
    end
    
    
    def generateEmail(nome_aluno, sufix)
        emails = []
        nomes = remove_prepositions(nome_aluno)
        
        #TODO refatorar para pegar  nomes < 3
        emails << option_one(nomes,modificador)
        emails << option_two(nomes,modificador)
        emails << option_three(nomes,modificador)
        emails << option_four(nomes,modificador)
        emails << option_five(nomes,modificador)
        
        emails.map!(&:downcase)
    end
    
    def email_already_exists?(email)
        db.email_already_exists?      
    end
   
    private
    
    def remove_prepositions!(nome)
       prep = ["e", "do", "da", "do", "das", "de", "di", "du"]
       nome.split(" ").delete_if{|x| prep.include?(x)}
    end
    
    
    def option_one(names, mod)
        mod = "" if mod == 0
        option = names[0] + "_" + names[1] + mod.to_s + sufix
        option_one(names,mod+=1) if email_already_exists?(option)
        return option
    end
    
   
    def option_two(names, mod)
        mod = "" if mod == 0 
        option = names.length > 2 ? names[0] + names[1].chr+ names[2].chr + sufix : names[0]+names[1].chr + modificator + sufix
        option_two(names, mod+=1) if email_already_exists?(option)
        return option
    end     
    
    def option_three(names, mod)
        mod = "" if mod == 0 
        option = nomes[0] + nomes[-1] + modificator + sufix
        option_three(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
    def option_four(names, mod)
        mod = "" if mod == 0 
        option = nomes[0].chr + nomes[2] + mod + sufix
        option_four(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
    def option_five(names, mod)
        mod = "" if mod == 0 
        option = nomes[0].chr + nomes[1] + nomes[2] + modificator + sufix
        option_five(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
end
