require_relative 'menu'
require_relative 'manageFile'

class Sistema

    def matExists(mat)
    aluno.each{|aluno| aluno.each{|k,v| matricula==v}}
    end
    
    def isActive(mat)
    end
    
    
    
    def start()
        alunos = ManageFile.new("./alunos.csv").read
        
        mat = Menu.inicial()
        
        if(!matExists(mat))
        Menu.notExists
        return
        end
        
        if(!isActive(mat))
        Menu.userInactive
        return
        end
        
        if(!checkUffMail(mat))
        Menu.uffMailExists
        return
        end
        
    end
    
end
