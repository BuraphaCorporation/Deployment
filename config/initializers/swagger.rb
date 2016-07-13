
GrapeSwaggerRails.options.url = "/api/mobile"
if Rails.env.production?
  GrapeSwaggerRails.options.app_url = "https://api.daydash.co"
else
  GrapeSwaggerRails.options.app_url = "http://localhost:3000"
end
