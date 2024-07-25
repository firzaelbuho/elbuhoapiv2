import { Router } from 'express';
import { getAllCharacters, getCharactersFull, getAllCharactersById, getCharactersFullById} from '../../controllers/rti/characterController';

const characterRoutes = Router();

characterRoutes.get('/', getAllCharacters); // Get All Characters
characterRoutes.get('/full', getCharactersFull); // Get All Chars Full
characterRoutes.get('/full/:id', getCharactersFullById); // Get All Chars Full

characterRoutes.get('/:id', getAllCharactersById); // Get All Chars Full

export default characterRoutes;
