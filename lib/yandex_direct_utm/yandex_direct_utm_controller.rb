require "sinatra/base"
require "sinatra/namespace"
require 'yandex_direct_utm/yandex_direct_utm_logger'

module YandexDirectUtm
    class Router < Sinatra::Base

        YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
            get '/service/#{route}' do
                params[:page] = route
                YandexDirectUtm::Logger.write_attrs(params) unless params.empty?
                redirect to(route)
            end
        end
    end
end
