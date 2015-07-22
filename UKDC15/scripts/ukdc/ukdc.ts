﻿/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../typings/angularjs/angular-route.d.ts" />
/// <reference path="../typings/moment/moment.d.ts" />
"use strict";

module UKDC {
    "use strict";
    export interface IStyle { name: string, rgb: string; }
    var Styles: IStyle[] = [
        { name: "Salsa On1", rgb: "170,255,170" },
        { name: "Salsa On2", rgb: "68,170,255" }
    ];
    export module Build {
        export interface IWorkshop { artist: string; title: string; level: string; }
        export interface ISlot { style: string; split: boolean; workshops: IWorkshop[]; }
        export interface ITime { time: string; slots: ISlot[]; }
        export interface IRoom { name: string; }
        export interface IDate { date: Date; rooms: IRoom[]; times: ITime[]; }
        export interface ITimetable { dates: IDate[]; }
        export interface IScope { timetable: ITimetable; }
        export class Controller {
            static $inject: string[] = ["$scope", "$window", "$modal"];
            private $currentDate: IDate = undefined;
            public isCurrentDate = (date: IDate) => { return this.$currentDate === date; }
            public setCurrentDate = (date: IDate) => { this.$currentDate = date; }
            constructor(
                private $scope: IScope,
                private $window: angular.IWindowService,
                private $modal: angular.ui.bootstrap.IModalService) {
                this.$scope.timetable = angular.fromJson(this.$window.localStorage.getItem("timetable")) || { dates: [] };
                if (this.$scope.timetable.dates.length > 0) { this.setCurrentDate(this.$scope.timetable.dates[0]); }
            }
            private $datepicker: boolean = false;
            public datepicker = ($event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                this.$datepicker = true;
            }
            public save = () => {
                this.$window.localStorage.setItem("timetable", angular.toJson(this.$scope.timetable));
            }
            public addDate = ($event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var date: IDate = { date: null, rooms: [], times: [] };
                this.$scope.timetable.dates.push(date);
                this.setCurrentDate(date);
            }
            public removeDate = (date: IDate) => {
                var i: number = this.$scope.timetable.dates.indexOf(date);
                if (i >= 0) { this.$scope.timetable.dates.splice(i, 1); }
            }
            public addRoom = (date: IDate, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var i: number = date.rooms.length + 1;
                date.rooms.push({ name: "Room " + String(i) });
                angular.forEach(date.times, (item: ITime) => {
                    item.slots.push({ style: null, split: false, workshops: [] });
                });
            }
            public moveRoomLeft = (date: IDate, room: IRoom, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var i: number = date.rooms.indexOf(room);
                if (i >= 0) {
                    var temp: IRoom = date.rooms[i - 1];
                    date.rooms[i - 1] = date.rooms[i];
                    date.rooms[i] = temp;
                    angular.forEach(date.times, (item: ITime) => {
                        var temp: ISlot = item.slots[i - 1];
                        item.slots[i - 1] = item.slots[i];
                        item.slots[i] = temp;
                    });
                }
            }
            public removeRoom = (date: IDate, room: IRoom, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var i: number = date.rooms.indexOf(room);
                if (i >= 0) {
                    date.rooms.splice(i, 1);
                    angular.forEach(date.times, (item: ITime) => {
                        item.slots.splice(i, 1);
                    });
                }
            }
            public addTime = (date: IDate, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var time: ITime = { time: null, slots: [] };
                angular.forEach(date.rooms, (item: IRoom) => {
                    time.slots.push({ style: null, split: false, workshops: [] });
                });
                date.times.push(time);
            }
            public moveTimeUp = (date: IDate, time: ITime, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var i: number = date.times.indexOf(time);
                if (i >= 0) {
                    var temp: ITime = date.times[i - 1];
                    date.times[i - 1] = date.times[i];
                    date.times[i] = temp;
                }
            }
            public removeTime = (date: IDate, time: ITime, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var i: number = date.times.indexOf(time);
                if (i >= 0) { date.times.splice(i, 1); }
            }
            public editSlot = (date: IDate, time: ITime, slot: ISlot, $event: angular.IAngularEvent) => {
                $event.preventDefault();
                $event.stopPropagation();
                var modal: angular.ui.bootstrap.IModalServiceInstance = this.$modal.open({
                    templateUrl: "templates/slot.html",
                    resolve: {
                        date: function () { return date.date; },
                        room: function () { return date.rooms[time.slots.indexOf(slot)].name; },
                        time: function () { return time.time; },
                        slot: function () { return slot; }
                    },
                    controller: Slot.Controller,
                    controllerAs: "ctrl"
                });
            }
        }
    }
    export module Slot {
        export class Controller {
            static $inject: string[] = ["$scope", "$modalInstance", "date", "room", "time", "slot"];
            constructor(
                private $scope: angular.ui.bootstrap.IModalScope,
                private $modalInstance: angular.ui.bootstrap.IModalServiceInstance,
                public date: Date,
                public room: string,
                public time: string,
                public slot: Build.ISlot) { }
            public styles: IStyle[] = Styles;
        }
    }
}

var ukdc = angular.module("ukdc", ["ngRoute", "ui.bootstrap"]);

ukdc.config(["$routeProvider", function ($routeProvider: angular.route.IRouteProvider) {
    $routeProvider
        .when("/home", { caseInsensitiveMatch: true, templateUrl: "views/home.html" })
        .when("/build", {
        caseInsensitiveMatch: true,
        templateUrl: "views/build.html",
        controller: UKDC.Build.Controller,
        controllerAs: "ctrl"
    })
        .otherwise({ redirectTo: "/home" });
}]);