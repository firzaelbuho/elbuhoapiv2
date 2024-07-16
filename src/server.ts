import express from 'express';

import userRoutes from './routes/auth/userRoutes';
import jobRoutes from './routes/rti/jobRoutes';
import characterRoutes from './routes/rti/characterRoutes';
import activityRoutes from './routes/rti/activityRoutes';
import foodRoutes from './routes/rti/foodRoutes';
import goodRoutes from './routes/rti/goodRoutes';

import sequelize from './config/database';


import cors from 'cors';
// Gunakan cors middleware


const app = express();
app.use(cors());
const port = process.env.PORT || 4000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.use('/api/auth/users', userRoutes);

app.use('/api/rti/characters', characterRoutes);
app.use('/api/rti/jobs', jobRoutes);
app.use('/api/rti/activities', activityRoutes);
app.use('/api/rti/foods', foodRoutes);
app.use('/api/rti/goods', goodRoutes);



// Sync database and start server
sequelize.sync().then(() => {
  app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
  });
}).catch((error) => {
  console.error('Unable to connect to the database:', error);
});
