require_relative 'menu'
require_relative 'manageFile'

class Sistema
    include Menu
    attr_accessor :alunos 
    
    def initialize(alunos)
    @alunos = alunos
    end
            
    def matExists(mat)
    aluno = alunos.detect{|aluno| aluno.matricula == mat.to_s}
    return alunos.include?(aluno)
    end
    
    def isActive(mat)
    aluno = alunos.detect{|aluno| aluno.matricula == mat.to_s}
    active = aluno.status=="Ativo" ? true : false
    end
    
    def checkUffMail(mat)
    aluno = alunos.detect{|aluno| aluno.matricula == mat.to_s}
    uffmail = aluno.uffmail.email==nil || !aluno.uffmail.email.include?("@id.uff.br")  ? false : true
    end
    
    def createUffMail(aluno, option)
        aluno.uffmail.email  = option
    end
    
    def start()
        fileManager = ManageFile.new("./alunos.csv")
        @alunos = fileManager.read
        
        #TODO refatorar para pegar o aluno uma vez apenas!!
        mat = menuInicial
                       
        if(!matExists(mat))
        matNotExists
        return
        end
        
        if(!isActive(mat))
        userInactive
        return
        end
        
        if(checkUffMail(mat))
        uffMailExists
        return
        end
                
        aluno = alunos.detect{|aluno| aluno.matricula == mat.to_s}
        uffMail = optionsEmail(aluno)
        createUffMail(aluno, uffMail)
        emailCreated(aluno)
        fileManager.write(alunos)
    end
    
end
