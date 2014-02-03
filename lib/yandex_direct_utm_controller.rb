require 'nyny'
require 'yandex_direct_utm'
require 'tilt'

class YandexDirectRouter < NYNY::App

    YandexDirectUtm::Logger.config(:searchable_routes).each do |route|
        get route do
            params[:page] = route
            YandexDirectUtm::Logger.write_attrs(params) unless params.empty?
            Tilt.new("app/views/#{route.gsub('/','')}.html.erb").render
        end
    end

end
