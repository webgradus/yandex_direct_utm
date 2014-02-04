require 'nyny'
require 'yandex_direct_utm/yandex_direct_utm_logger'
require 'tilt'

module YandexDirectUtm
    class Router < NYNY::App

        YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
            get route do
                params[:page] = route
                YandexDirectUtm::Logger.write_attrs(params) unless params.empty?
                Tilt.new("app/views/yandex_direct/#{route.gsub('/','')}.html.erb").render
            end
        end

    end
end
