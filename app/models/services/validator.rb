# Verifies if passed service url exists on the database
# service url has to be an EXACT match of what was registered on the DB
module Services
  class Validator
    def registered?(service_url)
      Service.joins(:service_urls)
             .merge(ServiceUrl.by_url(service_url))
             .any?
    end
  end
end
