require "leadsf/version"
require "force"

module Leadsf
	def self.set(username, password, security_token, client_id, client_secret)
		Leadsf.new(username, password, security_token, client_id, client_secret)
	end

	class Lead
		attr_accessor :Id, :Name, :FirstName, :LastName, :Email, :Company, :Title, :Phone, :Website
		def initialize(id = nil, name = nil, first_name = nil, last_name = nil, email = nil, company = nil, title = nil, phone = nil, website = nil)
			@Id = id
			@Name = name
			@FirstName = first_name
			@LastName = last_name
			@Email = email
			@Company = company
			@Title = title
			@Phone = phone
			@Website = website
		end
	end

	class Leadsf
		def initialize(username, password, security_token, client_id, client_secret)
			@username = username
			@password = password
			@security_token = security_token
			@client_id = client_id
			@client_secret = client_secret
		end

		def client
			@client = Force.new username:  @username,
								password:  @password,
								security_token: @security_token,
								client_id: 	   @client_id, 
								client_secret: @client_secret
		end

		def list
			client.query("select Id, Name, LastName, Email, Company, Title, Phone, Website from Lead")
		end

		def find(id)
			lead = client.find('Lead', id)
			Lead.new(lead.Id, lead.Name, lead.FirstName, lead.LastName, lead.Email, lead.Company, lead.Title, lead.Phone, lead.Website)
		end

		def new
			Lead.new
		end

		def save(lead)
			if lead.Id.nil?  
				client.create!('Lead', FirstName: lead.FirstName, 
	       							LastName: lead.LastName, 
	       							Email: lead.Email, 
	       							Company: lead.Company, 
	       							Title: lead.Title, 
	       							Phone: lead.Phone, 
	       							Website: lead.Website)
			else
				client.update!('Lead', Id: lead.Id,
									FirstName: lead.FirstName, 
	       							LastName: lead.LastName, 
	       							Email: lead.Email, 
	       							Company: lead.Company, 
	       							Title: lead.Title, 
	       							Phone: lead.Phone, 
	       							Website: lead.Website)
			end
		end

		def destroy(leadId)
			client.destroy('Lead', leadId)
		end
	end


end
