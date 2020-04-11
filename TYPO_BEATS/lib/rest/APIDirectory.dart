/*
 * This file has all the rest urls for http request
 *  @author - Ruban Moses
 */
/*
 * local host settings
 */
// String scheme = apiConfig['scheme'];
// String host = apiConfig['host'];
// String port = apiConfig['port'];
// String mobileHost = apiConfig['mobilePort'];
const scheme = 'http';
const host = 'localhost';
const port = '4000';
const mobileHost = '10.0.2.2';
/*
 * prod host settings
 */
// const scheme = 'http';

// const host='api.exathought.com';

// const port ='80';

const baseUrl = '$scheme://$host:$port';
const mobileBaseUrl = '$scheme://$mobileHost:$port';

// getCompanies() {
//   return '$mobileBaseUrl/companies';
// }

// getCompanyById(companyId) {
//   return getCompanies() + '/$companyId';
// }

// getDiscussions() {
//   return '$mobileBaseUrl/discussions';
// }

// getDiscussionsByUserId(userId) {
//   return getDiscussions() + '/$userId';
// }

getAllUser() {
  return '$mobileBaseUrl/users';
}

getUserById(userId) {
  return getAllUser() + '/$userId';
}

getAllDiscussions(userId) {
  return getUserById(userId) + '/discussions';
}

getAllAudience(userId) {
  return getUserById(userId) + '/groups';
}
