const mongoose = require('mongoose');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config();

const {
  User,
  Location,
  Product,
  RechargePlan,
  GasBooking,
  PayGasBill,
  ElectricityBill,
  WalletEntry,
  SharedPreference,
} = require('./models');

const seedProducts = require('./server').seedProducts;
const seedRechargePlans = require('./server').seedRechargePlans;
const seedGasBookings = require('./server').seedGasBookings;
const seedPayGasBills = require('./server').seedPayGasBills;
const seedElectricityBills = require('./server').seedElectricityBills;

async function connect() {
  const uri = process.env.MONGODB_URI || 'mongodb://127.0.0.1:27017/milkyway_dev';
  await mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true });
}

async function seed() {
  await connect();

  let user = await User.findOne({ email: 'test@milkyway.local' });
  if (!user) {
    user = await User.create({
      name: 'Test',
      lastName: 'User',
      mobileNumber: '+911234567890',
      email: 'test@milkyway.local',
      passwordHash: 'changeme',
    });
  }

  const userId = user._id.toString();

  const productsCount = await Product.countDocuments({ userId });
  if (productsCount === 0) {
    await Product.insertMany(seedProducts.map((p) => ({ ...p, userId, quantity: '0' })));
    console.log('Seeded products');
  }

  const plansCount = await RechargePlan.countDocuments({ userId });
  if (plansCount === 0) {
    await RechargePlan.insertMany(seedRechargePlans.map((p) => ({ ...p, userId })));
    console.log('Seeded recharge plans');
  }

  const gasCount = await GasBooking.countDocuments({ userId });
  if (gasCount === 0) {
    await GasBooking.insertMany(seedGasBookings.map((p) => ({ ...p, userId })));
    console.log('Seeded gas bookings');
  }

  const payGasCount = await PayGasBill.countDocuments({ userId });
  if (payGasCount === 0) {
    await PayGasBill.insertMany(seedPayGasBills.map((p) => ({ ...p, userId })));
    console.log('Seeded pay gas bills');
  }

  const elecCount = await ElectricityBill.countDocuments({ userId });
  if (elecCount === 0) {
    await ElectricityBill.insertMany(seedElectricityBills.map((p) => ({ ...p, userId })));
    console.log('Seeded electricity bills');
  }

  await SharedPreference.findOneAndUpdate(
    { userId },
    { $setOnInsert: { userId, userData: { userId } } },
    { upsert: true }
  );

  console.log('Seeding complete');
  process.exit(0);
}

seed().catch((err) => {
  console.error('Seed error', err);
  process.exit(1);
});
const mongoose = require('mongoose');
const dotenv = require('dotenv');
dotenv.config();

const {
  User,
  Location,
  Product,
  RechargePlan,
  GasBooking,
  PayGasBill,
  ElectricityBill,
  WalletEntry,
  SharedPreference,
} = require('./models');

const MONGO_URI = process.env.MONGODB_URI || 'mongodb://127.0.0.1:27017/milkyway_dev';

const seedProducts = [
  { id: 1, name: 'Milk', weight: '1 litre', price: '₹60.00', isFavourite: 0, isDaily: 1, description: 'Whole cow milk', rating: '4.7', category: 'Dairy Product', image: 'https://media.istockphoto.com/id/1398613299/photo/glass-of-milk-isolated-on-white.jpg', relatedImages: [] },
  { id: 6, name: 'Butter', weight: '500 gm', price: '₹240.00', isFavourite: 0, isDaily: 0, description: 'Butter', rating: '4.6', category: 'Dairy Product', image: '', relatedImages: [] },
];

const seedRechargePlans = [
  { company: 'Jio', category: 'Popular', data: '2 GB/day', voice: 'Unlimited calls', sms: '100 SMS/day', validity: '28 days', subscription: 'JioTV', offer: '20% upto 200 Cashback', price: '₹299' },
];

