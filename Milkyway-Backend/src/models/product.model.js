const mongoose = require('mongoose');

const productSchema = new mongoose.Schema(
    {
        userId: { type: String, index: true },
        id: { type: Number, required: true, index: true },
        name: { type: String, required: true },
        weight: { type: String, default: '' },
        price: { type: String, default: '' },
        isFavourite: { type: Number, default: 0 },
        isDaily: { type: Number, default: 0 },
        description: { type: String, default: '' },
        rating: { type: String, default: '' },
        category: { type: String, default: '' },
        relatedImages: { type: [String], default: [] },
        image: { type: String, default: '' },
        quantity: { type: String, default: '0' },
    },
    { timestamps: true }
);

productSchema.index({ userId: 1, id: 1 });

module.exports = mongoose.model('Product', productSchema);
// const mongoose = require('mongoose');

// const ProductSchema = new mongoose.Schema(
//   {
//     userId: { type: String, index: true },
//     id: { type: Number, required: true, index: true },
//     name: { type: String, required: true },
//     weight: { type: String, default: '' },
//     price: { type: String, default: '' },
//     isFavourite: { type: Number, default: 0 },
//     isDaily: { type: Number, default: 0 },
//     description: { type: String, default: '' },
//     rating: { type: String, default: '' },
//     category: { type: String, default: '' },
//     relatedImages: { type: [String], default: [] },
//     image: { type: String, default: '' },
//     quantity: { type: String, default: '0' },
//   },
//   { timestamps: true }
// );

// ProductSchema.index({ userId: 1, id: 1 }, { unique: false });

// module.exports = mongoose.model('Product', ProductSchema);
