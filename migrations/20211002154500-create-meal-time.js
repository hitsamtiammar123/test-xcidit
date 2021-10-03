'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('MealTimes', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      price: {
        type: Sequelize.DECIMAL
      },
      maxcapacity: {
        type: Sequelize.INTEGER
      },
      starttime: {
        type: Sequelize.TIME
      },
      endtime: {
        type: Sequelize.TIME
      },
      mealMasterId: {
        type: Sequelize.INTEGER,
        references: {
          model: {
            tableName: 'MealMasters',
          },
          key: 'id'
        }
      },
      mealPlanId: {
        type: Sequelize.INTEGER,
        references: {
          model: {
            tableName: 'MealPlans',
          },
          key: 'id'
        }
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('MealTimes');
  }
};