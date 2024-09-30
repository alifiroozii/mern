const { mergeTypeDefs } = require("@graphql-tools/merge");

// Import all individual schemas
const roleSchema = require("./schemas/Role"); 
const userSchema = require("./schemas/User"); 
const patientSchema = require("./schemas/Patient"); 
const doctorSchema = require("./schemas/Doctor"); 
const appointmentSchema = require("./schemas/Appointment"); 
const roomSchema = require("./schemas/Room"); 
const staffSchema = require("./schemas/Staff"); 
const departmentSchema = require("./schemas/Department"); 
const prescriptionSchema = require("./schemas/Prescription"); 
const pharmacySchema = require("./schemas/Pharmacy"); 
const invoiceSchema = require("./schemas/Invoice"); 
const pharmacyItemSchema = require("./schemas/PharmacyItem"); 

const mainSchema = mergeTypeDefs([
  roleSchema,
  userSchema,
  patientSchema,
  doctorSchema,
  appointmentSchema,
  roomSchema,
  staffSchema,
  departmentSchema,
  prescriptionSchema,
  pharmacySchema,
  invoiceSchema,
  pharmacyItemSchema,
]);

module.exports = {
  mainSchema,
};
