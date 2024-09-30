const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const PharmacyType = new GraphQLObjectType({
  name: "Pharmacy",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
  }),
});

const pharmacySchema = new GraphQLSchema({
  types: [PharmacyType],
});

module.exports = pharmacySchema;
