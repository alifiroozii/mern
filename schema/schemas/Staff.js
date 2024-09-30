const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const StaffType = new GraphQLObjectType({
  name: "Staff",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    position: { type: GraphQLString },
  }),
});

const staffSchema = new GraphQLSchema({
  types: [StaffType],
});

module.exports = staffSchema;
