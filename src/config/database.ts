import { Sequelize } from 'sequelize';
import dotenv from 'dotenv';

dotenv.config();
const isDevelopment = process.env.IS_DEVELOPMENT == "true";


const databaseName = isDevelopment? "elbuhoapi" :"elbuhoa2_elbuhoapi";
const userName = isDevelopment? "root" : "elbuhomy_elbuho";
const password = isDevelopment? "" : "apidroid1315";
const host = isDevelopment? "localhost" : "www.elbuho.my.id";
const dialect =  "mysql"; // atau 'mariadb' jika Anda menggunakan MariaDB

const sequelize = new Sequelize(databaseName, userName, password, {
  host: host,
  dialect: dialect, 
});

export default sequelize;
