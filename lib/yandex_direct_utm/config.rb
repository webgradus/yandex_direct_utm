module YandexDirectUtm
    class Config

        @config={
            searchable_params: [:utm_source,:utm_medium,:utm_campaign,:utm_content,:utm_type,:utm_source,:utm_added,:utm_block,:utm_position,:utm_keyword,:page],
            searchable_routes: ['promo','contacts'],
            txt_log: 'TXTLOG.txt',
            csv_log: 'CSVLOG.csv'
        }

        def self.config
            @config
        end

        def self.searchable_routes=(searchable_routes)
          searchable_routes.each do |searchable_route|
            YandexDirectUtm::Controller.class_eval do
              get searchable_route do
                params[:page] = searchable_route
                params[:root] = settings.root
                # You can use this later, for example to track users that made order
                params.each do |key, value|
                  session[key] = value
                end
                if request.env["sinatra.error"].nil? && params.keys.grep(/^utm/).present?
                  YandexDirectUtm::Logger.write_attrs(params)
                end
                pass
              end
            end
          end
        end

        def self.keys
            config.keys
        end

    end

end
