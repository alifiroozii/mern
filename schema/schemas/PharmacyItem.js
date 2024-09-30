const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const PharmacyItemType = new GraphQLObjectType({
  name: "PharmacyItem",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    price: { type: GraphQLString },
  }),
});

const pharmacyItemSchema = new GraphQLSchema({
  types: [PharmacyItemType],
});

module.exports = pharmacyItemSchema;
