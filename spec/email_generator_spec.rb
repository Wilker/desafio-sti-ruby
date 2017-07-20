require 'aluno'
require 'email_generator'
require 'spec_helper'
require 'bd'

describe EmailService do

  let(:db) {DataBase.new('/home/wilker/Documentos/Git/desafio-sti-ruby/lib/alunos.csv')}
  let(:email_creator) {EmailService.new(db)}
  let(:tests_emails) {['wilkerdelfino@id.uff.br', 'not_exists@id.uff.br', '']}


  describe '.generate_email' do
    before do
      @expected_names = ['Wilker de Oliveira Delfino',
                         'Joao da Silva Sauro',
                         'Lord Dath Vader',
                         'Jose de Freitas',
                         'Obi-wan Kenobi']
    end

    context 'given a name' do
      it 'should return five option' do
        @expected_names.each {|name| expect(email_creator.generate_email(name, '@id
.uff.br').length).to eq(5)}
      end
    end
  end

  describe '.email_already_exists?' do
    context 'given an email' do
      it 'should return true if the email exists' do
        expect(email_creator.email_already_exists?(tests_emails[0])).to be_truthy
        expect(email_creator.email_already_exists?(tests_emails[1])).to be_falsey
        expect(email_creator.email_already_exists?(tests_emails[2])).to be_falsey
      end
    end
  end

end
