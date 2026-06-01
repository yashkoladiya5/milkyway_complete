const mongoose = require('mongoose');

const locationSchema = new mongoose.Schema(
    {
        userId: { type: String, required: true, index: true },
        name: { type: String, default: '' },
        address: { type: String, default: '' },
        area: { type: String, default: '' },
        pincode: { type: Number, default: null },
        mobileNumber: { type: String, default: '' },
        email: { type: String, default: '' },
        label: { type: String, default: '' },
        isDefault: { type: Boolean, default: false },
        geo: {
            type: { type: String, enum: ['Point'], default: 'Point' },
            coordinates: { type: [Number], default: [0, 0] },
        },
    },
    { timestamps: true }
);

locationSchema.index({ geo: '2dsphere' });

module.exports = mongoose.model('Location', locationSchema);
// const mongoose = require('mongoose');

// const LocationSchema = new mongoose.Schema(
//   {
//     userId: { type: String, required: true, index: true },
//     name: { type: String, default: '' },
//     addressLine1: { type: String, default: '' },
//     addressLine2: { type: String, default: '' },
//     area: { type: String, default: '' },
//     city: { type: String, default: '' },
//     state: { type: String, default: '' },
//     pincode: { type: Number, default: null },
//     mobileNumber: { type: String, default: '' },
//     email: { type: String, default: '' },
//     label: { type: String, default: '' },
//     isDefault: { type: Boolean, default: false },
//     geo: {
//       type: { type: String, enum: ['Point'], default: 'Point' },
//       coordinates: { type: [Number], default: [0, 0] },
//     },
//   },
//   { timestamps: true }
// );

// LocationSchema.index({ geo: '2dsphere' });

// module.exports = mongoose.model('Location', LocationSchema);
