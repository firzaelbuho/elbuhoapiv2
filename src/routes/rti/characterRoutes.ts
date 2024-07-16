import { Router } from 'express';
import { getAllCharacters, getCharactersFull } from '../../controllers/rti/characterController';

const characterRoutes = Router();

characterRoutes.get('/', getAllCharacters); // Get All Characters
characterRoutes.get('/full', getCharactersFull); // Get All Chars Full

export default characterRoutes;
