require 'sinatra'
require 'yandex_direct_utm/yandex_direct_utm_logger'
require 'tilt'

module YandexDirectUtm
    class Router < Synatra::Base

        YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
            get route do
                params[:page] = route
                YandexDirectUtm::Logger.write_attrs(params) unless params.empty?
                redirect_to route
            end
        end

    end
end
