# SidekiqPipeline

Allows you to define pipelines in Sidekiq, an ordered chain of jobs.

```ruby
class WorkerOne
  include Sidekiq::Worker
  include SidekiqPipeline

  def pipeline_perform(params)
    puts params["key"]
  end
end

class WorkerTwo
  include Sidekiq::Worker
  include SidekiqPipeline

  def pipeline_perform(params)
    puts params["data"]
  end
end

tasks = {
  pipeline: [{
    class: "WorkerOne",
    params: {key: 'foo'}
  },{
    class: "WorkerTwo",
    params: {data: 'bar'}
  }]
}

SidekiqPipeline.execute(tasks)
# WorkerOne will output: 'foo'
# WorkerTwo will output: 'bar'
```

Tasks will be run in the order they are defined. If a task fails, it will retry on the step it failed on, and it will continue down the pipeline if/when it retires successfully.

## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq_pipeline'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq_pipeline

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
