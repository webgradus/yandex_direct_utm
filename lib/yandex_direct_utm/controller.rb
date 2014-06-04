require "sinatra"
require 'yandex_direct_utm/logger'

module YandexDirectUtm
    class Controller < Sinatra::Base
      YandexDirectUtm::Config.searchable_routes = YandexDirectUtm::Logger.config(:searchable_routes)
    end
end
