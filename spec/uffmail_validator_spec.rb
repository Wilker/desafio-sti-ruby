require 'rspec'
require 'uffmail_validator'
require 'aluno'


describe UffmailValidator do
  let(:person) {Aluno.new(
      "Lord Vader",
      114083058,
      "2121",
      "Dvader@gmail.com",
      "lordvader@id.uff.br",
      "Ativo"
  )}
  let(:validator) {UffmailValidator.new(person)}

  describe '.person_exists?' do
    context 'when person exist' do
      it 'should be true' do
        expect(validator.person_exists?).to be_truthy
      end
    end
  end


  describe '.person_active?' do
    context 'when person is active' do
      it 'should be true' do
        expect(validator.person_active?).to be_truthy
      end
    end
  end

  describe '.person_has_uffmail?' do
    context 'when person already has uffmail' do
      it 'should be true' do
        expect(validator.person_has_uffmail?).to be_truthy
      end
    end
  end

end