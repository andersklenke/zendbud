module Types
  class UserType < Types::BaseObject
    global_id_field :id

    field :created_at, GraphQL::Types::ISO8601DateTime,
      null:        false,
      description: 'Identifies the date and time when the object was created.'

    field :email, String,
      null:        false,
      description: "The user's email."

    field :name, String,
      null:        false,
      description: "The users name."

  end
end
