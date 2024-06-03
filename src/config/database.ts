import { Sequelize } from 'sequelize';

const sequelize = new Sequelize('elbuhoapi', 'root', '', {
  host: 'localhost',
  dialect: 'mysql', // atau 'mariadb' jika Anda menggunakan MariaDB
});

export default sequelize;
