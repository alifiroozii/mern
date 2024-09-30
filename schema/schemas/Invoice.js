const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const InvoiceType = new GraphQLObjectType({
  name: "Invoice",
  fields: () => ({
    id: { type: GraphQLID },
    amount: { type: GraphQLString },
    patientId: { type: GraphQLID },
  }),
});

const invoiceSchema = new GraphQLSchema({
  types: [InvoiceType],
});

module.exports = invoiceSchema;
