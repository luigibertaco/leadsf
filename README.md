# Leadsf

_A ruby gem for work with the [b]Salesforce Leads[/b] using [Salesforce REST api](http://www.salesforce.com/us/developer/docs/api_rest/index.htm)._

## Installation

Add this line to your application's Gemfile:

    gem 'leadsf'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install leadsf

## Usage

Leadsf is designed to work with a basic structure of Salesforce Leads using [Force](https://github.com/heroku/force.rb) 
 
### Initialization

```ruby
leadsf = Leadsf.set(username, password, security_token, client_id, client_secret)
```

### List

```ruby
leads = leadsf.list
```

### Find

```ruby
lead = leadsf.find('00Qo00002BhCGEA0')
````

### New

```ruby
lead = leadsf.new
```

### Save (create/update)

```ruby
lead.FirstName = 'Name'
lead.LastName = 'Last'
lead.Email = 'email@domain.com'
lead.Company = 'Company'
lead.Title = 'President'
lead.Phone = '88 9999 8888'
lead.Website = 'www.domain.com'

leadsf.save(lead)
```

### Destroy

```ruby
leadsf.destroy(lead)
```

## Contributing

1. Fork it ( https://github.com/luigibertaco/leadsf/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
