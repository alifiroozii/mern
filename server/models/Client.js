const mongoose = require("mongoose");

const ClientSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true },
  phone: { type: String, required: true },
});

// جلوگیری از بارگذاری مجدد مدل
const Client = mongoose.models.Client || mongoose.model("Client", ClientSchema);
module.exports = Client;
