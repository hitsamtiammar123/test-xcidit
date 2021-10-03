'use strict';

const { MealMaster, MealPlan } = require('../models');

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
    const mealmasters = await MealMaster.findAll();
    const mealplan = await MealPlan.findOne();

    const times = [
      {
        starttime: '07:00:00',
        endtime: '12:00:00',
        mealPlanId: mealplan.id,
      },
      {
        starttime: '12:00:00',
        endtime: '16:00:00',
        mealPlanId: mealplan.id,
      },
      {
        starttime: '16:00:00',
        endtime: '21:00:00',
        mealPlanId: mealplan.id,
      },
    ];

    let result = [];

    mealmasters.forEach(master => {
      const newMaster = times.map(time => ({
        price: Math.floor(Math.random() * 50),
        maxcapacity: 20,
        mealMasterId: master.id,
        createdAt: new Date(),
        updatedAt: new Date(),
        ...time,
      }))
      result = result.concat(newMaster);
    });
    await queryInterface.bulkInsert('MealTimes', result)

  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add commands to revert seed here.
     *
     * Example:
     * await queryInterface.bulkDelete('People', null, {});
     */
     await queryInterface.bulkDelete('MealTimes', null, {});
  }
};
