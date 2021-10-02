'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     */
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.addConstraint('MealMasters', {
          fields: ['branchId'],
          type: 'foreign key',
          name: 'branchId_foreign_key',
          references: {
            table: 'Branches',
            field: 'id',
          },
          onDelete: 'cascade',
          onUpdate: 'cascade'
        }),
        queryInterface.addConstraint('MealMasters',{
          fields: ['mealMasterId'],
          type: 'foreign key',
          name: 'mealMasterId_foreign_key',
          references: {
            table: 'MealMasters',
            field: 'id',
          },
          onDelete: 'cascade',
          onUpdate: 'cascade'
        })
      ])
    })

  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    return queryInterface.sequelize.transaction(t => {
      return Promise.all([
        queryInterface.removeConstraint('MealMasters', 'branchId_foreign_key'),
        queryInterface.removeConstraint('MealMasters', 'mealMasterId_foreign_key')
      ])
    })
  }
};
