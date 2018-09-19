class Api::V1::ParticipationSerializer < ActiveModel::Serializer
  attributes :role
  has_one :person, serializer: Api::V1::PersonSerializer
  has_one :movie, serializer: Api::V1::MovieSerializer
end
