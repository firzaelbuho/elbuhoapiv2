import { Request, Response } from 'express';
import Job from '../../models/rti/jobModel';

export const getAllJobs = async (req: Request, res: Response): Promise<void> => {
  try {
    const characters = await Job.findAll();
    res.status(200).json({
      success: true,
      message: 'Jobs retrieved successfully',
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
