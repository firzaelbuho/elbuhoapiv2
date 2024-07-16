import { Request, Response } from 'express';
import Character from '../../models/rti/characterModel';


import Job from '../../models/rti/jobModel';
import Activity from '../../models/rti/activityModel';
import Good from '../../models/rti/goodModel';
import Food from '../../models/rti/foodModel';
import Relative from '../../models/rti/relativeModel';

export const getAllCharacters = async (req: Request, res: Response): Promise<void> => {
  try {
    const characters = await Character.findAll();
    res.status(200).json({
      success: true,
      message: 'Characters retrieved successfully',
      data: characters,
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to retrieve characters',
      error: error.message,
    });
  }
};

export const getCharactersFull = async (req: Request, res: Response) => {
    try {
      const characters = await Character.findAll({
        include: [
          {
            model: Job,
            as: 'jobs',
            through: { attributes: [] },
          },
          {
            model: Activity,
            as: 'LikedActivities',
            through: { attributes: [] },
          },
          {
            model: Good,
            as: 'LikedGoods',
            through: { attributes: [] },
          },
          {
            model: Food,
            as: 'LikedFoods',
            through: { attributes: [] },
          },
          {
            model: Activity,
            as: 'DislikedActivities',
            through: { attributes: [] },
          },
          {
            model: Good,
            as: 'DislikedGoods',
            through: { attributes: [] },
          },
          {
            model: Food,
            as: 'DislikedFoods',
            through: { attributes: [] },
          },
          {
            model: Character,
            as: 'RelativeCharacters',
            through: { attributes: ['relativeStatus'] },
          },
          {
            model: Character,
            as: 'RelativesOf',
            through: { attributes: ['relativeStatus'] },
          },
        ],
      });
      
      const result = remaps(characters)
      res.status(200).json({
        success: true,
        message: 'Characters retrieved successfully',
        data: result
      });
     
    } catch (error) {
      res.status(500).json({ message: 'Server Error', error });
    }


    function remaps(characters:Character[]){
      const result = characters.map((character: any) => {
        return {
          charId: character.charId,
          fullName: character.fullName,
          nickname: character.nickname,
          birthday: character.birthday,
          age: character.age,
          gender: character.gender,
          origin: character.origin,
          jobs: character.jobs,
          isDateAble: character.isDateAble,
          description: character.description,
          likes: {
            activities: character.LikedActivities,
            goods: character.LikedGoods,
            foods: character.LikedFoods,
          },
          dislikes: {
            activities: character.DislikedActivities,
            goods: character.DislikedGoods,
            foods: character.DislikedFoods,
          },

          relatives: [
            ...character.RelativeCharacters.map((relative: any) => ({
              charId: relative.charId,
              fullName: relative.fullName,
              relative: relative.Relatives,
            })),
            // ...character.RelativesOf.map((relative: any) => ({
            //   charId: relative.charId,
            //   fullName: relative.fullName,
            //   relativeStatus: relative.RelativesOf.relativeStatus,
            // })),
          ],
        };
      });

      return result;
    }
  };