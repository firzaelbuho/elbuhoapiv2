import { Router } from 'express';
import { getAllGoods } from '../../controllers/rti/goodController';

const goodRoutes = Router();

goodRoutes.get('/', getAllGoods); // Get All Characters

export default goodRoutes;
