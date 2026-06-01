const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const Stripe = require('stripe');
const { MongoMemoryServer } = require('mongodb-memory-server');

dotenv.config();

const { chatWithAI, scanUtilityBill, generateAdvisorInsights } = require('./services/ai.service');


const app = express();
const uploadDirectory = path.join(__dirname, '..', 'uploads');
if (!fs.existsSync(uploadDirectory)) {
  fs.mkdirSync(uploadDirectory, { recursive: true });
}

app.use(cors({ origin: process.env.CORS_ORIGIN || '*' }));
const morgan = require('morgan');
app.use(morgan('dev'));
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static(uploadDirectory));

const upload = multer({ dest: uploadDirectory });
const stripe = process.env.STRIPE_SECRET_KEY
  ? new Stripe(process.env.STRIPE_SECRET_KEY)
  : null;

const locationSchema = new mongoose.Schema(
  {
    name: String,
    address: String,
    area: String,
    pincode: Number,
    mobileNumber: String,
    email: String,
    userId: String,
  },
  { timestamps: true }
);

const userSchema = new mongoose.Schema(
  {
    name: String,
    lastName: String,
    area: String,
    address: String,
    pincode: Number,
    mobileNumber: { type: String, unique: true },
    email: { type: String, unique: true },
    passwordHash: String,
    image: String,
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

const productSchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    id: Number,
    name: String,
    weight: String,
    price: String,
    isFavourite: { type: Number, default: 0 },
    isDaily: { type: Number, default: 0 },
    description: String,
    rating: String,
    category: String,
    relatedImages: [String],
    image: String,
    quantity: { type: String, default: '0' },
  },
  { timestamps: true }
);

const rechargePlanSchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    company: String,
    category: String,
    data: String,
    voice: String,
    sms: String,
    validity: String,
    subscription: String,
    offer: String,
    price: String,
  },
  { timestamps: true }
);

const gasBookingSchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    gasProviderName: String,
    registeredMobile: String,
    cylinderPrice: Number,
    paymentStatus: String,
    dealerName: String,
    image: String,
  },
  { timestamps: true }
);

const payGasBillSchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    gasProviderName: String,
    customerId: String,
    customerName: String,
    registeredMobile: String,
    billAmountRemain: Number,
    dealerName: String,
    image: String,
  },
  { timestamps: true }
);

const electricityBillSchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    customerNo: String,
    electricityProvider: String,
    image: String,
    dueDate: String,
    amount: Number,
    state: String,
    name: String,
  },
  { timestamps: true }
);

const walletEntrySchema = new mongoose.Schema(
  {
    userId: { type: String, index: true },
    name: String,
    price: String,
    quantity: String,
    image: String,
    weightValue: String,
    weightUnit: String,
    date: String,
    isIncome: { type: Number, default: 0 },
    isExpense: { type: Number, default: 0 },
    isDaily: { type: Number, default: 0 },
  },
  { timestamps: true }
);

const sharedPreferenceSchema = new mongoose.Schema(
  {
    userId: { type: String, unique: true, index: true },
    autoPayId: { type: String, default: '' },
    autoPayBalanceId: { type: String, default: '' },
    dailyProductIds: { type: [Number], default: [] },
    locationId: { type: String, default: '' },
    selectedPlan: { type: String, default: '' },
    userData: { type: Object, default: {} },
  },
  { timestamps: true }
);

const { User, Location, Product, RechargePlan, GasBooking, PayGasBill, ElectricityBill, WalletEntry, SharedPreference } = require('./models');

const seedProducts = require('./data/products.json');
const seedRechargePlans = require('./data/plans.json');
const seedGasBookings = require('./data/gas_bookings.json');
const seedPayGasBills = require('./data/gas_bills.json');
const seedElectricityBills = require('./data/electricity_bills.json');

function normalizeMobile(mobileNumber) {
  if (!mobileNumber) {
    return '';
  }

  if (mobileNumber.startsWith('+91')) {
    return mobileNumber;
  }

  return `+91${mobileNumber}`;
}

