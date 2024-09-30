const mongoose = require("mongoose");

const PatientSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  medicalHistory: { type: String },
  currentStatus: { type: String },
});

const Patient =
  mongoose.models.Patient || mongoose.model("Patient", PatientSchema);
module.exports = Patient;
