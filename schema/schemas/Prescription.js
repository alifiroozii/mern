const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const PrescriptionType = new GraphQLObjectType({
  name: "Prescription",
  fields: () => ({
    id: { type: GraphQLID },
    details: { type: GraphQLString },
    patientId: { type: GraphQLID },
  }),
});

const prescriptionSchema = new GraphQLSchema({
  types: [PrescriptionType],
});

module.exports = prescriptionSchema;
