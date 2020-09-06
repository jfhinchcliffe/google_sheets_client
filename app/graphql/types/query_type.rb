module Types
  class QueryType < Types::BaseObject
    field :cards, resolver: Resolvers::CardsResolver, description: "A list of cards from the server. Filterable by topic."
  end
end
