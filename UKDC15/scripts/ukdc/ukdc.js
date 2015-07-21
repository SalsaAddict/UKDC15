/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../typings/angularjs/angular-route.d.ts" />
"use strict";
var UKDC;
(function (UKDC) {
    "use strict";
    var Build;
    (function (Build) {
        var Controller = (function () {
            function Controller($scope, $window) {
                var _this = this;
                this.$scope = $scope;
                this.$window = $window;
                this.currentDate = undefined;
                this.save = function () {
                    _this.$window.localStorage.setItem("Timetable", angular.toJson(_this.$scope.Timetable));
                };
                this.isCurrentDate = function (item) {
                    return (_this.currentDate === item);
                };
                this.setCurrentDate = function (item) {
                    _this.currentDate = item;
                };
                this.addDate = function () {
                    var d = { Date: undefined, Rooms: [], Times: [] };
                    _this.$scope.Timetable.Dates.push(d);
                    _this.currentDate = d;
                };
                this.datePickerIsOpen = false;
                this.toggleDatePicker = function ($event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    _this.datePickerIsOpen = !_this.datePickerIsOpen;
                };
                this.addRoom = function () {
                    if (angular.isUndefined(_this.currentDate)) {
                        return;
                    }
                    _this.currentDate.Rooms.push({ Name: "Room " + (_this.currentDate.Rooms.length + 1) });
                    angular.forEach(_this.currentDate.Times, function (item) {
                        item.Slots.push({ Style: undefined, Levels: 1, Workshops: [] });
                    });
                };
                this.removeRoom = function (Room) {
                    var i = _this.currentDate.Rooms.indexOf(Room);
                    if (i >= 0) {
                        _this.currentDate.Rooms.splice(i, 1);
                        angular.forEach(_this.currentDate.Times, function (item) {
                            item.Slots.splice(i, 1);
                        });
                    }
                };
                this.addTime = function () {
                    if (angular.isUndefined(_this.currentDate)) {
                        return;
                    }
                    var t = {
                        Time: undefined,
                        Slots: []
                    };
                    angular.forEach(_this.currentDate.Rooms, function (item) {
                        t.Slots.push({ Style: undefined, Levels: 1, Workshops: [] });
                    });
                    _this.currentDate.Times.push(t);
                };
                this.$scope.Timetable = angular.fromJson(this.$window.localStorage.getItem("Timetable")) || { Dates: [] };
                if (this.$scope.Timetable.Dates.length > 0) {
                    this.currentDate = this.$scope.Timetable.Dates[0];
                }
            }
            Controller.$inject = ["$scope", "$window"];
            return Controller;
        })();
        Build.Controller = Controller;
    })(Build = UKDC.Build || (UKDC.Build = {}));
})(UKDC || (UKDC = {}));
var ukdc = angular.module("ukdc", ["ngRoute", "ui.bootstrap"]);
ukdc.config(["$routeProvider", function ($routeProvider) {
        $routeProvider
            .when("/home", { caseInsensitiveMatch: true, templateUrl: "views/home.html" })
            .when("/build", {
            caseInsensitiveMatch: true,
            templateUrl: "views/build.html",
            controller: UKDC.Build.Controller,
            controllerAs: "build"
        })
            .otherwise({ redirectTo: "/home" });
    }]);
//# sourceMappingURL=ukdc.js.map