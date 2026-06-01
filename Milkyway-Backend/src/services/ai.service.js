const { GoogleGenerativeAI } = require('@google/generative-ai');
const fs = require('fs');
const path = require('path');

// Initialize Google Generative AI with the secure environment API key
const apiKey = process.env.GEMINI_API_KEY;
const genAI = apiKey ? new GoogleGenerativeAI(apiKey) : null;

/**
 * Converts a local file into the structured Part format required by the Gemini API.
 */
function fileToGenerativePart(filePath, mimeType) {
  return {
    inlineData: {
      data: Buffer.from(fs.readFileSync(filePath)).toString('base64'),
      mimeType,
    },
  };
}

/**
 * Secure Chat Assistant Logic
 * Interacts with gemini-1.5-flash with customized shopping assistant instructions.
 */
async function chatWithAI({ message, history = [] }) {
  if (!genAI) {
    return {
      success: false,
      message: 'Gemini API key is not configured on the server.',
    };
  }

  try {
    const model = genAI.getGenerativeModel({
      model: 'gemini-2.5-flash',
      systemInstruction:
        'You are the Milkyway AI Concierge, a premium, friendly, and ultra-efficient assistant for the Milkyway app (a dairy subscription, utility bill pay, and wallet expense app). ' +
        'Help users coordinate daily milk subscriptions, explain how to pay utility bills in the app, suggest smart saving strategies, and recommend dairy-heavy recipes (kheer, paneer, custom sweets) to utilize extra milk. ' +
        'Be concise, format answers beautifully in markdown, and speak in a highly warm and helpful tone.',
    });

    // Format chat history to match the Gemini API expectation: { role: 'user'|'model', parts: [{ text: '...' }] }
    const formattedHistory = history.map((item) => ({
      role: item.role === 'model' ? 'model' : 'user',
      parts: [{ text: item.text }],
    }));

    const chat = model.startChat({
      history: formattedHistory,
    });

    const result = await chat.sendMessage(message);
    const text = result.response.text();

    return {
      success: true,
      reply: text,
    };
  } catch (error) {
    console.error('Error in chatWithAI:', error);
    return {
      success: false,
      message: error.message,
    };
  }
}

/**
 * Multimodal OCR Utility Bill Scanner
 * Extracts provider, consumer number, and billing amount in pure JSON format.
 */
async function scanUtilityBill({ filePath, mimeType }) {
  if (!genAI) {
    return {
      success: false,
      message: 'Gemini API key is not configured on the server.',
    };
  }

  try {
    // We enforce structured output using gemini-2.5-flash
    const model = genAI.getGenerativeModel({
      model: 'gemini-2.5-flash',
      generationConfig: {
        responseMimeType: 'application/json',
      },
    });

    const prompt =
      'Analyze this utility bill invoice image and extract the key billing attributes. ' +
      'Provide your response as a valid JSON object matching this schema exactly:\n' +
      '{\n' +
      '  "provider": "String representing utility operator name (e.g. DGVCL, Gujarat Gas, Torrent Power, etc.)",\n' +
      '  "customerNo": "String representing consumer/account/customer number",\n' +
      '  "amount": 1250.50, // Float number representing total due amount\n' +
      '  "dueDate": "DD/MM/YYYY string representing payment due date",\n' +
      '  "state": "String representing state name (e.g. Gujarat, Maharashtra, etc.)"\n' +
      '}\n' +
      'If any attribute cannot be confidently located, leave it as an empty string ("") or 0.0 for amount. Do not write any markdown code block indicators in your output.';

    const imagePart = fileToGenerativePart(filePath, mimeType);

    const result = await model.generateContent([prompt, imagePart]);
    const responseText = result.response.text().trim();

    console.log('Gemini Scan Bill Raw Output:', responseText);

    let billData;
    try {
      billData = JSON.parse(responseText);
    } catch (parseError) {
      // Fallback parser in case markdown wrapper is returned despite request
      const jsonRegex = /{[\s\S]*}/;
      const matched = responseText.match(jsonRegex);
      if (matched) {
        billData = JSON.parse(matched[0]);
      } else {
        throw parseError;
      }
    }

    return {
      success: true,
      bill: billData,
    };
  } catch (error) {
    console.error('Error in scanUtilityBill:', error);
    return {
      success: false,
      message: error.message,
    };
  }
}

/**
 * AI Personal Financial Advisor
 * Analyzes transaction histories and outputs smart savings recommendations in JSON.
 */
async function generateAdvisorInsights({ walletSummary, transactions = [], dailyProducts = [] }) {
  if (!genAI) {
    return {
      success: false,
      message: 'Gemini API key is not configured on the server.',
    };
  }

  try {
    const model = genAI.getGenerativeModel({
      model: 'gemini-2.5-flash',
      generationConfig: {
        responseMimeType: 'application/json',
      },
    });

    const prompt =
      `Analyze the following user transaction data from their Milkyway App digital wallet and subscription patterns, then compile custom, high-impact savings recommendations and expense insights.\n\n` +
      `USER ACCOUNT DATA SUMMARY:\n` +
      `- Current Balance: ₹${walletSummary.balance}\n` +
      `- Total Income: ₹${walletSummary.income}\n` +
      `- Total Expenses: ₹${walletSummary.expense}\n\n` +
      `RECENT TRANSACTIONS:\n` +
      `${JSON.stringify(transactions.slice(0, 10), null, 2)}\n\n` +
      `DAILY PRODUCTS SUBSCRIBED:\n` +
      `${JSON.stringify(dailyProducts, null, 2)}\n\n` +
      `Formulate 3 distinct savings tips specifically customized to this user's consumption profile. Return a JSON object matching this schema exactly:\n` +
      `{\n` +
      `  "overallHealth": "A 1-sentence quick assessment of their expense health",\n` +
      `  "projectedDairyExpense": "Estimate of next month's spending on daily essentials",\n` +
      `  "recommendations": [\n` +
      `    {\n` +
      `      "title": "Short title",\n` +
      `      "description": "Engaging actionable details",\n` +
      `      "savingsPotential": "Estimated monthly savings in rupees (e.g. 'Save ₹150')" \n` +
      `    }\n` +
      `  ]\n` +
      `}`;

    const result = await model.generateContent(prompt);
    const responseText = result.response.text().trim();

    let insights;
    try {
      insights = JSON.parse(responseText);
    } catch (parseError) {
      const jsonRegex = /{[\s\S]*}/;
      const matched = responseText.match(jsonRegex);
      if (matched) {
        insights = JSON.parse(matched[0]);
      } else {
        throw parseError;
      }
    }

    return {
      success: true,
      insights,
    };
  } catch (error) {
    console.error('Error in generateAdvisorInsights:', error);
    return {
      success: false,
      message: error.message,
    };
  }
}

module.exports = {
  chatWithAI,
  scanUtilityBill,
  generateAdvisorInsights,
};
