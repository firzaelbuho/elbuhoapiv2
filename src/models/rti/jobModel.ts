import { DataTypes, Model, Optional } from 'sequelize';
import sequelize from '../../config/database';

interface JobAttributes {
  jobId: number;
  jobName: string;
  
}

interface JobCreationAttributes extends Optional<JobAttributes, 'jobId'> {}

class Job extends Model<JobAttributes, JobCreationAttributes> implements JobAttributes {
  public jobId!: number;
  public jobName!: string;

}

Job.init(
  {
    jobId: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    jobName: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    
  },
  {
    sequelize,
    tableName: 'Jobs',
  }
);

export default Job;
