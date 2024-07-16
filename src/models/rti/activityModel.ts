import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from '../../config/database';

interface ActivityAttributes {
  activityId: number;
  activityName: string;

}

interface ActivityCreationAttributes extends Optional<ActivityAttributes, 'activityId'> {}

class Activity extends Model<ActivityAttributes, ActivityCreationAttributes> implements ActivityAttributes {
  public activityId!: number;
  public activityName!: string;

}

Activity.init(
  {
    activityId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    activityName: {
      type: DataTypes.STRING,
      allowNull: false,
    }
    
    
  },
  {
    sequelize,
    tableName: 'Activities',
  }
);

export default Activity;
