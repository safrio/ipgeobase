# Ipgeobase

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipgeobase'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipgeobase

## Usage

Гем содержит метод `lookup('8.8.8.8')`, который принимает IP-адрес и возвращает объект метаданных.

В метаданных содержатся следующие поля:

* `city` - город
* `country` - страна
* `countryCode` - код страны
* `lat` - ширина
* `lon` - долгота

```ruby
ip_meta = Ipgeobase.lookup('8.8.8.8')
ip_meta.city # Ashburn
ip_meta.country # United States
ip_meta.countryCode # US
ip.lat # 39.03
ip.lon # -77.5
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/safrio/ipgeobase.
