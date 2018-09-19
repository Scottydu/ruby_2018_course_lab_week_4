class Api::V1::MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :year
  # has_many :participations, serializer: Api::V1::ParticipationSerializer
  has_many :people, serializer: Api::V1::PersonSerializer
end
