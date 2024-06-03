import { Request, Response } from 'express';
import User from '../models/userModel';

// Get all users
export const getAllUsers = async (req: Request, res: Response) => {
  try {
    const users = await User.findAll();
    res.status(200).json({
      success: true,
      message: 'List of users retrieved successfully',
      data: users,
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to retrieve users',
      error: error.message,
    });
  }
};

// Get user by ID
export const getUserById = async (req: Request, res: Response) => {
  try {
    const user = await User.findByPk(req.params.id);
    if (user) {
      res.status(200).json({
        success: true,
        message: 'User retrieved successfully',
        data: user,
      });
    } else {
      res.status(404).json({
        success: false,
        message: 'User not found',
      });
    }
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to retrieve user',
      error: error.message,
    });
  }
};

// Create a new user
export const createUser = async (req: Request, res: Response) => {
  try {
    const user = await User.create(req.body);
    res.status(201).json({
      success: true,
      message: 'User created successfully',
      data: user,
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to create user',
      error: error.message,
    });
  }
};

// Update user by ID
export const updateUser = async (req: Request, res: Response) => {
  try {
    const [updated] = await User.update(req.body, {
      where: { userId: req.params.id }
    });
    if (updated) {
      const updatedUser = await User.findByPk(req.params.id);
      res.status(200).json({
        success: true,
        message: 'User updated successfully',
        data: updatedUser,
      });
    } else {
      res.status(404).json({
        success: false,
        message: 'User not found',
      });
    }
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to update user',
      error: error.message,
    });
  }
};

// Delete user by ID
export const deleteUser = async (req: Request, res: Response) => {
  try {
    const deleted = await User.destroy({
      where: { userId: req.params.id }
    });
    if (deleted) {
      res.status(200).json({
        success: true,
        message: 'User deleted successfully',
      });
    } else {
      res.status(404).json({
        success: false,
        message: 'User not found',
      });
    }
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'Failed to delete user',
      error: error.message,
    });
  }
};
