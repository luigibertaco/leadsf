require 'spec_helper'
require 'leadsf'

describe Leadsf do

	let(:username) {'a7728915@drdrb.net'}
	let(:password) {'testetestador1'}
	let(:security_token) {'Ti56HuR0BEe1Nck6II7NebiV'}
	let(:client_id) {'3MVG9xOCXq4ID1uGe3y3cFrq63iHCvXWF3m1VmROGPeDprblMxGnejW.dwFgL0ZotH3oFObryFZpoFYcWqBh5'}
	let(:client_secret) {'2032976787652084118'}

	let(:lead) {Leadsf.set(username, password, security_token, client_id, client_secret)}

  	describe '#set' do
  		it "return lead" do
  			expect(lead).not_to be_nil
  		end
  	end 

  	describe '#client' do
  		it "return client" do 
  			expect(lead.client).not_to be_nil
  		end
  	end 

  	describe '#list' do
  		it "return list" do
  			expect(lead.list).not_to be_nil
  		end
  	end

  	describe '#find' do
  		it "busca Bertha" do
  			find_id = lead.list.first.Id
  			l = lead.find(find_id)
  			expect(l.Id).to eq find_id
  		end
  	end

  	describe '#new' do
  		it 'new Lead' do
  			expect(lead.new.class).to eq Leadsf::Lead
  		end
  	end

  	describe '#create' do
  		it 'create Lead' do
  			l = lead.new
  			l.FirstName = 'Teste'
  			l.LastName = 'do create'
  			l.Email = 'teste@teste.com'
  			l.Company = 'Empresa teste'
  			l.Title = 'Diretor teste'
  			l.Phone = '88 9999 8888'
  			l.Website = 'www.teste.com'
  			expect(lead.save(l)).not_to be_nil
  		end
  	end

	describe '#destroy' do
  		it 'destroy lead' do
  			find_id = lead.list.first.Id
  			l = lead.find(find_id)
  			expect(lead.destroy(l.Id)).to be_truthy
  		end
  	end

  	describe '#update' do
  		it 'update lead' do
  			find_id = lead.list.first.Id
  			l = lead.find(find_id)
  			l.LastName << ' UP'
  			expect(lead.save(l)).to be_truthy
  		end
  	end
end