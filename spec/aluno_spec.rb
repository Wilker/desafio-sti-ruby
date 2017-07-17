# ./spec/aluno_spec.rb
require 'aluno'

describe Aluno do

subject do
        Aluno.new(
            'Wilker Oliveira Delfino',
            114083058,
            '2121',
            'teste@gmail.com',
            'teste@id.uff.br',
            'Ativo'
        )
end



describe '.get_uffmail' do
  context 'get the uff mail' do
    it 'should return the uffmail' do
      expect(subject.get_uffmail).to include('@id.uff.br')
    end
  end
end




end