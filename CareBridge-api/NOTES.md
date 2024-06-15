# BRAINSTORM

### Rate Limit

-   [ ] Rate limit Authentication for doctor/patient requests to the api [10 request/1 min].
-   [ ] Rate limit patient number of request to the api [100 request/1 min].
-   [ ] Rate limit Doctors number of request to the api [500 request/1 min]..
-   [ ] Rate limit Admin number of request to the api [1000 request/1 min]..

### Pagination

-   [ ] Paginate the Get All Requests to limit = 10.

### Authentication

-   [ ] if the Patient has been disabled(deleted his account), he shouldn't be able to login or by any means have access to the application resources.
-   [ ] Logout should clear cookies and tokens on the server while client also does the same thing.

# Dependencies:

---

## Appointment

Filter appointmets by schedult date(dtateSpecified), limit appointments to 10 at a time Search appointment

## Doctors

## Filter doctors by service, fullname limit doctors to 10 at a time Search doctors

---

# PRESCRIPTION

make the prisma schema be as: A prescription is written by one doctor for one patient, and it may contain a list of drugs. However, a patient can have multiple prescriptions, a doctor can write
multiple prescriptions, and a drug can be prescribed in multiple prescriptions.


FETCH QUERY SAMEPLE
http://localhost:1337/api/v1/appointments?page=1&pageSize=10&sort=createdAt&order=desc