const mongoose = require('mongoose');

const DepartmentSchema = new mongoose.Schema({
  name: { type: String, required: true },
  headDoctor: { type: mongoose.Schema.Types.ObjectId, ref: 'Doctor' }
});

const Department = mongoose.models.Department || mongoose.model("Department", DepartmentSchema);
module.exports = Department;
