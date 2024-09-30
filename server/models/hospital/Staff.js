const mongoose = require("mongoose");

const StaffSchema = new mongoose.Schema({
  user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
  department: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Department",
    required: true,
  },
  position: { type: String, required: true },
});

const Staff = mongoose.models.Staff || mongoose.model("Staff", StaffSchema);
module.exports = Staff;
