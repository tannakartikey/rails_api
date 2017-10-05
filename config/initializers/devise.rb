Rails.application.config.to_prepare do              # to_prepare ensures that the monkey patching happens before the first request
  Devise::OmniauthCallbacksController.class_eval do # reopen the class
    def failure                                     # redefine the failure method
      set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
      redirect_to after_omniauth_failure_path_for(resource_name)
    end
  end
end
Devise.setup do |config|
  config.navigational_formats = [:json]
end
