import { Request, Response } from 'express';
import userModel from '../models/userModel';


export const getAllUsers = (req: Request, res: Response): void => {
    const users = userModel.getUsers();
    res.status(200).json({
        success: true,
        message: 'List of users retrieved successfully',
        data: users
    });
};

export const getUserById = (req: Request, res: Response): void => {
    const user = userModel.getUserById(req.params.id);
    if (!user) {
        res.status(404).json({
            success: false,
            message: 'User not found',
            data: {}
        });
    } else {
        res.status(200).json({
            success: true,
            message: 'User retrieved successfully',
            data: user
        });
    }
};

// Implementasi fungsi lainnya (createUser, updateUser, deleteUser)
