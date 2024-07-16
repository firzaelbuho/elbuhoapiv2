import { Request, Response } from 'express';
import Food from '../../models/rti/foodModel';


export const getAllFoods = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await Food.findAll();
    res.status(200).json({
      success: true,
      message: 'Jobs retrieved successfully',
      data,
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to retrieve characters',
      error: error.message,
    });
  }
};
