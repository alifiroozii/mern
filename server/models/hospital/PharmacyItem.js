const mongoose = require("mongoose");

const PharmacyItemSchema = new mongoose.Schema({
  name: { type: String, required: true },
  dosage: { type: String, required: true },
  stock: { type: Number, required: true },
  pharmacy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Pharmacy",
    required: true,
  },
});

const PharmacyItem =
  mongoose.models.PharmacyItem ||
  mongoose.model("PharmacyItem", PharmacyItemSchema);
module.exports = PharmacyItem;
