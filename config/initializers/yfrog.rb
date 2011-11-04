YFROG_API_KEY = ENV['YFROG_API_KEY'] || YAML.load_file(File.join(Rails.root, "config", "yfrog.yml"))["api_key"]
