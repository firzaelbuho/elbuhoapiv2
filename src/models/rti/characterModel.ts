import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from '../../config/database';

import Job from './jobModel';
import Activity from './activityModel';
import Good from './goodModel';
import Food from './foodModel';
import Relative from './relativeModel';

// Define the Character attributes
interface CharacterAttributes {
  charId: number;
  fullName: string;
  nickname?: string;
  birthday?: string;
  age?: number;
  gender?: string;
  origin?: string;
  isDateAble?: boolean;
  description?: string;
}

// Optional fields for creation
interface CharacterCreationAttributes extends Optional<CharacterAttributes, 'charId'> {}

// Define the Character model
class Character extends Model<CharacterAttributes, CharacterCreationAttributes> implements CharacterAttributes {
  public charId!: number;
  public fullName!: string;
  public nickname?: string;
  public birthday?: string;
  public age?: number;
  public gender?: string;
  public origin?: string;
  public isDateAble?: boolean;
  public description?: string;
}

Character.init(
  {
    charId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    fullName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    nickname: {
      type: DataTypes.STRING,
    },
    birthday: {
      type: DataTypes.STRING,
    },
    age: {
      type: DataTypes.INTEGER,
    },
    gender: {
      type: DataTypes.STRING,
    },
    origin: {
      type: DataTypes.STRING,
    },
    isDateAble: {
      type: DataTypes.BOOLEAN,
    },
    description: {
      type: DataTypes.TEXT,
    },
  },
  {
    sequelize,
    tableName: 'Characters',
  }
);

// Define relations
Character.belongsToMany(Job, { as: 'jobs',through: 'CharacterJobs', foreignKey: 'charId', otherKey: 'jobId' });
Character.belongsToMany(Activity, { as: 'LikedActivities', through: 'LikesActivities', foreignKey: 'charId', otherKey: 'activityId' });
Character.belongsToMany(Good, { as: 'LikedGoods', through: 'LikesGoods', foreignKey: 'charId', otherKey: 'goodId' });
Character.belongsToMany(Food, { as: 'LikedFoods', through: 'LikesFoods', foreignKey: 'charId', otherKey: 'foodId' });
Character.belongsToMany(Activity, { as: 'DislikedActivities', through: 'DislikesActivities', foreignKey: 'charId', otherKey: 'activityId' });
Character.belongsToMany(Good, { as: 'DislikedGoods', through: 'DislikesGoods', foreignKey: 'charId', otherKey: 'goodId' });
Character.belongsToMany(Food, { as: 'DislikedFoods', through: 'DislikesFoods', foreignKey: 'charId', otherKey: 'foodId' });
Character.belongsToMany(Character, { as: 'RelativeCharacters', through: 'Relatives', foreignKey: 'charId', otherKey: 'relativeCharId' });
Character.belongsToMany(Character, { as: 'RelativesOf', through: 'Relatives', foreignKey: 'relativeCharId', otherKey: 'charId' });


export default Character;
