require 'open-uri'
require 'fileutils'

namespace :imagedownloader do
  desc "Added image downloader task"
  task bulk_downloads: :environment do
    output_folder = "#{File.expand_path('../..')}"
    FileUtils.mkdir_p(output_folder)

    urls = File.readlines(file_path).map(&:chomp)

    puts "empty file" if urls.empty?

    urls.first.split(' ').each_with_index do |url, index|
      begin
        filename = "#{output_folder}/image_#{index}.jpg"

        URI.open(url) do |image|
          File.open(filename, 'wb') do |file|
            file.write(image.read)
          end
        end

        puts "Downloaded image #{index + 1}/#{urls.length}"
      rescue => e
        puts "Error downloading image #{index + 1}: #{e.message}"
      end
    end

    puts "Download completed!"
  end

end
