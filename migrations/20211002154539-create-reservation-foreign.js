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
        queryInterface.addConstraint('Reservations', {
          fields: ['mealmasterid'],
          type: 'foreign key',
          name: 'mealmasterid_foreign_key',
          references: {
            table: 'MealMasters',
            field: 'id',
          },
          onDelete: 'cascade',
          onUpdate: 'cascade'
        }),
        queryInterface.addConstraint('Reservations', {
          fields: ['userid'],
          type: 'foreign key',
          name: 'userid_foreign_key',
          references: {
            table: 'Users',
            field: 'id',
          },
          onDelete: 'cascade',
          onUpdate: 'cascade'
        }),
      ]);
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
        queryInterface.removeConstraint('Reservations', 'mealmasterid_foreign_key'),
        queryInterface.removeConstraint('Reservations', 'userid_foreign_key')
      ]);
    })
  }
};
