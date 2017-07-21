class UffmailValidator
    
    
    attr_accessor :aluno
    
    def initialize(person)
    @aluno = person
    end
    
    def person_exists?
        aluno
    end
    
    def person_active?
        aluno.status == "Ativo"
    end
    
    def person_has_uffmail?
        aluno.get_uffmail
    end
    
end
