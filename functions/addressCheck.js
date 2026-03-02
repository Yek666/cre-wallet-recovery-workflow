// Chainlink Functions script
// This script validates a blockchain address using an external API

const axios = require("axios");

module.exports = async (request) => {
  const addrToCheck = request.addrToCheck;

  if (!addrToCheck) {
    throw new Error("No address provided");
  }

  try {
    const response = await axios.get(
      `https://api.blockchain.info/rawaddr/${addrToCheck}`
    );

    const data = response.data;

    // Example simple validation
    if (data && data.address) {
      return "Valid Address";
    } else {
      return "Invalid Address";
    }
  } catch (error) {
    return "Address check failed";
  }
};
