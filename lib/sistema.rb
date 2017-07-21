require_relative 'menu'
require_relative 'manageFile'
require_relative 'uffmail_validator'
require_relative 'email_generator'
require_relative 'uffmail'
require_relative 'bd.rb'

class Sistema
    include Menu
    
    attr_accessor :database
    
    def initialize(path)
        @database = read_alunos(path)
    end
    
    def start   

        aluno = solicita_aluno(database)
                
        if can_create_uffmail?(UffmailValidator.new(aluno))
            criar_uffmail(aluno)       
            atualizar_banco(database)
        end                   
    end
    
    private
    
    def can_create_uffmail?(validator)
        return matNotExists unless validator.person_exists?
        return userInactive if validator.person_active?
        return hasUffmail if validator.person_has_uffmail?
        true
    end
    
    def atualizar_banco(alunos)   
        database.save(alunos)        
    end
    
    def criar_uffmail(aluno)
        email_creator = EmailService.new(database)
        options = email_creator.generate_email(aluno.nome,Uffmail::PREFIX)
        option = optionsEmail(aluno,options)
        createUffMail(aluno,option)
        emailCreated(aluno)
    end
    
    def read_alunos(path)
        DataBase.new(path)
    end
    
    def solicita_aluno(alunos)
        mat = menuInicial
        database.get_aluno(mat)
    end
    
    def apto_a_criar_uffmail(aluno)
        exists?(aluno) && is_active?(aluno) && has_uffmail?(aluno)
    end
    
    def createUffMail(aluno, option)
        aluno.uffmail.email = option
    end
    
end
