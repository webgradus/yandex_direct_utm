require "sinatra/base"
require "sinatra/namespace"
require 'yandex_direct_utm/yandex_direct_utm_logger'

module YandexDirectUtm
    class Router < Sinatra::Base

        register Sinatra::Namespace

        namespace '/api' do
            YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
                get route do
                    params[:page] = route
                    YandexDirectUtm::Logger.write_attrs(params) unless params.empty?
                    redirect to(route)
                end
            end
        end

    end
end
