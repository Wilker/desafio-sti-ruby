require 'aluno'
require 'email_generator'
require 'spec_helper'
require 'bd'

describe EmailService do


  describe '.generate_email' do

    before do
      db              = DataBase.new('/home/wilker/Documentos/Git/desafio-sti-ruby/lib/alunos.csv')
      @expected_names = ['Wilker de Oliveira Delfino',
                         'Joao da Silva Sauro',
                         'Lord Dath Vader',
                         'Jose de Freitas',
                         'Obi-wan Kenobi']
      @email_creator  = EmailService.new(db)
    end

    context 'given a name' do
      it 'should return five option' do
        @expected_names.each{|name| expect(@email_creator.generate_email(name, '@id
.uff.br').length).to eq(5)}
      end
    end
  end


end