#
# Copyright 2019- Yuto Suzuki
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/output"
require "raven"

module Fluent::Plugin
  class SentryOutput < Output
    Fluent::Plugin.register_output("raven", self)

    helpers :inject

    config_param :dsn, :string, default: nil
    config_param :environment, :string, default: nil
    config_param :default_level, :string, :default => 'error'

    def configure(conf)
      super

      Raven.configure do |config|
        config.dsn = dsn
        config.current_environment = environment
      end
    end

    def start
      super
    end

    def write(chunk)
      tag = chunk.metadata.tag
      chunk.each do |time, record|
        Raven.capture_message record['message'],
                              logger: 'fluent-sentry-logger',
                              level: record['level'] || @default_level,
                              tags: {
                                  worker: record['worker'],
                                  tag: tag
                              }
      end
    end
  end
end

