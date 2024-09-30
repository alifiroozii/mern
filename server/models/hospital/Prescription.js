const mongoose = require("mongoose");

const PrescriptionSchema = new mongoose.Schema({
  patient: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Patient",
    required: true,
  },
  doctor: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Doctor",
    required: true,
  },
  medications: [{ type: mongoose.Schema.Types.ObjectId, ref: "PharmacyItem" }],
  date: { type: Date, required: true },
  notes: { type: String },
});

const Prescription =
  mongoose.models.Prescription ||
  mongoose.model("Prescription", PrescriptionSchema);
module.exports = Prescription;
