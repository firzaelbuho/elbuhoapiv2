import { Router } from 'express';
import { getAllJobs } from '../../controllers/rti/jobController';

const jobRoutes = Router();

jobRoutes.get('/', getAllJobs); // Get All Characters

export default jobRoutes;
