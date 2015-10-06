# EasyOptimise

A wrapper built on the <a href="https://github.com/thoughtbot/paperclip" target="_blank">Paperclip</a> attachment gem. EasyOptimise adds the abililty to optimise image sizes for web using sane defaults for compression and quality. The image optimisation is applied using ImageMagick utility functions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_optimise'
```

And then execute:

    $ bundle

Or install it yourself using Rubygems:

    $ gem install easy_optimise

## Usage

In paperclip you might:

```ruby
has_attached_file :avatar, 
  styles: { medium: "300x300>",
            thumb:  "100x100>" },
  default_url: "/images/:style/missing.png"
```

With EasyOptimise, to optimise the images you serve up, just extend the gem in your model:

```ruby
extend EasyOptimise
```

and then slip in one sneaky word in your attachment method:

```ruby
has_attached_optimised_file :avatar,
  styles: { medium: "300x300>",
            thumb:  "100x100>" },
  default_url: "/images/:style/missing.png"
```

If you want to keep a particular style unoptimised for precise quality (or because you like big slow websites and that's just how you roll), then:


```ruby
has_attached_optimised_file :avatar,
  styles: { medium: "300x300>",
            thumb:  "100x100>" },
  unoptimised_styles: { banner: "1200x800#" },
  default_url: "/images/:style/missing.png"
```

## Contributing

1. Fork it ( https://github.com/PhilipCastiglione/easy_optimise/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Party party, w00 w00

                               .--------.
                             .: : :  :___`.
                           .'!!:::::  \\_\ `.
                      : . /%O!!::::::::\\_\. \
                     [""]/%%O!!:::::::::  : . \
                     |  |%%OO!!::::::::::: : . |
                     |  |%%OO!!:::::::::::::  :|
                     |  |%%OO!!!::::::::::::: :|
            :       .'--`.%%OO!!!:::::::::::: :|
          : .:     /`.__.'\%%OO!!!::::::::::::/
         :    .   /        \%OO!!!!::::::::::/
        ,-'``'-. ;          ;%%OO!!!!!!:::::'
        |`-..-'| |   ,--.   |`%%%OO!!!!!!:'
        | .   :| |_.','`.`._|  `%%%OO!%%'
        | . :  | |--'    `--|    `%%%%'
        |`-..-'| ||   | | | |     /__\`-.
        \::::::/ ||)|/|)|)|\|           /
---------`::::'--|._ ~**~ _.|----------( -----------------------
           )(    |  `-..-'  |           \    ______
           )(    |          |,--.       ____/ /  /\\ ,-._.-'
        ,-')('-. |          |\`;/   .-()___  :  |`.!,-'`'/`-._
       (  '  `  )`-._    _.-'|;,|    `-,    \_\__\`,-'>-.,-._
        `-....-'     ````    `--'      `-._       (`- `-._`-.   hjw
