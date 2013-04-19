require "sidekiq_pipeline/version"

module SidekiqPipeline

  # For kicking off a pipeline
  def self.execute(params)
    first_job = params[:pipeline].first

    klass = Object.const_get(first_job[:class])

    klass.perform_async(params)
  end

  def perform(params)
    # params = {
    #   pipeline: [{
    #       class: "Worker1",
    #       params: {...}
    #     },{
    #       class: "Worker2",
    #       params: {...}
    #     },...
    #   ]
    # }

    job = params["pipeline"].shift
    klass = Object.const_get(job["class"])

    klass.new.pipeline_perform(job["params"])

    if !params["pipeline"].empty?
      klass = Object.const_get(params["pipeline"].first["class"])
      klass.perform_async(params)
    end
  end

end
