const mongoose = require('mongoose');

const userSchema = new mongoose.Schema(
    {
        name: { type: String, required: true, index: true },
        lastName: { type: String, default: '' },
        area: { type: String, default: '' },
        address: { type: String, default: '' },
        pincode: { type: Number, default: null },
        mobileNumber: { type: String, required: true, unique: true, index: true },
        email: { type: String, required: true, unique: true, lowercase: true, index: true },
        passwordHash: { type: String, required: true },
        image: { type: String, default: '' },
        role: { type: String, enum: ['user', 'admin'], default: 'user' },
        walletBalance: { type: Number, default: 0 },
        preferences: {
            autoPayId: { type: String, default: '' },
            autoPayBalanceId: { type: String, default: '' },
            dailyProductIds: { type: [Number], default: [] },
            locationId: { type: String, default: '' },
            selectedPlan: { type: String, default: '' },
        },
    },
    { timestamps: true }
);

module.exports = mongoose.model('User', userSchema);
// const mongoose = require('mongoose');

// const UserSchema = new mongoose.Schema(
//   {
//     name: { type: String, required: true, index: true },
//     lastName: { type: String, default: '' },
//     area: { type: String, default: '' },
//     address: { type: String, default: '' },
//     pincode: { type: Number, default: null },
//     mobileNumber: { type: String, required: true, unique: true, index: true },
//     email: { type: String, required: true, unique: true, lowercase: true, index: true },
//     passwordHash: { type: String, required: true },
//     image: { type: String, default: '' },
//     role: { type: String, enum: ['user', 'admin'], default: 'user' },
//     walletBalance: { type: Number, default: 0 },
//     preferences: {
//       autoPayId: { type: String, default: '' },
//       autoPayBalanceId: { type: String, default: '' },
//       dailyProductIds: { type: [Number], default: [] },
//       locationId: { type: String, default: '' },
//       selectedPlan: { type: String, default: '' },
//     },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('User', UserSchema);
