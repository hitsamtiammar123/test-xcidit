require('dotenv').config();
const express = require('express');
const cors=require('cors');
const app = express();

app.use(express.json())
app.use(cors());

app.get('/', (req,res) => {
  res.send('Hello this is main page');
})

app.listen(process.env.PORT || 3020, () => {
  console.log('Server listening')
})

