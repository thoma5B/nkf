(function () {
    'use strict';

    angular.module('nkfApp').controller('BudgetController', BudgetController);

    BudgetController.$inject = ['$state', 'importedData'];

    function BudgetController($state, importedData) {
        /* jshint validthis: true */
        var vm = this;
        vm.importedData = importedData.data;
        //vm.notesCollapsed = true;
        //vm.navigate = navigate;
        vm.activate = activate;

        vm.gridOptions = {
            data: 'vm.importedData',
            enableGridMenu: true,
            enableSorting: true,
            enableFiltering: true,
            // showTreeExpandNoChildren: false, // This should suppress + sign for leaves.
            columnDefs: [
                {field: 'gkz', displayName: 'Kennzahl', width: '*'},
                {field: 'prodgr', displayName: 'Produktgruppe', visible: true, width: '*'},
                {field: 'account', displayName: 'Konto', width: '*'},
                {field: 'year', displayName: 'Jahr', width: '*'},
                {field: 'value', displayName: 'Betrag', cellFilter: 'currency', cellClass: 'grid-align-right'}
            ]

            //importerDataAddCallback: function (grid, newObjects) {
            //    vm.importedData = vm.importedData.concat(newObjects);
            //}
        };

        activate();

        ////////////////

        function activate() {
            // console.log('current state data', $state.current.data);
        }

        //function navigate(){
        //    $state.go('home');
        //}

    }
})();