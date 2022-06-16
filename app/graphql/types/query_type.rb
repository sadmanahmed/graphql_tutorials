module Types
  class QueryType < Types::BaseObject
    # field :all_links, [LinkType], null: false
    field :all_links, [LinkType], resolver: Resolvers::LinksSearch, null: false
    def all_links
      Link.all
    end
  end
end
