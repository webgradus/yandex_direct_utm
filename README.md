yandex_direct_utm
=================

Track "utm" params from Yandex.Direct companies

# Usage

Add this line to application.rb:

    config.middleware.use "YandexDirectUtm::Controller"

Setup routes to be tracked (this code should run only once):

    YandexDirectUtm::Config.searchable_routes = ['/uslugi', '/super_promo']

For example, you could add this line to Rails Engine class:

    class Engine < Rails::Engine
      ...
      YandexDirectUtm::Config.searchable_routes = ['/uslugi', '/super_promo']
    end
