# Rails Gem List

Best practices for running Rails.

## User
[Devise](https://github.com/plataformatec/devise/) is a flexible authentication solution for Rails based on Warden. It:

* Is Rack based;
* Is a complete MVC solution based on Rails engines;
* Allows you to have multiple models signed in at the same time;
* Is based on a modularity concept: use only what you really need.

## Testing
* [Capybara](https://github.com/jnicklas/capybara) #Capybara helps you test web applications by simulating how a real user would interact with your app. 

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

## Audits

Use an auditing library like [Audited](https://github.com/collectiveidea/audited).

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

## Logging

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

### Data Stores - Database, Elasticsearch, Redis

- requests by type - total time, count
- errors
- CPU usage
- space

### External Services

- requests by type - total time, count
- errors

## Web Server

Use a high performance web server like [Unicorn](http://unicorn.bogomips.org/).

```ruby
gem 'unicorn'
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

## TODO

- Redis timeout
- Elasticsearch timeout
- Background jobs
- Gemify parts

## Thanks

- [cant_wait gem](https://github.com/CarlosCD/cant_wait) for database timeouts
