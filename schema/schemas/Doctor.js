const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const DoctorType = new GraphQLObjectType({
  name: "Doctor",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
    specialty: { type: GraphQLString },
  }),
});

const doctorSchema = new GraphQLSchema({
  types: [DoctorType],
});

module.exports = doctorSchema;
