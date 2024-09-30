const mongoose = require("mongoose");

const ProjectSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String, required: true },
  status: { type: String, required: true },
  clientId: { type: mongoose.Schema.Types.ObjectId, ref: "Client" },
});

// جلوگیری از بارگذاری مجدد مدل
const Project = mongoose.models.Project || mongoose.model("Project", ProjectSchema);
module.exports = Project;
