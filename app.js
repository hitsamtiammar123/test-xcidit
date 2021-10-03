require('dotenv').config();
const express = require('express');
const cors = require('cors');
const path = require('path');
const { errorHandler } = require('./middleware');
const {
  branch,
  user,
  mealplan,
  mealmaster,
  mealtime,
  reservation,
  mealExtra,
  auth,
} = require('./routes');
const app = express();

app.use(express.json());
app.use(express.static(path.join(__dirname,'public')));
app.use(cors());

app.get('/', (req,res) => {
  res.send('Hello this is main page');
})

app.use('/', auth);
app.use('/user', user);
app.use('/branch', branch);
app.use('/mealplan', mealplan);
app.use('/mealmaster', mealmaster);
app.use('/mealtime', mealtime);
app.use('/reservation', reservation);
app.use('/mealextra', mealExtra);

app.use(errorHandler);


app.listen(process.env.PORT || 3020, () => {
  console.log('Server listening')
})

