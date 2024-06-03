import express from 'express';

// , createUser, updateUser, deleteUser
import { getAllUsers, getUserById } from '../controllers/userController';

const router = express.Router();

// Routes
router.get('/users', getAllUsers);
router.get('/users/:id', getUserById);
// router.post('/users', createUser);
// router.put('/users/:id', updateUser);
// router.patch('/users/:id', updateUser);
// router.delete('/users/:id', deleteUser);

export default router;
