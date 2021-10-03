require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { errorHandler } = require('./middleware');
const { branch, user, mealplan, mealmaster } = require('./routes');
const app = express();

app.use(express.json())
app.use(cors());

app.get('/', (req,res) => {
  res.send('Hello this is main page');
})

app.use('/user', user);
app.use('/branch', branch);
app.use('/mealplan', mealplan);
app.use('/mealmaster', mealmaster);

app.use(errorHandler);


app.listen(process.env.PORT || 3020, () => {
  console.log('Server listening')
})

