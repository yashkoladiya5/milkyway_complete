const mongoose = require('mongoose');

const electricityBillSchema = new mongoose.Schema(
    {
        userId: { type: String, index: true },
        customerNo: { type: String, required: true, index: true },
        electricityProvider: { type: String, default: '' },
        image: { type: String, default: '' },
        dueDate: { type: String, default: '' },
        amount: { type: Number, default: 0 },
        state: { type: String, default: '' },
        name: { type: String, default: '' },
        paymentRef: { type: String, default: '' },
    },
    { timestamps: true }
);

module.exports = mongoose.model('ElectricityBill', electricityBillSchema);
// const mongoose = require('mongoose');

// const ElectricityBillSchema = new mongoose.Schema(
//   {
//     userId: { type: String, index: true },
//     customerNo: { type: String, required: true, index: true },
//     electricityProvider: { type: String, default: '' },
//     image: { type: String, default: '' },
//     dueDate: { type: String, default: '' },
//     amount: { type: Number, default: 0 },
//     state: { type: String, default: '' },
//     name: { type: String, default: '' },
//     paymentRef: { type: String, default: '' },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('ElectricityBill', ElectricityBillSchema);
