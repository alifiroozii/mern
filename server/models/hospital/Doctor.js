const mongoose = require("mongoose");

const DoctorSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  specialization: { type: String, required: true },
  department: { type: mongoose.Schema.Types.ObjectId, ref: 'Department' }

});

const Doctor = mongoose.models.Doctor || mongoose.model("Doctor", DoctorSchema);
module.exports = Doctor;
