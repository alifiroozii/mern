const mongoose = require("mongoose");

const InvoiceSchema = new mongoose.Schema({
  patient: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Patient",
    required: true,
  },
  items: [{ description: String, amount: Number }],
  totalAmount: { type: Number, required: true },
  date: { type: Date, required: true },
  paid: { type: Boolean, default: false },
});

const Invoice =
  mongoose.models.Invoice || mongoose.model("Invoice", InvoiceSchema);
module.exports = Invoice;
