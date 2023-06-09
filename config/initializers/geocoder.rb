Geocoder.configure(
  lookup:    :google,
  api_key:   ENV['GOOGLE_API_SERVER_KEY'],
  use_https: true,
  # Geocoding options
  timeout: 3,                 # geocoding service timeout (secs)
  ip_lookup: :ipinfo_io,      # name of IP address geocoding service (symbol)
  language: :en,              # ISO-639 language code
  http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)
  cache: nil,                 # cache object (must respond to #[], #[]=, and #del)

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  units: :km,                 # :km for kilometers or :mi for miles
  distances: :linear          # :spherical or :linear

  # Cache configuration
  # cache_options: {
  #   expiration: 2.days,
  #   prefix: 'geocoder:'
  # }
)
