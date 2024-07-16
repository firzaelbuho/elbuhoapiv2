import { Router } from 'express';
import { requestPasswordReset, resetPassword,getAllUsers, getUserById, createUser, updateUser, deleteUser, loginUser , sendActivationEmail, activateAccount} from '../../controllers/auth/userController';
import { checkResetToken, checkUsernameAvailability, checkEmailAvailability } from '../../controllers/auth/userController';

const router = Router();

router.get('/', getAllUsers); // Get All User
router.get('/:id', getUserById); // Get User by ID
router.post('/', createUser); // Create new User
router.put('/:id', updateUser); // Update User
router.delete('/:id', deleteUser); // Delete User
router.post('/login', loginUser); // Login

router.post('/send-activation-email', sendActivationEmail);
router.get('/activate/:token', activateAccount);

router.post('/request-password-reset', requestPasswordReset);
router.post('/reset-password/', resetPassword);

router.get('/check-reset-token/:token', checkResetToken);
router.get('/check-username-availability/:username', checkUsernameAvailability);
router.get('/check-email-availability/:email', checkEmailAvailability);

export default router;
