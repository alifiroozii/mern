const { GraphQLObjectType, GraphQLID, GraphQLString, GraphQLSchema } = require("graphql");

const DepartmentType = new GraphQLObjectType({
  name: "Department",
  fields: () => ({
    id: { type: GraphQLID },
    name: { type: GraphQLString },
  }),
});

const departmentSchema = new GraphQLSchema({
  types: [DepartmentType],
});

module.exports = departmentSchema;