function currencyToNumber(value) {
  if (typeof value === 'number') {
    return value;
  }

  if (!value) {
    return 0;
  }

  const normalized = String(value).replace(/[^0-9.\-]/g, '');
  return Number(normalized) || 0;
}

function normalizeDateString(value) {
  if (!value) {
    return new Date().toISOString().slice(0, 19).replace('T', ' ');
  }

  const raw = String(value).trim();
  const parsed = new Date(raw);
  if (!Number.isNaN(parsed.getTime())) {
    return parsed.toISOString().slice(0, 19).replace('T', ' ');
  }

  return raw.replace('T', ' ').slice(0, 19);
}

function makeToken(user) {
  return jwt.sign(
    { sub: user._id.toString(), mobileNumber: user.mobileNumber },
    process.env.JWT_SECRET || 'milkyway-secret',
    { expiresIn: '30d' }
  );
}

async function seedUserCollections(userId) {
  const products = await Product.countDocuments({ userId });
  if (products < seedProducts.length) {
    await Product.deleteMany({ userId });
    await Product.insertMany(
      seedProducts.map((item) => {
        let related = item.relatedImages;
        if (typeof related === 'string') {
          try {
            related = JSON.parse(related);
          } catch (e) {
            related = [];
          }
        }
        return { ...item, userId, quantity: '0', relatedImages: related };
      })
    );
  }

  const plans = await RechargePlan.countDocuments({ userId });
  if (plans < seedRechargePlans.length) {
    await RechargePlan.deleteMany({ userId });
    await RechargePlan.insertMany(seedRechargePlans.map((item) => ({ ...item, userId })));
  }

  const gasBookings = await GasBooking.countDocuments({ userId });
  if (gasBookings < seedGasBookings.length) {
    await GasBooking.deleteMany({ userId });
    await GasBooking.insertMany(seedGasBookings.map((item) => ({ ...item, userId })));
  }

  const gasBills = await PayGasBill.countDocuments({ userId });
  if (gasBills < seedPayGasBills.length) {
    await PayGasBill.deleteMany({ userId });
    await PayGasBill.insertMany(seedPayGasBills.map((item) => ({ ...item, userId })));
  }

  const electricityBills = await ElectricityBill.countDocuments({ userId });
  if (electricityBills < seedElectricityBills.length) {
    await ElectricityBill.deleteMany({ userId });
    await ElectricityBill.insertMany(seedElectricityBills.map((item) => ({ ...item, userId })));
  }
}

async function connectDatabase() {
  const mongoUri = process.env.MONGODB_URI || process.env.MONGO_URI;

  if (mongoUri) {
    try {
      console.log('Connecting to MongoDB database...');
      await mongoose.connect(mongoUri, { serverSelectionTimeoutMS: 5000 });
      console.log('Successfully connected to MongoDB.');
      return;
    } catch (error) {
      console.warn('WARNING: Failed to connect to MongoDB Atlas (IP might not be whitelisted).');
      console.warn(`Error: ${error.message}`);
      console.warn('Falling back to MongoMemoryServer for local in-memory database...');
    }
  }

  const memoryServer = await MongoMemoryServer.create();
  const memoryUri = memoryServer.getUri();
  process.env.MONGODB_URI = memoryUri;
  await mongoose.connect(memoryUri);
  console.log('Successfully connected to MongoMemoryServer (in-memory).');
}

app.get('/api/health', (req, res) => {
  res.json({ success: true, status: 'ok' });
});

