#require "/yandex_direct_utm/version"
require "yandex_direct_utm_config"
require 'nyny'
require 'csv'

module YandexDirectUtm
    class Logger

        def self.write_attrs(params)
            attrs = build_attributes_hash(params)
            write_txt(attrs)
            write_csv(attrs)
        end

        def self.config(key)
            YandexDirectUtm::Config.config[key]
        end

        private

        def self.symbolize_hash_keys(params)
            new_hash = {}
            params.keys.each do |key|
                new_hash[key.to_sym] = params[key]
            end
            return new_hash
        end


        def self.build_attributes_hash(params)
            attrs={}
            params = symbolize_hash_keys(params)
            config(:searchable_params).each do |key|
                attrs[key] = params[key] unless params[key].nil?
            end
            return attrs
        end

        def self.write_txt(attrs)
            File.open(NYNY.root.pwd.join("public/#{config(:txt_log)}"),'a') do |file|
                time = Time.now.utc?? Time.now : (Time.now + 4*60*60)
                file.puts("#{time.strftime("%d/%m/%Y %H:%M:%S")}")
                attrs.each do |key,val|
                    file.puts("#{key} : #{val}")
                end
                file.puts("--------------------------")
            end
        end

        def self.write_csv(attrs)
            CSV.open(NYNY.root.pwd.join("public/#{config(:csv_log)}"),'a+') do |file|
                time = Time.now.utc?? Time.now : (Time.now + 4*60*60)
                file << ["#{time.strftime("%d/%m/%Y %H:%M:%S")}"]
                attrs.each do |key,val|
                    file << [key,val]
                end
                file << ["",""]
            end
        end


    end
end