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
    alunos.inclue?(alunos)
    end
    
    def isActive(mat)
    aluno = alunos.detect{|aluno| aluno.matricula == mat.to_s}
    active = aluno.status=="Ativo" ? true : false
    end
    
    
    
    def start()
        @alunos = ManageFile.new("./alunos.csv").read
        
        mat = menuInicial
                       
        if(!matExists(mat))
        matNotExists
        return
        end
        
        if(!isActive(mat))
        userInactive
        return
        end
        
        if(!checkUffMail(mat))
        uffMailExists
        return
        end
        
    end
    
end
