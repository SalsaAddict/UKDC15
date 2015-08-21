/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../typings/angularjs/angular-route.d.ts" />
/// <reference path="../typings/moment/moment.d.ts" />
"use strict";

module UKDC {
    "use strict";
    export module Timetable {
        export interface IScope extends angular.IScope { Timetable: any; }
        export class Controller {
            static $inject: string[] = ["$scope", "$routeParams", "$http", "$filter"];
            private $currentDate: any = undefined;
            public isCurrentDate = (date: any) => { return this.$currentDate === date; }
            public setCurrentDate = (date: any) => { this.$currentDate = date; }
            constructor(
                private $scope: IScope,
                private $routeParams: angular.route.IRouteParamsService,
                private $http: angular.IHttpService,
                private $filter: angular.IFilterService) {
                this.$scope.Timetable = {};
                this.$http.get("timetable.ashx?EventId=" + (this.$routeParams["EventId"] || 0)).success((data: any) => {
                    this.$scope.Timetable = data;
                    if (angular.isArray(this.$scope.Timetable.Dates)) {
                        if (this.$scope.Timetable.Dates.length > 0) {
                            this.$currentDate = this.$scope.Timetable.Dates[0];
                        }
                    }
                });
            }
            public toggleStyle = (style: any) => {
                style.Enabled = (style.Enabled === "1") ? "0" : "1";
            }
            public workshopCssStyle = (workshop: any) => {
                if (!workshop) { return; }
                if (!workshop.Style) { return; }
                var style: any = this.$filter("filter")(this.$scope.Timetable.Styles, (actual: any) => {
                    return actual.Name === workshop.Style;
                })[0];
                if (style.Enabled === "1") {
                    var level: any = (workshop.Level) ? this.$filter("filter")(this.$scope.Timetable.Levels, (actual: any) => {
                        return actual.Name === workshop.Level;
                    })[0] : { Opacity: 1 };
                    return "background-color: rgba(" + style.RGB + "," + level.Opacity + ")";
                } else {
                    return "background-color: rgba(" + style.RGB + ",0.1); color: #AAA;";
                }
            }
            public eventId = () => { return this.$routeParams["EventId"]; }
        }
    }
}

var ukdc = angular.module("ukdc", ["ngRoute", "ui.bootstrap"]);

ukdc.config(["$routeProvider", function ($routeProvider: angular.route.IRouteProvider) {
    $routeProvider
        .when("/timetable/:EventId", {
        caseInsensitiveMatch: true,
        templateUrl: "views/timetable.html",
        controller: UKDC.Timetable.Controller,
        controllerAs: "ctrl"
    })
        .otherwise({ redirectTo: "/" });
}]);