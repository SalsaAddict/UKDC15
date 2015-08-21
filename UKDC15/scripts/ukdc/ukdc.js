/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../typings/angularjs/angular-route.d.ts" />
/// <reference path="../typings/moment/moment.d.ts" />
"use strict";
var UKDC;
(function (UKDC) {
    "use strict";
    var Timetable;
    (function (Timetable) {
        var Controller = (function () {
            function Controller($scope, $routeParams, $http, $filter) {
                var _this = this;
                this.$scope = $scope;
                this.$routeParams = $routeParams;
                this.$http = $http;
                this.$filter = $filter;
                this.$currentDate = undefined;
                this.isCurrentDate = function (date) { return _this.$currentDate === date; };
                this.setCurrentDate = function (date) { _this.$currentDate = date; };
                this.toggleStyle = function (style) {
                    style.Enabled = (style.Enabled === "1") ? "0" : "1";
                };
                this.workshopCssStyle = function (workshop) {
                    if (!workshop) {
                        return;
                    }
                    if (!workshop.Style) {
                        return;
                    }
                    var style = _this.$filter("filter")(_this.$scope.Timetable.Styles, function (actual) {
                        return actual.Name === workshop.Style;
                    })[0];
                    if (style.Enabled === "1") {
                        var level = (workshop.Level) ? _this.$filter("filter")(_this.$scope.Timetable.Levels, function (actual) {
                            return actual.Name === workshop.Level;
                        })[0] : { Opacity: 1 };
                        return "background-color: rgba(" + style.RGB + "," + level.Opacity + ")";
                    }
                    else {
                        return "background-color: rgba(" + style.RGB + ",0.1); color: #AAA;";
                    }
                };
                this.eventId = function () { return _this.$routeParams["EventId"]; };
                this.$scope.Timetable = {};
                this.$http.get("timetable.ashx?EventId=" + (this.$routeParams["EventId"] || 0)).success(function (data) {
                    _this.$scope.Timetable = data;
                    if (angular.isArray(_this.$scope.Timetable.Dates)) {
                        if (_this.$scope.Timetable.Dates.length > 0) {
                            _this.$currentDate = _this.$scope.Timetable.Dates[0];
                        }
                    }
                });
            }
            Controller.$inject = ["$scope", "$routeParams", "$http", "$filter"];
            return Controller;
        })();
        Timetable.Controller = Controller;
    })(Timetable = UKDC.Timetable || (UKDC.Timetable = {}));
})(UKDC || (UKDC = {}));
var ukdc = angular.module("ukdc", ["ngRoute", "ui.bootstrap"]);
ukdc.config(["$routeProvider", function ($routeProvider) {
        $routeProvider
            .when("/timetable/:EventId", {
            caseInsensitiveMatch: true,
            templateUrl: "views/timetable.html",
            controller: UKDC.Timetable.Controller,
            controllerAs: "ctrl"
        })
            .otherwise({ redirectTo: "/" });
    }]);
//# sourceMappingURL=ukdc.js.map