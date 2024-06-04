// src/middleware/authMiddleware.ts
import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

const secret = 'elbuhoapi'; // Gantilah dengan secret key Anda

export const generateToken = (idUser: number, username: string, fullName: string) => {
    return jwt.sign({ idUser, username, fullName }, secret, { expiresIn: '1h' });
};

// export const verifyToken = (req: Request, res: Response, next: NextFunction) => {
//   const token = req.headers['authorization']?.split(' ')[1];

//   if (!token) {
//     return res.status(401).json({
//       success: false,
//       message: 'No token provided',
//     });
//   }

//   try {
//     const decoded = jwt.verify(token, secret);
//     req.userId = (decoded as any).userId;
//     next();
//   } catch (err) {
//     return res.status(401).json({
//       success: false,
//       message: 'Failed to authenticate token',
//     });
//   }
// };
