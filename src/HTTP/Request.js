var request = require('request');


exports.httpGet = function (url) {
    return function (errorCb) {
        return function (dataCb) {
            return function() {
                request(url, 
                    function (error, response, body) {
                        error ? errorCb(error)() : dataCb(body)()
                    })
            }
        }
    }
}

          


