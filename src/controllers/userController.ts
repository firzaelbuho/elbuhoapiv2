import { Request, Response } from 'express';
import User from '../models/userModel';
import { generateToken } from '../middlewares/authMiddleware';
import bcrypt from 'bcrypt';

const handleError = (res: Response, error: any) => {
  const errorMessage = error instanceof Error ? error.message : 'Unknown error occurred';
  res.status(500).json({
    success: false,
    message: 'An error occurred',
    error: errorMessage,
    details: error.errors ? error.errors.map((err: any) => err.message) : undefined,
  });
};

// Login and generate jwt token
export const loginUser = async (req: Request, res: Response) => {
  try {
    const { username, password } = req.body;

    const user = await User.findOne({ where: { username } });
    if (!user) {
      return res.status(401).json({
        success: false,
        message: 'Invalid username or password',
      });
    }

    const passwordIsValid = await bcrypt.compare(password, user.password);
    if (!passwordIsValid) {
      return res.status(401).json({
        success: false,
        message: 'Invalid username or password',
      });
    }

    const token = generateToken(user.userId,user.username, user.fullName);
    res.status(200).json({
      success: true,
      message: 'Login successful',
      data: { token },
    });
  } catch (error) {
    handleError(res, error);
  }
};

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
        const userId = req.params.id;
        const { username, password, fullName } = req.body;
    
        const user = await User.findByPk(userId);
        if (!user) {
          return res.status(404).json({
            success: false,
            message: 'User not found',
          });
        }
    
        user.username = username;
        user.password = password; // Password akan di-hash oleh hook `beforeUpdate`
        user.fullName = fullName;
    
        await user.save();
        res.status(200).json({
          success: true,
          message: 'User updated successfully',
          data: user,
        });
      } 
    catch (error:any) {
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
