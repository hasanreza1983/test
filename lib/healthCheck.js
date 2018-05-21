const { database } = require('./../config');
const sequelize = require('./../models').sequelize;

const readiness = async (req, res) => {
    const result = { Status: 'Red', Services: {} };
    result.Services = await checkMysqlConnection();
    if (result.Services.Mysql === 'OK') {
        result.Status = 'Green';
        res.status(200).json(result);
    }
    else {
        res.status(500).json(result);
    }
}
const checkMysqlConnection = async () => {
    const result = { Mysql: { Status: 'Failed' } };
    try {
        if (database.name && database.username && database.password && database.options.host) {
            const response = await sequelize.authenticate();
            result.Mysql.Status = 'OK'
            return result;
        }
        result.Mysql.Message = 'Invalid Mysql config found';
        return result;
    }
    catch (err) {
        result.Mysql.Message = 'Error while connecting to Mysql server';
        return result;
    }
}
const liveness = (req, res) => {
    res.sendStatus(200);
}
module.exports = {
    readiness,
    liveness
};