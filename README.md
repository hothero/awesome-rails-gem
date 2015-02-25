# For Development

## User
[Devise](https://github.com/plataformatec/devise/) is a flexible authentication solution for Rails based on Warden. It:

* Is Rack based;
* Is a complete MVC solution based on Rails engines;
* Allows you to have multiple models signed in at the same time;
* Is based on a modularity concept: use only what you really need.

## Authorization
[Pundit](https://github.com/elabs/pundit) provides a set of helpers which guide you in leveraging regular Ruby classes and object oriented design patterns to build a simple, robust and scaleable authorization system.

## Template
[slim-rails](https://github.com/slim-template/slim-rails) is a template language whose goal is to reduce the view syntax to the essential parts without becoming cryptic.

## Search
[ransack](https://github.com/activerecord-hackery/ransack) enables the creation of both simple and advanced search forms for your Ruby on Rails application

[elasticsearch-rails](https://github.com/elasticsearch/elasticsearch-rails). Elasticsearch integrations for ActiveModel/Record and Ruby on Rails.

[Chewy](https://github.com/toptal/chewy). High-level Elasticsearch Ruby framework based on the official elasticsearch-ruby client.

[Chewy_Kiqqer](https://github.com/averell23/chewy_kiqqer). This is an alternative udpate/callback mechanism for Chewy. It queues the updates as Sidekiq jobs.

## Tagging
[ActsAsTaggableOn](https://github.com/mbleigh/acts-as-taggable-on). A tagging plugin for Rails applications that allows for custom tagging along dynamic contexts.

## Sequential ID
[Sequenced](https://github.com/djreimer/sequenced) is a simple gem that generates scoped sequential IDs for ActiveRecord models.

## Enum
[Enumerize](https://github.com/brainspec/enumerize) Enumerated attributes with I18n and ActiveRecord/Mongoid support. It can be integrated with Simple Form.

## Counter Cache
[counter_culture](https://github.com/magnusvk/counter_culture) Turbo-charged counter caches for your Rails app. Huge improvements over the Rails standard counter caches.

## Response
[Responders](https://github.com/plataformatec/responders). A set of Rails responders to dry up your application.

## Testing
[rspec-rails](https://github.com/rspec/rspec-rails) is a testing framework for Rails 3.x and 4.x.

[Capybara](https://github.com/jnicklas/capybara) helps you test web applications by simulating how a real user would interact with your app. 

[factory_girl](https://github.com/thoughtbot/factory_girl) is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.

[factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails) provides Rails integration for factory_girl.

[Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) is a set of strategies for cleaning your database in Ruby.Support ActiveRecord, DataMapper, Sequel, MongoMapper, Mongoid, CouchPotato, Ohm and Redis.

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers) provides serveral matchers for testing common Rails functionality.

[ResponseCodeMatchers](https://github.com/r7kamura/response_code_matchers) provides rspec matchers to match http response code.

[SimpleCov](https://github.com/colszowka/simplecov) is a code coverage analysis tool for Ruby

## Coding Style
[RuboCop](https://github.com/bbatsov/rubocop) is a Ruby static code analyzer. Out of the box it will enforce many of the guidelines outlined in the community [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).

[Rails Best Practice](https://github.com/railsbp/rails_best_practices) is a code metric tool to check the quality of rails codes.

## Debug
[Better Errors](https://github.com/charliesome/better_errors) replaces the standard Rails error page with a much better and more useful error page.

If you would like to use Better Errors' advanced features (REPL, local/instance variable inspection, pretty stack frame names), you need to add the [binding_ _of__caller](https://github.com/banister/binding_of_caller).

[RailsPanel](https://github.com/dejan/rails_panel) is a Chrome extension for Rails development that will end your tailing of development.log. 

## Currency Exchange Rate
Gems for dealing with money, currency conversion and realtime exchange rate.

```ruby
gem "google_currency"
gem "money"
```

```ruby
require 'money'
require 'money/bank/google_currency'

Money.default_bank = Money::Bank::GoogleCurrency.new
money = Money.new(1_00, "USD")
exchange_rate = money.exchange_to(:twd).to_d
```

## Excel
The [Spreadsheet](https://github.com/zdavatz/spreadsheet) Library is designed to read and write Spreadsheet Documents.

## Chart
[Chartkick](https://github.com/ankane/chartkick) help your to create beautiful Javascript charts with one line of Ruby.

## Integration with other services
[Slack Notifier](https://github.com/stevenosloan/slack-notifier) is a simple wrapper to send notifications to [Slack](https://slack.com/) webhooks.

## Environment Variables
[Figaro](https://github.com/laserlemon/figaro) is very simple, Heroku-friendly Rails app configuration using ENV and a single YAML file.

[dotenv](https://github.com/bkeepers/dotenv) is a gem that allows you to set your environment variables in .env file, and it will load it in to ENV.

[opsworks-dotenv](https://github.com/mikamai/opsworks-dotenv) let you configure the environment for you Rails application using OpsWorks, Chef and Dotenv

## Routing
[FriendlyId](https://github.com/norman/friendly_id) is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord. It allows you to create pretty URL’s and work with human-friendly strings as if they were numeric ids for ActiveRecord models.

## Pagination
A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3 and 4
[https://github.com/amatsuda/kaminari/wiki](https://github.com/amatsuda/kaminari/wiki)

## API
[ActiveModel::Serializers](https://github.com/rails-api/active_model_serializers) brings convention over configuration to your JSON generation. Here's a simple example:

```ruby
class PostSerializer < ActiveModel::Serializer
  cache key: 'posts', expires_in: 3.hours
  attributes :title, :body

  has_many :comments

  url :post
end

class CommentSerializer < ActiveModel::Serializer
  attributes :name, :body

  belongs_to :post

  url [:post, :comment]
end
```

[Jbuilder](https://github.com/rails/jbuilder) gives you a simple DSL for declaring JSON structures that beats massaging giant hash structures. This is particularly helpful when the generation process is fraught with conditionals and loops. Here's a simple example:

```ruby
# app/views/message/show.json.jbuilder

json.content format_content(@message.content)
json.(@message, :created_at, :updated_at)

json.author do
  json.name @message.creator.name.familiar
  json.email_address @message.creator.email_address_with_name
  json.url url_for(@message.creator, format: :json)
end

if current_user.admin?
  json.visitors calculate_visitors(@message)
end

json.comments @message.comments, :content, :created_at

json.attachments @message.attachments do |attachment|
  json.filename attachment.filename
  json.url url_for(attachment)
end
```

## Editor
[CKEditor](https://github.com/galetahub/ckeditor) is a WYSIWYG text editor designed to simplify web content creation. It brings common word processing features directly to your web pages. Enhance your website experience with our community maintained editor. [ckeditor.com](http://ckeditor.com)

## Uploader
[Carrierwave](https://github.com/carrierwaveuploader/carrierwave) is a classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks.

[MiniMagick](https://github.com/minimagick/minimagick) is a ruby wrapper for ImageMagick or GraphicsMagick command line.

[fog](https://github.com/fog/fog) is the Ruby cloud services library, top to bottom:

* Collections provide a simplified interface, making clouds easier to work with and switch between.
* Requests allow power users to get the most out of the features of each individual cloud.
* Mocks make testing and integrating a breeze.

## Record State Flow
[AASM](https://github.com/aasm/aasm) - State machines for Ruby classes (plain Ruby, Rails Active Record, Mongoid)

## Record Validation
[Validates](https://github.com/kaize/validates) provides collection of useful custom validators for Rails applications, including:

* EmailValidator
* UrlValidator
* SlugValidator
* MoneyValidator
* IpValidator
* AssociationLengthValidator
* AbsolutePathValidator
* UriComponentValidator
* ColorValidator
* EanValidator (EAN-8 & EAN-13)

## View Helper
[Simple Form](https://github.com/plataformatec/simple_form) aims to be as flexible as possible while helping you with powerful components to create your forms. The basic goal of Simple Form is to not touch your way of defining the layout, letting you find the better design for your eyes.

[Nested Form](https://github.com/ryanb/nested_form) This is a Rails gem for conveniently manage multiple nested models in a single form. It does so in an unobtrusive way through jQuery or Prototype. It can also be integrated with Simple Form.

[meta-tags](https://github.com/kpumuk/meta-tags) Search Engine Optimization (SEO) plugin for Ruby on Rails applications.

[active_link_to](https://github.com/comfy/active_link_to) add css 'active' class to your links.

## HTML processing
[HTML::Pipeline](https://github.com/jch/html-pipeline). GitHub HTML processing filters and utilities. This module includes a small framework for defining DOM based content filters and applying them to user provided content.

## Real-time
[Sync](https://github.com/chrismccord/sync). Real-time partials with Rails. 

## OAuth 
[omniauth-facebook](https://github.com/mkdynamic/omniauth-facebook)

[omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2)

[omniauth-weibo-oauth2](https://github.com/beenhero/omniauth-weibo-oauth2)

[omniauth-twitter](https://github.com/arunagw/omniauth-twitter)

## Backend
The administration framework for Ruby on Rails applications. 
[http://activeadmin.info](http://activeadmin.info)

[active_skin](https://github.com/rstgroup/active_skin): Flat skin for active admin.

# For Production
## Errors

Use an error reporting service like [Rollbar](https://rollbar.com/).

Also, track 400 and 500 status codes.

```ruby
ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  if !payload[:status] or payload[:status].to_i >= 400
    # track it
  end
end
```

## Timeouts

Use [Slowpoke](https://github.com/ankane/slowpoke) for request and database timeouts.

```ruby
gem 'slowpoke'
```

## Throttling

Use [Rack Attack](https://github.com/kickstarter/rack-attack) to throttle and block requests.

## Slow Requests

Keep track of slow requests

```ruby
ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  duration = finish - start
  if duration > 5.seconds
    # track here
  end
end
```

## Unpermitted Parameters

```ruby
ActiveSupport::Notifications.subscribe "unpermitted_parameters.action_controller" do |name, start, finish, id, payload|
  # track here
end
```

## Audits & Version

[PaperTrail](https://github.com/airblade/paper_trail) lets you track changes to your models' data. It's good for auditing or versioning.

Soft delete: [paranoia](https://github.com/radar/paranoia)

## Failed Validations

```ruby
module TrackErrors
  extend ActiveSupport::Concern

  included do
    after_validation :track_errors
  end

  def track_errors
    if errors.any?
      # track here
    end
  end
end

ActiveRecord::Base.send(:include, TrackErrors)
```

## Failed CSRF

```ruby
class ApplicationController < ActionController::Base
  def handle_unverified_request_with_tracking(*args)
    # track here

    handle_unverified_request_without_tracking(*args)
  end
  alias_method_chain :handle_unverified_request, :tracking
end
```

## Request/Visit Tracking
[Ahoy](https://github.com/ankane/ahoy) provides a solid foundation to track visits and events in Ruby, JavaScript, and native apps.

## Logging
[Impressionist](https://github.com/charlotte-ruby/impressionist) can log page impressions (technically action impressions), but it is not limited to that. You can log impressions multiple times per request. And you can also attach it to a model. The goal of this project is to provide customizable stats that are immediately accessible in your application as opposed to using Google Analytics and pulling data using their API. 


Use [Lograge](https://github.com/roidrage/lograge).

```ruby
gem 'lograge'
```

Add the following to `config/environments/production.rb`.

```ruby
config.lograge.enabled = true
config.lograge.custom_options = lambda do |event|
  options = event.payload.slice(:request_id, :user_id, :visit_id)
  options[:params] = event.payload[:params].except("controller", "action")
  # if you use Searchkick
  if event.payload[:searchkick_runtime].to_f > 0
    options[:search] = event.payload[:searchkick_runtime]
  end
  options
end
```

Add the following to `app/controllers/application_controller.rb`.

```ruby
def append_info_to_payload(payload)
  super
  payload[:request_id] = request.uuid
  payload[:user_id] = current_user.id if current_user
  payload[:visit_id] = ahoy.visit_id # if you use Ahoy
end
```
It attempt to bring sanity to Rails' noisy and unusable, unparsable and, in the context of running multiple processes and servers, unreadable default logging output

Instead of having an unparsable amount of logging output like this:

```
Started GET "/" for 127.0.0.1 at 2012-03-10 14:28:14 +0100
Processing by HomeController#index as HTML
  Rendered text template within layouts/application (0.0ms)
  Rendered layouts/_assets.html.erb (2.0ms)
  Rendered layouts/_top.html.erb (2.6ms)
  Rendered layouts/_about.html.erb (0.3ms)
  Rendered layouts/_google_analytics.html.erb (0.4ms)
Completed 200 OK in 79ms (Views: 78.8ms | ActiveRecord: 0.0ms)
```
you get a single line with all the important information, like this:
```
method=GET path=/jobs/833552.json format=json controller=jobs action=show status=200 duration=58.33 view=40.43 db=15.26
```

## Uptime Monitoring

Use an uptime monitoring service like [Pingdom](https://www.pingdom.com/) or [Uptime Robot](https://uptimerobot.com/).

Monitor web servers, background jobs, and scheduled tasks.

## Performance Monitoring

Use a performance monitoring service like [New Relic](http://newrelic.com/), [AppSignal](https://appsignal.com/) or [Skylight](https://www.skylight.io).

Be sure to monitor:

### Web Requests

- requests by action - total time, count
- errors - with affected users
- queue time - `X-Request-Start` header
- timeouts
- 404s
- invalid authenticity token
- unpermitted parameters
- invalid form submissions

### Background Jobs and Rake Tasks

- jobs by type - total time, count
- errors

## Data Stores - Database, Elasticsearch, Redis
- requests by type - total time, count
- errors
- CPU usage
- space

### Redis
[redis-rb](https://github.com/redis/redis-rb) is a Ruby client that tries to match Redis' API one-to-one, while still providing an idiomatic interface. It features thread-safety, client-side sharding, pipelining, and an obsession for performance.

[redis-objects](https://github.com/nateware/redis-objects) provides a Rubyish interface to Redis, by mapping Redis data types to Ruby objects, via a thin layer over the redis gem. 


### External Services

- requests by type - total time, count
- errors

## Web Server

Use a high performance web server like [Unicorn](http://unicorn.bogomips.org/).

```ruby
gem 'unicorn'
```

One thing we thought Unicorn missed, is killing the Unicorn workers based on the number of requests and consumed memories.

[unicorn-worker-killer](https://github.com/kzk/unicorn-worker-killer) gem provides automatic restart of Unicorn workers based on 1) max number of requests, and 2) process memory size (RSS), without affecting any requests.

Add these lines to your `config.ru`.

```ruby
# Unicorn self-process killer
require 'unicorn/worker_killer'

# Max requests per worker
use Unicorn::WorkerKiller::MaxRequests, 3072, 4096

# Max memory size (RSS) per worker
use Unicorn::WorkerKiller::Oom, (192*(1024**2)), (256*(1024**2))
```

## Security

Use SSL to protect your users. Add the following to `config/environments/production.rb`.

```ruby
config.force_ssl = true
```

## Development Bonus

[Fix double logging](https://github.com/rails/rails/issues/11415#issuecomment-57648388) in the Rails console. Create `config/initializers/log_once.rb` with:

```ruby
ActiveSupport::Logger.class_eval do
  def self.broadcast(logger)
    Module.new do
    end
  end
end
```

## Scheduled Jobs

[Whenever](https://github.com/javan/whenever) is a Ruby gem that provides a clear syntax for writing and deploying cron jobs. Example:
```ruby
every 3.hours do
  runner "MyModel.some_process"
  rake "my:rake:task"
  command "/usr/bin/my_great_command"
end
```

[Sidekiq](https://github.com/mperham/sidekiq). Simple, efficient background processing for Ruby.

[Sucker Punch](https://github.com/brandonhilkert/sucker_punch) is a single-process Ruby asynchronous processing library.

## TODO

- Redis timeout
- Elasticsearch timeout
- Background jobs
- Gemify parts

## Thanks

- [cant_wait gem](https://github.com/CarlosCD/cant_wait) for database timeouts
