# Plutus
require "rails"

module Plutus
  class Engine < Rails::Engine
    isolate_namespace Plutus

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/*.yml"]
    end
  end


  # ------------------------------ tenancy ------------------------------
  # configuration to enable or disable tenancy
  mattr_accessor :enable_tenancy
  enable_tenancy = false

  mattr_accessor :tenant_class
  tenant_class = nil


  # provide hook to configure attributes
  def self.config
    yield(self)
  end
end
