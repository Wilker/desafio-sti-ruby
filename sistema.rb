require_relative 'menu'
require_relative 'manageFile'

class Sistema
    include Menu
    attr_accessor :path 
    def initialize(path)
        @path = path
        @alunos = read_alunos
    end
    
    def start   
        alunos = read_alunos
        aluno = solicita_aluno(alunos)
        
        if can_create_uffmail?(UffmailValidator.new(aluno))
            criar_uffmail(aluno)
            atualizar_banco(alunos)
        end                   
    end
    
    private
    
    def can_create_uffmail?(validator)
        return notExists unless validator.person_exists?
        return userInactive unless validator.person_active?
        return hasUffmail if validator.person_has_uffmail?
        true
    end
    
    def atualizar_banco(alunos)
        fileManager.write(alunos)        
    end
    
    def criar_uffmail(aluno)
        createUffMail(aluno, optionsEmail(aluno))
        emailCreated(aluno)
    end
    
    def read_alunos
        fileManager = ManageFile.new(path)
        fileManager.read
    end
    
    def solicita_aluno(alunos)
        mat = menuInicial
        alunos.detect{|aluno| aluno.matricula == mat.to_s}
    end
    
    def apto_a_criar_uffmail(aluno)
        exists?(aluno) && is_active?(aluno) && has_uffmail?(aluno)
    end
    
    def createUffMail(aluno, option)
        aluno.uffmail.email = option
    end
    
end
