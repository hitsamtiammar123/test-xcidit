module.exports = {
  development: {
    username: 'postgres',
    password: "123456789",
    database: "fatbellies-xcidic",
    host: "127.0.0.1",
    dialect: "postgres"
  },
  test: {
    "username": "root",
    "password": null,
    "database": "database_test",
    "host": "127.0.0.1",
    "dialect": "postgres"
  },
  "production": {
    "username": "wqqqsscdfdppey",
    "password": "ffacd8437e6fb7b65971124bfd59c842d17f888d9104468bfd1e554b11af8264",
    "database": "d4h0qvtvtp2rje",
    "host": "ec2-35-171-171-27.compute-1.amazonaws.com",
    "dialect": "postgres",
    "port": 5432,
    "dialectOptions": {
      "ssl": {
        require: true,
        rejectUnauthorized: false
      }
    }
  }
};
