const mongoose = require('mongoose');

const rechargePlanSchema = new mongoose.Schema(
    {
        userId: { type: String, index: true },
        company: { type: String, required: true, index: true },
        category: { type: String, default: '' },
        data: { type: String, default: '' },
        voice: { type: String, default: '' },
        sms: { type: String, default: '' },
        validity: { type: String, default: '' },
        subscription: { type: String, default: '' },
        offer: { type: String, default: '' },
        price: { type: String, default: '' },
    },
    { timestamps: true }
);

module.exports = mongoose.model('RechargePlan', rechargePlanSchema);
// const mongoose = require('mongoose');

// const RechargePlanSchema = new mongoose.Schema(
//   {
//     userId: { type: String, index: true },
//     company: { type: String, required: true, index: true },
//     category: { type: String, default: '' },
//     data: { type: String, default: '' },
//     voice: { type: String, default: '' },
//     sms: { type: String, default: '' },
//     validity: { type: String, default: '' },
//     subscription: { type: String, default: '' },
//     offer: { type: String, default: '' },
//     price: { type: String, default: '' },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('RechargePlan', RechargePlanSchema);
