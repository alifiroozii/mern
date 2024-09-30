const { GraphQLObjectType, GraphQLID, GraphQLString,GraphQLSchema } = require("graphql");

const UserType = new GraphQLObjectType({
  name: "User",
  fields: () => ({
    id: { type: GraphQLID },
    username: { type: GraphQLString },
    email: { type: GraphQLString },
    role: { type: GraphQLString }, 
  }),
});

const userSchema = new GraphQLSchema({
  types: [UserType],
});

module.exports = userSchema;
