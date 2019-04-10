class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :lat, :long
end
