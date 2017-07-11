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
    puts "#{aluno.nome}, por favor escolha uma das opcoes abaixo para o seu UFFMail"
    options = aluno.email.generateEmail(aluno.nome)
    puts options
    option = gets.chomp
    selected = options[option.to_i+1]
    end
    
    def emailCreated(aluno)
    puts "A criacao de seu e-mail (#{aluno.uffmail}) sera feita nos proximos minutos.
Um SMS foi enviado para #{aluno.telefone} com a sua senha de acesso."
    end
end
