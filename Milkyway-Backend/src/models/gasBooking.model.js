const mongoose = require('mongoose');

const gasBookingSchema = new mongoose.Schema(
    {
        userId: { type: String, index: true },
        gasProviderName: { type: String, required: true, index: true },
        registeredMobile: { type: String, default: '' },
        cylinderPrice: { type: Number, default: 0 },
        paymentStatus: { type: String, enum: ['Paid', 'Remain', 'Pending'], default: 'Pending' },
        dealerName: { type: String, default: '' },
        image: { type: String, default: '' },
        paymentRef: { type: String, default: '' },
    },
    { timestamps: true }
);

module.exports = mongoose.model('GasBooking', gasBookingSchema);
// const mongoose = require('mongoose');

// const GasBookingSchema = new mongoose.Schema(
//   {
//     userId: { type: String, index: true },
//     gasProviderName: { type: String, required: true, index: true },
//     registeredMobile: { type: String, default: '' },
//     cylinderPrice: { type: Number, default: 0 },
//     paymentStatus: { type: String, enum: ['Paid', 'Remain', 'Pending'], default: 'Pending' },
//     dealerName: { type: String, default: '' },
//     image: { type: String, default: '' },
//     paymentRef: { type: String, default: '' },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('GasBooking', GasBookingSchema);