const seedGasBookings = [
  { gasProviderName: 'Gujarat Gas Limited', registeredMobile: '9876543210', cylinderPrice: 1150.5, paymentStatus: 'Paid', dealerName: 'Sharma Gas Agency', image: '' },
];

const seedPayGasBills = [
  { gasProviderName: 'Gujarat Gas Limited', customerId: 'GGL001', customerName: 'Ravi Mehta', registeredMobile: '9876543210', billAmountRemain: 0, dealerName: 'Sharma Gas Agency', image: '' },
];

const seedElectricityBills = [
  { customerNo: '9876543210', electricityProvider: 'DGVCL', image: '', dueDate: '10/11/2026', amount: 1250.5, state: 'Gujarat', name: 'Rajesh Patel' },
];

async function connect() {
  await mongoose.connect(MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });
}

async function run() {
  await connect();
  console.log('Connected to', MONGO_URI);

  // Create or find test user
  const testMobile = '+919876543210';
  let user = await User.findOne({ mobileNumber: testMobile });

  if (!user) {
    user = await User.create({
      name: 'Test',
      lastName: 'User',
      area: 'Test Area',
      address: '123 Test Street',
      pincode: 380001,
      mobileNumber: testMobile,
      email: 'test.user@example.com',
      passwordHash: 'password123',
      image: '',
      preferences: {},
    });
    console.log('Created user', user._id.toString());
  } else {
    console.log('Found user', user._id.toString());
  }

  // ensure a location
  let location = await Location.findOne({ userId: user._id.toString() });
  if (!location) {
    location = await Location.create({
      userId: user._id.toString(),
      name: 'Home',
      addressLine1: '123 Test Street',
      area: 'Test Area',
      city: 'Ahmedabad',
      state: 'Gujarat',
      pincode: 380001,
      mobileNumber: testMobile,
    });
    console.log('Created location', location._id.toString());
  }

  // shared preferences
  await SharedPreference.findOneAndUpdate(
    { userId: user._id.toString() },
    { userId: user._id.toString(), locationId: location._id.toString(), userData: { userId: user._id.toString() } },
    { upsert: true }
  );

  // seed collections if empty for this user
  const pCount = await Product.countDocuments({ userId: user._id.toString() });
  if (pCount === 0) {
    await Product.insertMany(seedProducts.map((p) => ({ ...p, userId: user._id.toString() })));
    console.log('Seeded products');
  }

  const planCount = await RechargePlan.countDocuments({ userId: user._id.toString() });
  if (planCount === 0) {
    await RechargePlan.insertMany(seedRechargePlans.map((p) => ({ ...p, userId: user._id.toString() })));
    console.log('Seeded recharge plans');
  }

  const gCount = await GasBooking.countDocuments({ userId: user._id.toString() });
  if (gCount === 0) {
    await GasBooking.insertMany(seedGasBookings.map((p) => ({ ...p, userId: user._id.toString() })));
    console.log('Seeded gas bookings');
  }

  const gbCount = await PayGasBill.countDocuments({ userId: user._id.toString() });
  if (gbCount === 0) {
    await PayGasBill.insertMany(seedPayGasBills.map((p) => ({ ...p, userId: user._id.toString() })));
    console.log('Seeded pay gas bills');
  }

  const eCount = await ElectricityBill.countDocuments({ userId: user._id.toString() });
  if (eCount === 0) {
    await ElectricityBill.insertMany(seedElectricityBills.map((p) => ({ ...p, userId: user._id.toString() })));
    console.log('Seeded electricity bills');
  }

  // wallet sample
  const wCount = await WalletEntry.countDocuments({ userId: user._id.toString() });
  if (wCount === 0) {
    await WalletEntry.create({ userId: user._id.toString(), name: 'Initial credit', price: '1000', isIncome: 1 });
    console.log('Seeded wallet entry');
  }

  console.log('Seeding complete.');
  await mongoose.disconnect();
  process.exit(0);
}

run().catch((err) => {
  console.error('Seed error', err);
  process.exit(1);
});
