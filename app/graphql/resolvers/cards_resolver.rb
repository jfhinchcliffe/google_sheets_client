module Resolvers
  class CardsResolver < GraphQL::Schema::Resolver
    type [Types::CardType], null: false

    argument :topic_name, String, required: false

    def resolve(topic_name: nil)
      return SpreadsheetBacked::Card.all unless topic_name.present?

      SpreadsheetBacked::Card.find_by(:topic, topic_name)
    end

    private

    def all_cards
      @all_cards ||= SpreadsheetBacked::Card.all
    end
  end
end