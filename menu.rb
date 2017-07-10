module Menu

    def menuInicial
    puts "Insira sua matricula:"
    mat = gets.chomp
    end
    
    def userInactive
    puts "Somente alunos ativos podem criar uffmail"
    end
   
    def uffMailExists
    puts "Usuario ja possui uffmail"
    end
    
    def matNotExists
    puts "Matricula invalida"
    end    
    
    def optionsEmail(aluno)
    puts "Escolha uma Opcao"
    puts aluno.email.generateEmail(aluno.nome)
    option = gets.chomp
    end
    
end
