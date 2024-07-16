import { Request, Response } from 'express';
import Good from '../../models/rti/goodModel';


export const getAllGoods = async (req: Request, res: Response): Promise<void> => {
  try {
    const data = await Good.findAll();
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
