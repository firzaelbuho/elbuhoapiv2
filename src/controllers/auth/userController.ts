import { Request, Response } from 'express';
import User from '../../models/auth/userModel';
import { generateToken } from '../../middlewares/authMiddleware';
import bcrypt from 'bcrypt';
import nodemailer from 'nodemailer';
import crypto from 'crypto';
import { Op } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();

const baseUrl = process.env.BASE_URL;
const appName = "ElbuhoAPI"

const handleError = (res: Response, error: any) => {
  const errorMessage = error instanceof Error ? error.message : 'Unknown error occurred';
  res.status(500).json({
    success: false,
    message: 'An error occurred',
    error: errorMessage,
    details: error.errors ? error.errors.map((err: any) => err.message) : undefined,
  });
};

// Setup Nodemailer transporter
const transporter = nodemailer.createTransport({
  service: 'Gmail',
  auth: {
    user: 'elbuho1315@gmail.com',
    pass: 'cmnw hige hrmz vpbj',
  },
});

// request password reset
export const requestPasswordReset = async (req: Request, res: Response) => {
  try {
    const { email } = req.body;
    const user = await User.findOne({ where: { email } });

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'User not found',
      });
    }

    const resetToken = crypto.randomBytes(20).toString('hex');
    user.resetPasswordToken = resetToken;
    user.resetPasswordExpires = new Date(Date.now() + 3600000); // 1 hour from now
    await user.save();

    const resetUrl = `${baseUrl}/api/reset-password/${resetToken}`;
    const mailOptions = {
      from: appName,
      to: user.email,
      subject: appName+' - Password Reset',
      text: `Please click the following link to reset your password: ${resetUrl}`,
    };

    await transporter.sendMail(mailOptions);

    res.status(200).json({
      success: true,
      message: 'Password reset email sent',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};

export const resetPassword = async (req: Request, res: Response) => {
  try {
    const { token } = req.body;
    const { newPassword } = req.body;
    const user = await User.findOne({
      where: {
        resetPasswordToken: token,
        resetPasswordExpires: { [Op.gt]: new Date() },
      },
    });

    if (!user) {
      return res.status(400).json({
        success: false,
        message: 'Invalid or expired password reset token',
      });
    }

    const hashedPassword = await bcrypt.hash(newPassword, 10);
    user.password = hashedPassword;
    user.resetPasswordToken = null;
    user.resetPasswordExpires = null;
    await user.save();

    res.status(200).json({
      success: true,
      message: 'Password reset successfully',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};

// send Activation Email
export const sendActivationEmail = async (req: Request, res: Response) => {
  try {
    const { email } = req.body;
    const user = await User.findOne({ where: { email } });

    if (!user) {
      return res.status(404).json({
        success: false,
        message: 'User not found',
      });
    }

    const activationToken = crypto.randomBytes(20).toString('hex');
    user.activationToken = activationToken;
    await user.save();

    const activationUrl = `${baseUrl}/api/activate/${activationToken}`;
    const mailOptions = {
      from: appName,
      to: user.email,
      subject: appName+' - Account Activation',
      text: `Please click the following link to activate your account: ${activationUrl}`,
    };

    await transporter.sendMail(mailOptions);

    res.status(200).json({
      success: true,
      message: `Activation email sent`,
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};

// activate user
export const activateAccount = async (req: Request, res: Response) => {
  try {
    const { token } = req.params;
    const user = await User.findOne({ where: { activationToken: token } });

    if (!user) {
      return res.status(400).json({
        success: false,
        message: 'Invalid activation token',
      });
    }

    user.emailVerified = true;
    user.activationToken = null;
    await user.save();

    res.status(200).json({
      success: true,
      message: 'Account activated successfully',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
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

    const token = generateToken(user.userId,user.username);
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
        const { username, password, firstName, lastName } = req.body;
    
        const user = await User.findByPk(userId);
        if (!user) {
          return res.status(404).json({
            success: false,
            message: 'User not found',
          });
        }
    
        user.username = username;
        user.password = password; // Password akan di-hash oleh hook `beforeUpdate`
        user.firstName = firstName;
        user.lastName = lastName;
    
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


// Check reset token validity
export const checkResetToken = async (req: Request, res: Response) => {
  try {
    const { token } = req.params;
    const user = await User.findOne({
      where: {
        resetPasswordToken: token,
        resetPasswordExpires: { [Op.gt]: new Date() },
      },
    });

    if (!user) {
      return res.status(400).json({
        success: false,
        message: 'Invalid or expired password reset token',
      });
    }

    res.status(200).json({
      success: true,
      message: 'Valid password reset token',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};

// Check UsernameAvailability

export const checkUsernameAvailability = async (req: Request, res: Response) => {
  try {
    const { username } = req.params;
    const user = await User.findOne({ where: { username } });

    if (user) {
      return res.status(400).json({
        success: false,
        message: 'Username is already taken',
      });
    }

    res.status(200).json({
      success: true,
      message: 'Username is available',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};

// check EmailAvaliabilty


export const checkEmailAvailability = async (req: Request, res: Response) => {
  try {
    const { email } = req.params;
    const user = await User.findOne({ where: { email } });

    if (user) {
      return res.status(400).json({
        success: false,
        message: 'Email is already taken',
      });
    }

    res.status(200).json({
      success: true,
      message: 'Email is available',
    });
  } catch (error:any) {
    res.status(500).json({
      success: false,
      message: 'An error occurred',
      error: error.message,
    });
  }
};