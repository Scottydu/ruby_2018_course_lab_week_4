class Api::V1::PersonSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :movies, serializer: Api::V1::MovieSerializer
end
