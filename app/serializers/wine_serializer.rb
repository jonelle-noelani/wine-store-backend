class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :wine_type, :region, :price, :description, :image

  def price
    # object.price.format_price

    # object.wines.map do |wine|
    #   {price: wine.price.format_price}

    format = '%.2f' % object.price

    # format = object.price.format_price
    # console.log(format)
    return format
  end

end
