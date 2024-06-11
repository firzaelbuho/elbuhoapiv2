import express from 'express';
import userRoutes from './routes/userRoutes';
import sequelize from './config/database';
import User from './models/userModel';

import cors from 'cors';
// Gunakan cors middleware


const app = express();
app.use(cors());
const port = process.env.PORT || 4000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/api/users', userRoutes);

// Sync database and start server
sequelize.sync().then(() => {
  app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
  });
}).catch((error) => {
  console.error('Unable to connect to the database:', error);
});
