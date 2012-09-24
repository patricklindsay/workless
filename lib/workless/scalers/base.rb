require 'delayed_job'

module Delayed
  module Workless
    module Scaler
  
      class Base
        def self.jobs
          Delayed::Job.all(:conditions => { :failed_at => nil })
        end
      end

      module HerokuClient

        def client
          @client ||= ::Heroku::API.new(:api_key => ENV['HEROKU_APIKEY'])
        end

      end

    end
  end
end
