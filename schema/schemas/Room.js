const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const RoomType = new GraphQLObjectType({
  name: "Room",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    capacity: { type: GraphQLString },
  }),
});

const roomSchema = new GraphQLSchema({
  types: [RoomType],
});

module.exports = roomSchema;
