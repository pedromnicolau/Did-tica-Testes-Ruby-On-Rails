module PropertiesHelper
  # Concatena endereço completo do imóvel
  def property_full_address(property)
    return "" unless property
    # Ex.: "Rua A, 123, Araras - SP"
    [ property.address, [ property.city, property.state ].compact.join(" - ") ].compact.join(", ")
  end
end
