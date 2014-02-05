
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

        def self.keys
            config.keys
        end

    end

end
