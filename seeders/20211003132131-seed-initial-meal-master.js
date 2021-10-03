'use strict';

const { Branch } = require('../models');
const days = ['monday','tuesday','wednesday','thursday','friday','saturday','sunday'];
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
    const branches = await Branch.findAll();
    // console.log({ b: branches.map(b => b.toJSON())})
    let result = [];
    branches.forEach((b) => {
      const listMasterData = days.map(day => ({
        day: day,
        branchId: b.id,
        createdAt: new Date(),
        updatedAt: new Date()
      }));
      result = result.concat(listMasterData);
    })
    await queryInterface.bulkInsert('MealMasters', result)
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('MealMasters', null, {});
  }
};
