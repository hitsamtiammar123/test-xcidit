const makeErrorResponse = (err, message = 'Internal Server Error') => {
  return { status: 500, message, err };
}

module.exports = {
  makeErrorResponse
}