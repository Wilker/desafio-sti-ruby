class EmailService

    attr_accessor :db
    MODIFIER = 0
    def initialize(db)
        @db = db
    end
    
    
    def generateEmail(nome_aluno, sufix)
        emails = []
        names = remove_prepositions(nome_aluno)
        
        #TODO refatorar para pegar  names < 3
         emails << option_one(names,MODIFIER, sufix)
         emails << option_two(names,MODIFIER, sufix)
         emails << option_three(names,MODIFIER, sufix)
         emails << option_four(names,MODIFIER, sufix)
         emails << option_five(names,MODIFIER, sufix)
    end
    
    def email_already_exists?(email)
        db.email_already_exists?(email)      
    end
   
    private
    
    def remove_prepositions(nome)
       prep = ["e", "do", "da", "do", "das", "de", "di", "du"]
       nome.split(" ").delete_if{|x| prep.include?(x)}.map!(&:downcase)
    end
    
    
    def option_one(names, mod, sufix)
        mod = "" if mod == 0
        option = names[0] + "_" + names[1] + mod.to_s + sufix

        option = option_one(names, mod.to_i + 1, sufix) if email_already_exists?(option)
        return option
    end
    
   
    def option_two(names, mod, sufix)
        mod = "" if mod == 0 

        option = names.length > 2 ? names[0] + names[1].chr+ names[2].chr + mod.to_s  + sufix : names[0]+names[1].chr + mod.to_s + sufix
        
        option = option_two(names, mod.to_i + 1, sufix) if email_already_exists?(option)
        return option
    end     
    
    def option_three(names, mod, sufix)
        mod = "" if mod == 0 
        
        option = names[0] + names[-1] + mod.to_s + sufix
        
        option = option_three(names, mod.to_i + 1, sufix) if email_already_exists?(option)
        return option
    end
    
    def option_four(names, mod, sufix)
        mod = "" if mod == 0 
        
        option = names[0].chr + names[-1] + mod.to_s + sufix
        
        option = option_four(names, mod.to_i + 1, sufix) if email_already_exists?(option)
        return option
    end
    
    def option_five(names, mod, sufix)
        mod = "" if mod == 0 
        
        option = names[0].chr + names[0] + names[-1] + mod.to_s + sufix
        
       option = option_five(names, mod.to_i + 1, sufix) if email_already_exists?(option)
        return option
    end
    
end
