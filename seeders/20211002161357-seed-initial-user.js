'use strict';

const bcrypt = require('bcryptjs');

module.exports = {
  up: async (queryInterface, Sequelize) => {

     await queryInterface.bulkInsert('Users', [{
        email: 'admin@admin.com',
        role: 'admin',
        name: 'Admin Fatbellies',
        password: await bcrypt.hash('password123', 10),
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        email: 'user@gmail.com',
        role: 'user',
        name: 'Hitsam Tiammar',
        password: await bcrypt.hash('password123', 10),
        createdAt: new Date(),
        updatedAt: new Date()
      }
      ]);
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
    await queryInterface.bulkDelete('Users', null, {});
  }
};
