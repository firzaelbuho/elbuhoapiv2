import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from '../../config/database';

interface FoodAttributes {
  foodId: number;
  foodName: string;

}

interface FoodCreationAttributes extends Optional<FoodAttributes, 'foodId'> {}

class Food extends Model<FoodAttributes, FoodCreationAttributes> implements FoodAttributes {
  public foodId!: number;
  public foodName!: string;

}

Food.init(
  {
    foodId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    foodName: {
      type: DataTypes.STRING,
      allowNull: false,
    }
  },
  {
    sequelize,
    tableName: 'Foods',
  }
);

export default Food;
