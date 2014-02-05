require "sinatra"
require 'yandex_direct_utm/yandex_direct_utm_logger'

module YandexDirectUtm
    class Router < Sinatra::Base

        YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
            get route do
                params[:page] = route
                YandexDirectUtm::Logger.write_attrs(params) unless request.env["sinatra.error"].nil?
                pass
            end
        end
    end
end
