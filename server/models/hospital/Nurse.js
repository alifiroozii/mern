const mongoose = require("mongoose");

const NurseSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  department: { type: mongoose.Schema.Types.ObjectId, ref: "Department" },
});

const Nurse = mongoose.models.Nurse || mongoose.model("Nurse", NurseSchema);
module.exports = Nurse;