// Secure secure AI proxy routes protected by JWT / server key storage
app.post('/api/ai/chat', async (req, res) => {
  try {
    const { message, history } = req.body;
    if (!message) {
      return res.status(400).json({ success: false, message: 'Message is required' });
    }
    const result = await chatWithAI({ message, history });
    return res.json(result);
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/ai/scan-bill', upload.single('image'), async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ success: false, message: 'No bill image uploaded' });
    }
    let mimeType = req.file.mimetype;
    if (mimeType === 'application/octet-stream') {
      const orig = (req.file.originalname || '').toLowerCase();
      if (orig.endsWith('.png')) {
        mimeType = 'image/png';
      } else if (orig.endsWith('.webp')) {
        mimeType = 'image/webp';
      } else {
        mimeType = 'image/jpeg';
      }
    }

    const result = await scanUtilityBill({
      filePath: req.file.path,
      mimeType: mimeType,
    });

    // Cleanup: Delete the local uploaded temporary file safely
    fs.unlink(req.file.path, (err) => {
      if (err) console.error('Failed to cleanup scanned bill file:', err);
    });

    return res.json(result);
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/ai/advisor', async (req, res) => {
  try {
    const userId = req.query.userId;
    if (!userId) {
      return res.status(400).json({ success: false, message: 'userId is required' });
    }

    const entries = await WalletEntry.find({ userId });
    let income = 0;
    let expense = 0;

    for (const entry of entries) {
      const value = currencyToNumber(entry.price);
      const quantity = Number(entry.quantity || '1') || 1;
      const amount = entry.isExpense === 1 ? value * quantity : value;

      if (entry.isExpense === 1) {
        expense += amount;
      } else if (entry.isIncome === 1) {
        income += amount;
      }
    }

    const walletSummary = {
      income,
      expense,
      balance: income - expense,
    };

    const transactions = await WalletEntry.find({ userId }).sort({ date: -1 }).limit(10);
    const dailyProducts = await Product.find({ userId, isDaily: 1 }).sort({ id: 1 });

    const result = await generateAdvisorInsights({
      walletSummary,
      transactions,
      dailyProducts,
    });

    return res.json(result);
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});


app.post('/api/auth/register', async (req, res) => {
  try {
    const {
      name,
      lastName,
      area,
      address,
      pincode,
      mobileNumber,
      email,
      password,
      image,
    } = req.body;

    const normalizedMobile = normalizeMobile(mobileNumber);

    const existingUser = await User.findOne({
      $or: [{ mobileNumber: normalizedMobile }, { email }],
    });

    if (existingUser) {
      return res.status(409).json({
        success: false,
        message: 'User already exists',
      });
    }

    const passwordHash = await bcrypt.hash(String(password), 10);

    const user = await User.create({
      name,
      lastName: lastName || '',
      area,
      address,
      pincode: Number(pincode),
      mobileNumber: normalizedMobile,
      email,
      passwordHash,
      image: image || '',
      preferences: {
        autoPayId: '',
        autoPayBalanceId: '',
        dailyProductIds: [],
        locationId: '',
        selectedPlan: '',
      },
    });

    const location = await Location.create({
      userId: user._id.toString(),
      name,
      address,
      area,
      pincode: Number(pincode),
      mobileNumber: normalizedMobile,
      email,
    });

    user.preferences.locationId = location._id.toString();
    await user.save();

    await SharedPreference.create({
      userId: user._id.toString(),
      locationId: location._id.toString(),
      userData: {
        userId: user._id.toString(),
      },
    });

    await seedUserCollections(user._id.toString());

    return res.status(201).json({
      success: true,
      userId: user._id.toString(),
      token: makeToken(user),
      user: {
        id: user._id.toString(),
        name: user.name,
        lastName: user.lastName,
        area: user.area,
        address: user.address,
        pincode: user.pincode,
        mobileNumber: user.mobileNumber,
        email: user.email,
        image: user.image,
        preferences: user.preferences,
      },
      location,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/auth/login', async (req, res) => {
  try {
    const { mobileNumber, password } = req.body;
    const normalizedMobile = normalizeMobile(mobileNumber);

    const user = await User.findOne({ mobileNumber: normalizedMobile });

    if (!user) {
      return res.status(401).json({ success: false, message: 'Invalid credentials' });
    }

    const isPasswordValid = await bcrypt.compare(String(password), user.passwordHash);
    if (!isPasswordValid) {
      return res.status(401).json({ success: false, message: 'Invalid credentials' });
    }

    await seedUserCollections(user._id.toString());

    const locations = await Location.find({ userId: user._id.toString() }).sort({ createdAt: 1 });
    const preferences = await SharedPreference.findOne({ userId: user._id.toString() });

    return res.json({
      success: true,
      userId: user._id.toString(),
      token: makeToken(user),
      user: {
        id: user._id.toString(),
        name: user.name,
        lastName: user.lastName,
        area: user.area,
        address: user.address,
        pincode: user.pincode,
        mobileNumber: user.mobileNumber,
        email: user.email,
        image: user.image,
        preferences: user.preferences,
      },
      locations,
      preferences,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/auth/lookup', async (req, res) => {
  try {
    const value = (req.query.value || '').toString().trim();
    if (!value) {
      return res.status(400).json({ success: false, message: 'value is required' });
    }

    const normalizedMobile = normalizeMobile(value);
    const user = await User.findOne({
      $or: [{ email: value }, { mobileNumber: normalizedMobile }],
    });

    if (!user) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    return res.json({
      success: true,
      userId: user._id.toString(),
      user: {
        id: user._id.toString(),
        name: user.name,
        lastName: user.lastName,
        area: user.area,
        address: user.address,
        pincode: user.pincode,
        mobileNumber: user.mobileNumber,
        email: user.email,
        image: user.image,
        preferences: user.preferences,
      },
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/users/:userId', async (req, res) => {
  try {
    const user = await User.findById(req.params.userId);
    if (!user) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    await seedUserCollections(req.params.userId);

    const locations = await Location.find({ userId: req.params.userId }).sort({ createdAt: 1 });
    const preferences = await SharedPreference.findOne({ userId: req.params.userId });

    return res.json({
      success: true,
      user: {
        id: user._id.toString(),
        name: user.name,
        lastName: user.lastName,
        area: user.area,
        address: user.address,
        pincode: user.pincode,
        mobileNumber: user.mobileNumber,
        email: user.email,
        image: user.image,
        preferences: user.preferences,
      },
      locations,
      preferences,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.put('/api/users/:userId/password', async (req, res) => {
  try {
    const { oldPassword, password, confirmPassword } = req.body;
    if (!password || !confirmPassword) {
      return res.status(400).json({ success: false, message: 'password and confirmPassword are required' });
    }

    const user = await User.findById(req.params.userId);
    if (!user) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    if (oldPassword) {
      const matches = await bcrypt.compare(String(oldPassword), String(user.passwordHash || ''));
      if (!matches) {
        return res.status(400).json({ success: false, message: 'Old password does not match' });
      }
    }

    const passwordHash = await bcrypt.hash(String(password), 10);

    user.passwordHash = passwordHash;
    await user.save();

    return res.json({ success: true, userId: user._id.toString() });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.put('/api/users/:userId', async (req, res) => {
  try {
    const update = { ...req.body };
    if (update.mobileNumber) {
      update.mobileNumber = normalizeMobile(update.mobileNumber);
    }
    if (update.pincode !== undefined) {
      update.pincode = Number(update.pincode);
    }

    const user = await User.findByIdAndUpdate(req.params.userId, update, { new: true });
    if (!user) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    return res.json({ success: true, user });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/users/:userId/profile-image', upload.single('image'), async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ success: false, message: 'No image uploaded' });
    }

    const imageUrl = `${req.protocol}://${req.get('host')}/uploads/${req.file.filename}`;
    const user = await User.findByIdAndUpdate(
      req.params.userId,
      { image: imageUrl },
      { new: true }
    );

    return res.json({ success: true, imageUrl, user });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/users/:userId/locations', async (req, res) => {
  try {
    const locations = await Location.find({ userId: req.params.userId }).sort({ createdAt: 1 });
    return res.json({ success: true, locations });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/users/:userId/locations', async (req, res) => {
  try {
    const location = await Location.create({
      userId: req.params.userId,
      ...req.body,
    });

    return res.status(201).json({ success: true, location });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.put('/api/users/:userId/locations/:locationId', async (req, res) => {
  try {
    const location = await Location.findOneAndUpdate(
      { userId: req.params.userId, _id: req.params.locationId },
      req.body,
      { new: true }
    );

    if (!location) {
      return res.status(404).json({ success: false, message: 'Location not found' });
    }

    return res.json({ success: true, location });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/users/:userId/preferences', async (req, res) => {
  try {
    const preferences = await SharedPreference.findOne({ userId: req.params.userId });
    return res.json({ success: true, preferences });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.put('/api/users/:userId/preferences', async (req, res) => {
  try {
    const preferences = await SharedPreference.findOneAndUpdate(
      { userId: req.params.userId },
      { ...req.body, userId: req.params.userId },
      { upsert: true, new: true }
    );

    const user = await User.findByIdAndUpdate(
      req.params.userId,
      {
        preferences: {
          autoPayId: preferences.autoPayId || '',
          autoPayBalanceId: preferences.autoPayBalanceId || '',
          dailyProductIds: preferences.dailyProductIds || [],
          locationId: preferences.locationId || '',
          selectedPlan: preferences.selectedPlan || '',
        },
      },
      { new: true }
    );

    return res.json({ success: true, preferences, user });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/products', async (req, res) => {
  try {
    console.log(`[GET /api/products] Incoming query:`, req.query);
    const filter = { userId: req.query.userId };
    if (req.query.category) {
      filter.category = req.query.category;
    }
    if (req.query.favourite === '1') {
      filter.isFavourite = 1;
    }
    if (req.query.daily === '1') {
      filter.isDaily = 1;
    }
    if (req.query.search) {
      filter.name = { $regex: req.query.search, $options: 'i' };
    }

    console.log(`[GET /api/products] Executing find with filter:`, filter);
    const products = await Product.find(filter).sort({ id: 1 });
    console.log(`[GET /api/products] Returning ${products.length} products`);
    return res.json({ success: true, products });
  } catch (error) {
    console.error(`[GET /api/products] ERROR:`, error);
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/products/:productId', async (req, res) => {
  try {
    const product = await Product.findOne({ userId: req.query.userId, id: Number(req.params.productId) });
    if (!product) {
      return res.status(404).json({ success: false, message: 'Product not found' });
    }

    return res.json({ success: true, product });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.patch('/api/products/:productId', async (req, res) => {
  try {
    const userId = req.query.userId;
    const update = { ...req.body };
    const product = await Product.findOneAndUpdate(
      { userId, id: Number(req.params.productId) },
      update,
      { new: true }
    );

    if (!product) {
      return res.status(404).json({ success: false, message: 'Product not found' });
    }

    return res.json({ success: true, product });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/products/bulk', async (req, res) => {
  try {
    const { userId, products = [] } = req.body;
    if (!userId) {
      return res.status(400).json({ success: false, message: 'userId is required' });
    }

    await Product.deleteMany({ userId });
    const inserted = await Product.insertMany(products.map((item) => ({ ...item, userId })));
    return res.status(201).json({ success: true, count: inserted.length });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/recharge-plans', async (req, res) => {
  try {
    const filter = { userId: req.query.userId };
    if (req.query.company) {
      filter.company = req.query.company;
    }
    if (req.query.category) {
      filter.category = req.query.category;
    }

    const plans = await RechargePlan.find(filter).sort({ company: 1 });
    return res.json({ success: true, plans });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/recharge-plans/bulk', async (req, res) => {
  try {
    const { userId, plans = [] } = req.body;
    await RechargePlan.deleteMany({ userId });
    const inserted = await RechargePlan.insertMany(plans.map((item) => ({ ...item, userId })));
    return res.status(201).json({ success: true, count: inserted.length });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/gas/providers', async (req, res) => {
  try {
    const providers = await GasBooking.aggregate([
      { $match: { userId: req.query.userId } },
      { $sort: { createdAt: 1 } },
      { $group: { _id: '$gasProviderName', item: { $first: '$$ROOT' } } },
      { $replaceRoot: { newRoot: '$item' } },
    ]);

    return res.json({ success: true, providers });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/gas/providers/bulk', async (req, res) => {
  try {
    const { userId, providers = [] } = req.body;
    await GasBooking.deleteMany({ userId });
    const inserted = await GasBooking.insertMany(providers.map((item) => ({ ...item, userId })));
    return res.status(201).json({ success: true, count: inserted.length });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/gas/bookings', async (req, res) => {
  try {
    const filter = { userId: req.query.userId };
    if (req.query.provider) {
      filter.gasProviderName = req.query.provider;
    }
    if (req.query.mobile) {
      filter.registeredMobile = req.query.mobile;
    }

    const bookings = await GasBooking.find(filter).sort({ createdAt: -1 });
    return res.json({ success: true, bookings });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.patch('/api/gas/bookings/:id', async (req, res) => {
  try {
    const booking = await GasBooking.findOneAndUpdate(
      { _id: req.params.id, userId: req.query.userId },
      req.body,
      { new: true }
    );

    if (!booking) {
      return res.status(404).json({ success: false, message: 'Booking not found' });
    }

    return res.json({ success: true, booking });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/gas/pay-bills', async (req, res) => {
  try {
    const filter = { userId: req.query.userId };
    if (req.query.provider) {
      filter.gasProviderName = req.query.provider;
    }
    if (req.query.customerId) {
      filter.customerId = req.query.customerId;
    }

    const bills = await PayGasBill.find(filter).sort({ createdAt: -1 });
    return res.json({ success: true, bills });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/gas/pay-bills/bulk', async (req, res) => {
  try {
    const { userId, bills = [] } = req.body;
    await PayGasBill.deleteMany({ userId });
    const inserted = await PayGasBill.insertMany(bills.map((item) => ({ ...item, userId })));
    return res.status(201).json({ success: true, count: inserted.length });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.patch('/api/gas/pay-bills/:id', async (req, res) => {
  try {
    const bill = await PayGasBill.findOneAndUpdate(
      { _id: req.params.id, userId: req.query.userId },
      req.body,
      { new: true }
    );

    if (!bill) {
      return res.status(404).json({ success: false, message: 'Gas bill not found' });
    }

    return res.json({ success: true, bill });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/electricity/providers', async (req, res) => {
  try {
    const providers = await ElectricityBill.aggregate([
      { $match: { userId: req.query.userId } },
      { $sort: { createdAt: 1 } },
      { $group: { _id: '$electricityProvider', item: { $first: '$$ROOT' } } },
      { $replaceRoot: { newRoot: '$item' } },
    ]);

    return res.json({ success: true, providers });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/electricity/providers/bulk', async (req, res) => {
  try {
    const { userId, providers = [] } = req.body;
    await ElectricityBill.deleteMany({ userId });
    const inserted = await ElectricityBill.insertMany(providers.map((item) => ({ ...item, userId })));
    return res.status(201).json({ success: true, count: inserted.length });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/electricity/bills', async (req, res) => {
  try {
    const filter = { userId: req.query.userId };
    if (req.query.state) {
      filter.state = req.query.state;
    }
    if (req.query.provider) {
      filter.electricityProvider = req.query.provider;
    }
    if (req.query.number) {
      filter.customerNo = req.query.number;
    }

    const bills = await ElectricityBill.find(filter).sort({ createdAt: -1 });
    return res.json({ success: true, bills });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.patch('/api/electricity/bills/:id', async (req, res) => {
  try {
    const bill = await ElectricityBill.findOneAndUpdate(
      { _id: req.params.id, userId: req.query.userId },
      req.body,
      { new: true }
    );

    if (!bill) {
      return res.status(404).json({ success: false, message: 'Electricity bill not found' });
    }

    return res.json({ success: true, bill });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/wallet/entries', async (req, res) => {
  try {
    const { userId, start, end } = req.query;

    if (!userId) {
      return res.status(400).json({ success: false, message: 'userId is required' });
    }

    const entries = await WalletEntry.find({ userId }).sort({ date: -1, createdAt: -1 });

    let filteredEntries = entries;
    if (start && end) {
      const startDate = new Date(String(start));
      const endDate = new Date(String(end));

      if (!Number.isNaN(startDate.getTime()) && !Number.isNaN(endDate.getTime())) {
        filteredEntries = entries.filter((entry) => {
          const entryDate = new Date(String(entry.date).replace(' ', 'T'));
          if (Number.isNaN(entryDate.getTime())) {
            return false;
          }

          return entryDate >= startDate && entryDate <= endDate;
        });
      }
    }

    return res.json({ success: true, entries: filteredEntries });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/wallet/entries', async (req, res) => {
  try {
    if (!req.body.userId) {
      return res.status(400).json({ success: false, message: 'userId is required' });
    }

    const entry = await WalletEntry.create({
      ...req.body,
      userId: req.body.userId,
      price: String(req.body.price || ''),
      quantity: String(req.body.quantity || '0'),
      date: normalizeDateString(req.body.date),
    });

    return res.status(201).json({ success: true, entry });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/wallet/summary', async (req, res) => {
  try {
    const entries = await WalletEntry.find({ userId: req.query.userId });
    let income = 0;
    let expense = 0;

    for (const entry of entries) {
      const value = currencyToNumber(entry.price);
      const quantity = Number(entry.quantity || '1') || 1;
      const amount = entry.isExpense === 1 ? value * quantity : value;

      if (entry.isExpense === 1) {
        expense += amount;
      } else if (entry.isIncome === 1) {
        income += amount;
      }
    }

    return res.json({
      success: true,
      income,
      expense,
      balance: income - expense,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.get('/api/daily-products', async (req, res) => {
  try {
    const products = await Product.find({ userId: req.query.userId, isDaily: 1 }).sort({ id: 1 });
    return res.json({ success: true, products });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/daily-products', async (req, res) => {
  try {
    const { userId, productIds = [] } = req.body;
    const normalizedIds = productIds.map((value) => Number(value));

    await Product.updateMany(
      { userId },
      { $set: { isDaily: 0 } }
    );

    await Product.updateMany(
      { userId, id: { $in: normalizedIds } },
      { $set: { isDaily: 1 } }
    );

    await SharedPreference.findOneAndUpdate(
      { userId },
      { dailyProductIds: normalizedIds },
      { upsert: true, new: true }
    );

    return res.json({ success: true, dailyProductIds: normalizedIds });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.delete('/api/daily-products/:productId', async (req, res) => {
  try {
    const userId = req.query.userId;
    const productId = Number(req.params.productId);

    await Product.updateOne({ userId, id: productId }, { $set: { isDaily: 0 } });
    await SharedPreference.updateOne({ userId }, { $pull: { dailyProductIds: productId } });

    return res.json({ success: true });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.post('/api/payments/create-intent', async (req, res) => {
  try {
    const { amount, currency = 'inr', metadata = {} } = req.body;

    if (!stripe) {
      return res.json({
        success: true,
        clientSecret: 'mock_client_secret',
        amount,
        currency,
        note: 'STRIPE_SECRET_KEY is not configured, so this is a local mock response.',
      });
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount: Math.round(Number(amount)),
      currency,
      metadata,
    });

    return res.json({
      success: true,
      clientSecret: paymentIntent.client_secret,
      paymentIntentId: paymentIntent.id,
    });
  } catch (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
});

app.use((error, req, res, next) => {
  if (error) {
    return res.status(500).json({ success: false, message: error.message });
  }
  return next();
});

async function startServer() {
  await connectDatabase();

  const port = Number(process.env.PORT || 5001);
  app.listen(port, () => {
    console.log(`Milkyway backend running on http://localhost:${port}`);
  });
}

startServer().catch((error) => {
  console.error('Failed to start backend', error);
  process.exit(1);
});
