const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const AppointmentType = new GraphQLObjectType({
  name: "Appointment",
  fields: () => ({
    id: { type: GraphQLID },
    date: { type: GraphQLString },
    doctorId: { type: GraphQLID },
    patientId: { type: GraphQLID },
  }),
});

const appointmentSchema = new GraphQLSchema({
  types: [AppointmentType],
});

module.exports = appointmentSchema;
