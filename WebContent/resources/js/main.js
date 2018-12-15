angular.module('myApp', [])
    .controller('addController', function ($scope) {
        $scope.userdata = {};
        $scope.submitForm = function () {
            console.log($scope.userdata);
            if ($scope.addForm.$invalid)
                alert("请检查您的信息");
           
        }
    })
    
    angular.module('orderApp',[])
   .controller('orderController', function ($scope) {
        $scope.userdata = {};
        $scope.submitForm = function () {
            console.log($scope.userdata);
            if ($scope.orderForm.$invalid)
                alert("请检查您的信息");
            
        }
    })
    
     angular.module('cardApp',[])
   .controller('cardController', function ($scope) {
        $scope.userdata = {};
        $scope.submitForm = function () {
            console.log($scope.userdata);
            if ($scope.cardForm.$invalid)
                alert("请检查您的信息");
            
        }
    })
    
     angular.module('crmApp',[])
   .controller('crmController', function ($scope) {
        $scope.userdata = {};
        $scope.submitForm = function () {
            console.log($scope.userdata);
            if ($scope.crmForm.$invalid)
                alert("请检查您的信息");
            
        }
    })
    
    
    