module Menu

    def menuInicial
        puts "Insira sua matricula:"
        mat = gets.chomp
    end

    def userInactive
        puts "Somente alunos ativos podem criar uffmail"
    end

    def hasUffmail
        puts "Usuario ja possui uffmail"
    end

    def matNotExists
        puts "Matricula invalida"
    end

    def optionsEmail(aluno,options)
        puts "#{aluno.nome}, por favor escolha uma das opcoes abaixo para o seu UFFMail"
        option = ""
        loop do
            puts options
            option = gets.chomp.to_i
            break if option > 0 && option <= options.size
        end
        selected = options[option.to_i-1]
    end

    def emailCreated(aluno)
        puts "A criacao de seu e-mail (#{aluno.uffmail.email}) sera feita nos proximos minutos.\nUm SMS foi enviado para #{aluno.telefone} com a sua senha de acesso."
    end
end
