class WineSerializer < ActiveModel::Serializer
  attributes :id, :name, :wine_type, :region, :price, :description, :image

  def price
    format = '%.2f' % object.price
    return format
  end

end
