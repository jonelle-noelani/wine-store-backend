class WineSerializer < ActiveModel::Serializer
  attributes :id, :formatPrice

  def formatPrice
    # object.price.format_price

    # object.wines.map do |wine|
    #   {price: wine.price.format_price}

    # format = '%.2f' % object.price

    format = object.price.format_price
    console.log(format)
    return format
  end

end
