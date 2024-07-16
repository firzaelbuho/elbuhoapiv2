import { Router } from 'express';
import { getAllActivities } from '../../controllers/rti/activityController';

const activityRoutes = Router();

activityRoutes.get('/', getAllActivities); // Get All Characters

export default activityRoutes;
