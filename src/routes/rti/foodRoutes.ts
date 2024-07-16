import { Router } from 'express';
import { getAllFoods } from '../../controllers/rti/foodController';

const foodRoutes = Router();

foodRoutes.get('/', getAllFoods); // Get All Characters

export default foodRoutes;
