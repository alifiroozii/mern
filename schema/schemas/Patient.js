const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const PatientType = new GraphQLObjectType({
  name: "Patient",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    age: { type: GraphQLString },
  }),
});

const patientSchema = new GraphQLSchema({
  types: [PatientType],
});

module.exports = patientSchema;
