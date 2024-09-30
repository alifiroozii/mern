const mongoose = require("mongoose");

const PharmacySchema = new mongoose.Schema({
  name: { type: String, required: true },
  address: { type: String, required: true },
  phoneNumber: { type: String },
});

const Pharmacy =
  mongoose.models.Pharmacy || mongoose.model("Pharmacy", PharmacySchema);
module.exports = Pharmacy;
