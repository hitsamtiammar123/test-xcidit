'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add seed commands here.
     *
     * Example:
     * await queryInterface.bulkInsert('People', [{
     *   name: 'John Doe',
     *   isBetaMember: false
     * }], {});
    */
     await queryInterface.bulkInsert('Branches', [
      {
        name: 'Branch A',
        latitude: 2.001010,
        longitude: 1.23431,
        openinghours: '09:00',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'Branch B',
        latitude: 2.001010,
        longitude: 1.23431,
        openinghours: '09:00',
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        name: 'Branch C',
        latitude: 2.001010,
        longitude: 1.23431,
        openinghours: '09:00',
        createdAt: new Date(),
        updatedAt: new Date()
      },
    ])
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('Branches', null, {});
  }
};
