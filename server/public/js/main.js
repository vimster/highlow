;(function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0](function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i})({1:[function(require,module,exports){
(function() {
  var portfolioCtrl;

  portfolioCtrl = require('./controllers/portfolio-controller.coffee');

  console.log("huhuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu");

  console.log(portfolioCtrl);

}).call(this);


},{"./controllers/portfolio-controller.coffee":2}],2:[function(require,module,exports){
(function() {
  module.exports = function($scope) {
    return $scope.services = [
      {
        name: 'Web Development',
        price: 300,
        active: true
      }, {
        name: 'Design',
        price: 400,
        active: false
      }, {
        name: 'Integration',
        price: 250,
        active: false
      }, {
        name: 'Training',
        price: 220,
        active: false
      }
    ];
  };

}).call(this);


},{}]},{},[1])
//@ sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlcyI6WyJGOlxcZ2l0aHViXFxoaWdobG93XFxjbGllbnRcXGpzXFxhcHAuY29mZmVlIiwiRjpcXGdpdGh1YlxcaGlnaGxvd1xcY2xpZW50XFxqc1xcY29udHJvbGxlcnNcXHBvcnRmb2xpby1jb250cm9sbGVyLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiO0FBQ0E7Q0FBQSxLQUFBLE9BQUE7O0NBQUEsQ0FBQSxDQUFnQixJQUFBLE1BQWhCLDhCQUFnQjs7Q0FBaEIsQ0FDQSxDQUFBLElBQU8sa0NBQVA7O0NBREEsQ0FFQSxDQUFBLElBQU8sTUFBUDtDQUZBOzs7OztBQ0RBO0NBQUEsQ0FBQSxDQUFpQixHQUFYLENBQU4sRUFBa0I7Q0FFVCxFQUFXLEdBQVosRUFBTixHQUFBO09BQ0U7Q0FBQSxDQUNRLEVBQU4sSUFBQSxTQURGO0NBQUEsQ0FFUyxDQUZULEVBRUUsR0FBQTtDQUZGLENBR1MsRUFIVCxFQUdFLEVBQUE7RUFDQSxNQUxjO0NBS2QsQ0FDTSxFQUFOLElBQUE7Q0FEQSxDQUVPLENBRlAsRUFFQSxHQUFBO0NBRkEsQ0FHTyxHQUhQLENBR0EsRUFBQTtFQUNBLE1BVGM7Q0FTZCxDQUNNLEVBQU4sSUFBQSxLQURBO0NBQUEsQ0FFTyxDQUZQLEVBRUEsR0FBQTtDQUZBLENBR08sR0FIUCxDQUdBLEVBQUE7RUFDQSxNQWJjO0NBYWQsQ0FDTSxFQUFOLElBQUEsRUFEQTtDQUFBLENBRU8sQ0FGUCxFQUVBLEdBQUE7Q0FGQSxDQUdPLEdBSFAsQ0FHQSxFQUFBO1FBaEJjO0NBRkg7Q0FBakIsRUFBaUI7Q0FBakIiLCJzb3VyY2VzQ29udGVudCI6WyIjcmVxdWlyZSAnJ1xyXG5wb3J0Zm9saW9DdHJsID0gcmVxdWlyZSAnLi9jb250cm9sbGVycy9wb3J0Zm9saW8tY29udHJvbGxlci5jb2ZmZWUnXHJcbmNvbnNvbGUubG9nIFwiaHVodXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1XCJcclxuY29uc29sZS5sb2cgcG9ydGZvbGlvQ3RybFxyXG4jbG9hZGVyLmdldFN0b2NrSW5mbyBcIkdPT0dcIiwgNywgKGRhdGEpIC0+XHJcbiMgIGNvbnNvbGUuZGVidWcgZGF0YVxyXG4jaGlnaExvdyA9IGFuZ3VsYXIubW9kdWxlIFwiaGlnaExvd1wiLCBbXVxyXG4jY29uc29sZS5kZWJ1ZyBcImh1aHVcIlxyXG4iLCJtb2R1bGUuZXhwb3J0cyA9ICgkc2NvcGUpIC0+XHJcblxyXG4gICRzY29wZS5zZXJ2aWNlcyA9IFtcclxuICAgIHtcclxuICAgICAgbmFtZTogJ1dlYiBEZXZlbG9wbWVudCcsXHJcbiAgICAgIHByaWNlOiAzMDAsXHJcbiAgICAgIGFjdGl2ZTp0cnVlXHJcbiAgICB9LHtcclxuICAgICAgbmFtZTogJ0Rlc2lnbicsXHJcbiAgICAgIHByaWNlOiA0MDAsXHJcbiAgICAgIGFjdGl2ZTpmYWxzZVxyXG4gICAgfSx7XHJcbiAgICAgIG5hbWU6ICdJbnRlZ3JhdGlvbicsXHJcbiAgICAgIHByaWNlOiAyNTAsXHJcbiAgICAgIGFjdGl2ZTpmYWxzZVxyXG4gICAgfSx7XHJcbiAgICAgIG5hbWU6ICdUcmFpbmluZycsXHJcbiAgICAgIHByaWNlOiAyMjAsXHJcbiAgICAgIGFjdGl2ZTpmYWxzZVxyXG4gICAgfVxyXG4gIF07XHJcbiJdfQ==
;