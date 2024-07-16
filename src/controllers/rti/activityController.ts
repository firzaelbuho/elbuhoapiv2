import { Request, Response } from 'express';
import Activity from '../../models/rti/activityModel';


export const getAllActivities = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await Activity.findAll();
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
