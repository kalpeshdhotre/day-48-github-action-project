const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'ok',
    service: 'github-actions-capstone',
    timestamp: new Date().toISOString(),
  });
});

app.get('/', (req, res) => {
  res.send('GitHub Actions Capstone App — Day 48 of #90DaysOfDevOps');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;
// Test Change
