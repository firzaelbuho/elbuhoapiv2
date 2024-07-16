import { DataTypes, Model } from 'sequelize';
import sequelize from '../../config/database';

interface RelativeAttributes {
  charId: number;
  relativeCharId: number;
  relativeStatus: string;

}

class Relative extends Model<RelativeAttributes> implements RelativeAttributes {
  public charId!: number;
  public relativeCharId!: number;
  public relativeStatus!: string;

}

Relative.init(
  {
    charId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    relativeCharId: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    relativeStatus: {
      type: DataTypes.STRING,
      allowNull: false,
    }

  },
  {
    sequelize,
    tableName: 'Relatives',
  }
);

export default Relative;
