module Types
  class CardType < Types::BaseObject
    field :title, String, null: true
    field :topic, String, null: true
    field :explanation, String, null: true
    field :example, String, null: true
    field :notes, String, null: true
  end
end