const mongoose = require('mongoose');

const sharedPreferenceSchema = new mongoose.Schema(
    {
        userId: { type: String, required: true, unique: true, index: true },
        autoPayId: { type: String, default: '' },
        autoPayBalanceId: { type: String, default: '' },
        dailyProductIds: { type: [Number], default: [] },
        locationId: { type: String, default: '' },
        selectedPlan: { type: String, default: '' },
        userData: { type: Object, default: {} },
    },
    { timestamps: true }
);

module.exports = mongoose.model('SharedPreference', sharedPreferenceSchema);
// const mongoose = require('mongoose');

// const SharedPreferenceSchema = new mongoose.Schema(
//   {
//     userId: { type: String, required: true, unique: true, index: true },
//     autoPayId: { type: String, default: '' },
//     autoPayBalanceId: { type: String, default: '' },
//     dailyProductIds: { type: [Number], default: [] },
//     locationId: { type: String, default: '' },
//     selectedPlan: { type: String, default: '' },
//     userData: { type: Object, default: {} },
//   },
//   { timestamps: true }
// );

// module.exports = mongoose.model('SharedPreference', SharedPreferenceSchema);
