module Types
  class QueryType < Types::BaseObject
    field :viewer, UserType,
      null:        true,
      description: 'A logged in user'

    def viewer
      context[:current_user]
    end
  end
end
