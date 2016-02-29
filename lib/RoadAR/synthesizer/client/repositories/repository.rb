module RoadAR
  module Synthesizer
    module Client
      module Repositories
        class Repository
          include Singleton

          class << self
            [:all, :create, :find].each do |method|
              define_method(method) do |*args|
                instance.send(method, *args)
              end
            end

            def entity(klass = nil)
              if klass.nil?
                @entity
              else
                @entity = klass
              end
            end

            def url(path = nil)
              if path.nil?
                @url
              else
                @url = path
              end
            end
          end

          def all
            get("#{base_url}/#{self.class.url}.json").map do |job_json|
              wrap(job_json)
            end
          end

          def create(params)
            wrap(post(base_url + "/#{self.class.url}.json", params))
          end

          def find(id)
            wrap(get("#{base_url}/#{self.class.url}/#{id}.json"))
          end

          protected

          def wrap(entity)
            self.class.entity.new(entity)
          end

          def base_url
            @base_url ||= RoadAR::Synthesizer::Config.instance.url
          end

          def token
            @token ||= RoadAR::Synthesizer::Config.instance.token
          end

          def get(url)
            res = HTTParty.get(url, query: { token: token })
            unless res.success?
              raise RoadAR::Synthesizer::Client::Exceptions::RemoteError.new(res.parsed_response)
            end
            res
          end

          def post(url, **params)
            res = HTTParty.post(url, body: { job: params }, query: { token: token })
            unless res.success?
              raise RoadAR::Synthesizer::Client::Exceptions::RemoteError.new(res.parsed_response)
            end
            res
          end
        end
      end
    end
  end
end
