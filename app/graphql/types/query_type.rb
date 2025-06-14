# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Root-level entry points for queries on your schema.

    field :test_field, String, null: false,
      description: "An example field added by the generator"

    def test_field
      "Hello World!"
    end

    field :users, [Types::UserType], null: false,
      description: "Returns a list of all users"

    def users
      User.all
    end

    field :user, Types::UserType, null: true do
      description "Find a user by ID"
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    # Uncomment below to enable global object identification support
    #
    # field :node, Types::NodeType, null: true,
    #   description: "Fetches an object given its ID" do
    #   argument :id, ID, required: true
    # end
    #
    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end
    #
    # field :nodes, [Types::NodeType, null: true], null: true,
    #   description: "Fetches a list of objects given a list of IDs" do
    #   argument :ids, [ID], required: true
    # end
    #
    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end
  end
end
