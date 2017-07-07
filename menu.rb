module Menu

    def inicial
    puts "Insira sua matrícula:"
    mat = gets.chomp
    end
    
    def userInactive
    puts "Somente alunos ativos podem criar uffmail"
    end
   
    def uffMailExists
    puts "Usuário já possui uffmail"
    end
    
end
