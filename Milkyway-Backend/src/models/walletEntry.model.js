const mongoose = require('mongoose');

const WalletEntrySchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    name: { type: String, default: '' },
    price: { type: String, default: '' },
    quantity: { type: String, default: '0' },
    image: { type: String, default: '' },
    weightValue: { type: String, default: '' },
    weightUnit: { type: String, default: '' },
    date: { type: String, default: () => new Date().toISOString().slice(0, 19) },
    isIncome: { type: Number, default: 0 },
    isExpense: { type: Number, default: 0 },
    isDaily: { type: Number, default: 0 },
    metadata: { type: Object, default: {} },
  },
  { timestamps: true }
);

WalletEntrySchema.index({ userId: 1, date: -1 });

module.exports = mongoose.model('WalletEntry', WalletEntrySchema);
