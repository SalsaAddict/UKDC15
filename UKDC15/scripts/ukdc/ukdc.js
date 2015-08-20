/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="../typings/angularjs/angular-route.d.ts" />
/// <reference path="../typings/moment/moment.d.ts" />
"use strict";
var UKDC;
(function (UKDC) {
    "use strict";
    var Styles = {
        "Salsa On1": { rgb: "170,255,170" },
        "Salsa On2": { rgb: "68,170,255" }
    };
    var Build;
    (function (Build) {
        var Controller = (function () {
            function Controller($scope, $window, $modal) {
                var _this = this;
                this.$scope = $scope;
                this.$window = $window;
                this.$modal = $modal;
                this.$currentDate = undefined;
                this.isCurrentDate = function (date) { return _this.$currentDate === date; };
                this.setCurrentDate = function (date) { _this.$currentDate = date; };
                this.$datepicker = false;
                this.datepicker = function ($event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    _this.$datepicker = true;
                };
                this.save = function () {
                    _this.$window.localStorage.setItem("timetable", angular.toJson(_this.$scope.timetable));
                };
                this.addDate = function ($event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var date = { date: null, rooms: [], times: [] };
                    _this.$scope.timetable.dates.push(date);
                    _this.setCurrentDate(date);
                };
                this.removeDate = function (date) {
                    var i = _this.$scope.timetable.dates.indexOf(date);
                    if (i >= 0) {
                        _this.$scope.timetable.dates.splice(i, 1);
                    }
                };
                this.addRoom = function (date, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var i = date.rooms.length + 1;
                    date.rooms.push({ name: "Room " + String(i) });
                    angular.forEach(date.times, function (item) {
                        item.slots.push({ style: null, split: false, workshops: [] });
                    });
                };
                this.moveRoomLeft = function (date, room, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var i = date.rooms.indexOf(room);
                    if (i >= 0) {
                        var temp = date.rooms[i - 1];
                        date.rooms[i - 1] = date.rooms[i];
                        date.rooms[i] = temp;
                        angular.forEach(date.times, function (item) {
                            var temp = item.slots[i - 1];
                            item.slots[i - 1] = item.slots[i];
                            item.slots[i] = temp;
                        });
                    }
                };
                this.removeRoom = function (date, room, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var i = date.rooms.indexOf(room);
                    if (i >= 0) {
                        date.rooms.splice(i, 1);
                        angular.forEach(date.times, function (item) {
                            item.slots.splice(i, 1);
                        });
                    }
                };
                this.addTime = function (date, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var time = { time: null, slots: [] };
                    angular.forEach(date.rooms, function (item) {
                        time.slots.push({ style: null, split: false, workshops: [] });
                    });
                    date.times.push(time);
                };
                this.moveTimeUp = function (date, time, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var i = date.times.indexOf(time);
                    if (i >= 0) {
                        var temp = date.times[i - 1];
                        date.times[i - 1] = date.times[i];
                        date.times[i] = temp;
                    }
                };
                this.removeTime = function (date, time, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var i = date.times.indexOf(time);
                    if (i >= 0) {
                        date.times.splice(i, 1);
                    }
                };
                this.editSlot = function (date, time, slot, $event) {
                    $event.preventDefault();
                    $event.stopPropagation();
                    var modal = _this.$modal.open({
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
                };
                this.slotStyle = function (slot) {
                    if (!slot.style) {
                        return;
                    }
                    return "background-color: rgb(" + Styles[slot.style].rgb + ");";
                };
                this.$scope.timetable = angular.fromJson(this.$window.localStorage.getItem("timetable")) || { dates: [] };
                if (this.$scope.timetable.dates.length > 0) {
                    this.setCurrentDate(this.$scope.timetable.dates[0]);
                }
            }
            Controller.$inject = ["$scope", "$window", "$modal"];
            return Controller;
        })();
        Build.Controller = Controller;
    })(Build = UKDC.Build || (UKDC.Build = {}));
    var Slot;
    (function (Slot) {
        var Controller = (function () {
            function Controller($scope, $modalInstance, date, room, time, slot) {
                var _this = this;
                this.$scope = $scope;
                this.$modalInstance = $modalInstance;
                this.date = date;
                this.room = room;
                this.time = time;
                this.slot = slot;
                this.styles = Styles;
                $scope.$watchCollection(function () { return { style: _this.slot.style, split: _this.slot.split }; }, function (newValue, oldValue) {
                    if (newValue !== oldValue) {
                        if (_this.slot.style) {
                            if (_this.slot.workshops.length === 0) {
                                _this.slot.workshops.push({ artist: null, title: null, level: null });
                            }
                            if (_this.slot.split) {
                                if (_this.slot.workshops.length === 1) {
                                    _this.slot.workshops.push({ artist: null, title: null, level: null });
                                }
                            }
                            else {
                                if (_this.slot.workshops.length > 1) {
                                    _this.slot.workshops.splice(1);
                                }
                            }
                            if (_this.slot.workshops.length > 2) {
                                _this.slot.workshops.splice(2);
                            }
                        }
                        else {
                            _this.slot.split = false;
                            if (_this.slot.workshops.length > 0) {
                                _this.slot.workshops.splice(0);
                            }
                        }
                    }
                });
            }
            Controller.$inject = ["$scope", "$modalInstance", "date", "room", "time", "slot"];
            return Controller;
        })();
        Slot.Controller = Controller;
    })(Slot = UKDC.Slot || (UKDC.Slot = {}));
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
            .when("/home", { caseInsensitiveMatch: true, templateUrl: "views/home.html" })
            .when("/build", {
            caseInsensitiveMatch: true,
            templateUrl: "views/build.html",
            controller: UKDC.Build.Controller,
            controllerAs: "ctrl"
        })
            .when("/timetable/:EventId?", {
            caseInsensitiveMatch: true,
            templateUrl: "views/timetable.html",
            controller: UKDC.Timetable.Controller,
            controllerAs: "ctrl"
        })
            .otherwise({ redirectTo: "/home" });
    }]);
//# sourceMappingURL=ukdc.js.map