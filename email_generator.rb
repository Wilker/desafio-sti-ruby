class EmailService

    attr_accessor :db
    attr_accessor :modificador
    def initialize(db)
        @db = db
        @modificador = 0
    end
    
    
    def generateEmail(nome_aluno, sufix)
        emails = []
        names = remove_prepositions(nome_aluno)
        
        #TODO refatorar para pegar  names < 3
        emails << option_one(names,modificador, sufix)
        emails << option_two(names,modificador, sufix)
        emails << option_three(names,modificador, sufix)
        emails << option_four(names,modificador, sufix)
        emails << option_five(names,modificador, sufix)
        
        emails.map!(&:downcase)
    end
    
    def email_already_exists?(email)
        db.email_already_exists?(email)      
    end
   
    private
    
    def remove_prepositions(nome)
       prep = ["e", "do", "da", "do", "das", "de", "di", "du"]
       nome.split(" ").delete_if{|x| prep.include?(x)}
    end
    
    
    def option_one(names, mod, sufix)
        mod = "" if mod == 0
        option = names[0] + "_" + names[1] + mod.to_s + sufix
        option_one(names,mod+=1) if email_already_exists?(option)
        return option
    end
    
   
    def option_two(names, mod, sufix)
        mod = "" if mod == 0 
        option = names.length > 2 ? names[0] + names[1].chr+ names[2].chr + sufix : names[0]+names[1].chr + modificator + sufix
        option_two(names, mod+=1) if email_already_exists?(option)
        return option
    end     
    
    def option_three(names, mod, sufix)
        mod = "" if mod == 0 
        option = names[0] + names[-1] + mod + sufix
        option_three(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
    def option_four(names, mod, sufix)
        mod = "" if mod == 0 
        option = names[0].chr + names[2] + mod + sufix
        option_four(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
    def option_five(names, mod, sufix)
        mod = "" if mod == 0 
        option = names[0].chr + names[1] + names[2] + mod + sufix
        option_five(names, mod+=1) if email_already_exists?(option)
        return option
    end
    
end
