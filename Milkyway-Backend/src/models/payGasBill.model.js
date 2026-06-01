const mongoose = require('mongoose');

const payGasBillSchema = new mongoose.Schema(
    {
        userId: { type: String, index: true },
        gasProviderName: { type: String, required: true, index: true },
        customerId: { type: String, default: '' },
        customerName: { type: String, default: '' },
        registeredMobile: { type: String, default: '' },
        billAmountRemain: { type: Number, default: 0 },
        dealerName: { type: String, default: '' },
        image: { type: String, default: '' },
        paymentRef: { type: String, default: '' },
    },
    { timestamps: true }
);

module.exports = mongoose.model('PayGasBill', payGasBillSchema);
// const mongoose = require('mongoose');

// const PayGasBillSchema = new mongoose.Schema(
//   {
//     userId: { type: String, index: true },
//     gasProviderName: { type: String, required: true, index: true },
//     customerId: { type: String, default: '' },
//     customerName: { type: String, default: '' },
//     registeredMobile: { type: String, default: '' },
//     billAmountRemain: { type: Number, default: 0 },
//     dealerName: { type: String, default: '' },
//     image: { type: String, default: '' },
//     paymentRef: { type: String, default: '' },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('PayGasBill', PayGasBillSchema);
