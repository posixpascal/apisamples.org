// https://gist.github.com/kemayo/1469241
var throttle = function (callback, delay) {
    var timeout, last_run = 0;
    return function () {
        if (timeout) {
            return;
        }
        var elapsed = (+new Date()) - last_run;
        var context = this;
        var args = arguments;
        var runCallback = function () {
            last_run = +new Date();
            timeout = false;
            callback.apply(context, args);
        };

        if (elapsed >= delay) {
            runCallback();
        } else {
            timeout = setTimeout(runCallback, delay);
        }
    };
}
