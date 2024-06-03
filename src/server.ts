import express, { Application, Request, Response } from 'express';
import userRoutes from './routes/userRoutes';

const app: Application = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Routes
app.use('/api', userRoutes);

// Error handling middleware
app.use((err: Error, req: Request, res: Response) => {
    console.error(err.stack);
    res.status(500).json({
        success: false,
        message: 'Internal server error',
        data: {}
    });
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
