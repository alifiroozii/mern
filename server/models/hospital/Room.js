const mongoose = require('mongoose');

const RoomSchema = new mongoose.Schema({
  roomNumber: { type: String, required: true },
  roomType: { type: String, required: true },
  department: { type: mongoose.Schema.Types.ObjectId, ref: 'Department', required: true },
  currentPatient: { type: mongoose.Schema.Types.ObjectId, ref: 'Patient' }
});

const Room = mongoose.models.Room || mongoose.model("Room", RoomSchema);
module.exports = Room;

