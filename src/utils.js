/*
*           Basic utilites for the aplication
*/
export {returnData, log};
/**
 * Returns data in a standard JSON
 * @author Gustavo Aragão
 * @github https://github.com/devKaos117/
 *
 * @param {object} r - the 'requisition' object
 * @param {object} [d=null] - the data to be sent to the client
 * @returns {object} {method, protocol, client, uri, params, data}
 */
function returnData(r, d = null) {
    log(null, 1);
    return {method: r.method, protocol: r.protocol, client: r.ip, uri: r.originalUrl, params: r.params,data: d}
}

/**
 * Loggin function
 * @author Gustavo Aragão
 * @github https://github.com/devKaos117/
 * 
 * @param {*} d
 * @param {number} [l=1]
 */
function log(d, l = 1) {
    if (l >= 0) {
        return;
    }
}