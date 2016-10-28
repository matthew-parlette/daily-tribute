class Source < ActiveYaml::Base
  set_root_path Rails.root.join('config')
end