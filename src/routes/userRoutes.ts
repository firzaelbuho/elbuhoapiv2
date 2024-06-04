import { Router } from 'express';
import { getAllUsers, getUserById, createUser, updateUser, deleteUser, loginUser } from '../controllers/userController';

const router = Router();

router.get('/', getAllUsers);
router.get('/:id', getUserById);
router.post('/', createUser);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);
router.post('/login', loginUser); // Endpoint login

export default router;
