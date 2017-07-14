class UffMailValidator
    
    
    attr_accessor :aluno
    
    def initialize(person)
    @aluno = aluno
    end
    
    def person_exists?
        aluno
    end
    
    def person_active?
        aluno.status == "Active"
    end
    
    def person_has_uffmail?
        aluno.get_uffmail
    end
    
end
