module ParallelWorkforce
  class Configuration
    attr_accessor(
      :job_class,
      :logger,
      :revision_builder,
      :serial_mode_checker,
      :serializer,
      :redis_connector,
      :job_timeout,
      :job_key_expiration,
    )

    def initialize
      @job_class = defined?(ActiveJob) && ParallelWorkforce::Job::ActiveJob
      @logger = defined?(Rails) && Rails.logger
      @revision_builder = ParallelWorkforce::RevisionBuilder::FilesHash.new
      @serial_mode_checker = nil
      @serializer = ParallelWorkforce::Serializer::Marshal.new
      @redis_connector = ParallelWorkforce::RedisConnector::RedisPool.new
      @job_timeout = 10
      @job_key_expiration = 20
    end
  end
end