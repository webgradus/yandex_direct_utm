yandex_direct_utm
=================

Track "utm" params from Yandex.Direct companies

# Usage

Add this line to application.rb:

    config.middleware.use "YandexDirectUtm::Controller"

Setup routes to be tracked (this code should run only once) or add new params for tracking:

    YandexDirectUtm::Config.searchable_routes = ['/uslugi', '/super_promo']
    # extend default params set
    YandexDirectUtm::Config.config[:searchable_params] << :order_total

For example, you could add this line to Rails Engine class:

    class Engine < Rails::Engine
      ...
      YandexDirectUtm::Config.searchable_routes = ['/uslugi', '/super_promo']
    end
