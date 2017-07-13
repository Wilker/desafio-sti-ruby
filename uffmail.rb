require_relative 'email'

class Uffmail < Email

    PREFIX = '@id.uff.br'
    
    def initialize(email)
        super(email)
    end
end
