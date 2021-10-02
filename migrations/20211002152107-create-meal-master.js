'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('MealMasters', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      maxcapacity: {
        type: Sequelize.INTEGER
      },
      price: {
        type: Sequelize.DECIMAL
      },
      day: {
        type: Sequelize.ENUM('monday','tuesday','wednesday','thursday','friday','saturday','sunday')
      },
      starttime: {
        type: Sequelize.TIME
      },
      endtime: {
        type: Sequelize.TIME
      },
      branchId: {
        type: Sequelize.INTEGER
      },
      mealMasterId: {
        type: Sequelize.INTEGER,
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('MealMasters');
  }
};