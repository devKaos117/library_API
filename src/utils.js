/*
*           Basic utilites for the aplication
*/
export {returnData, log};
/*
*           Returning data in a standard JSON
*/
function returnData(r, d = null) {
    return {method: r.method, protocol: r.protocol, client: r.ip, uri: r.originalUrl, params: r.params,data: d}
}
/*
*           Loggin function
*/
function log(d, l = 1) {
//
}