import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from '../../config/database';

interface GoodAttributes {
  goodId: number;
  goodName: string;

}

interface GoodCreationAttributes extends Optional<GoodAttributes, 'goodId'> {}

class Good extends Model<GoodAttributes, GoodCreationAttributes> implements GoodAttributes {
  public goodId!: number;
  public goodName!: string;

}

Good.init(
  {
    goodId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    goodName: {
      type: DataTypes.STRING,
      allowNull: false,
    }
   
    
  },
  {
    sequelize,
    tableName: 'Goods',
  }
);

export default Good;
