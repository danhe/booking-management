#  Mission Management

# Getting started

1. Clone the project and Change directory to `booking-management`. Install all gems:
```
    $ cd booking-management
    $ bundle install
```
2. Start the web server:
```
    $ rails s
```
# Commits list

1. **Commit 1: First commit**.

    Init the rails project mission management, with api only option

2. **Commit 2: Create Listings**

    Create listing model migration

3. **Commit 3: Create bookings**

    Create booking model migration and add the reference relation with listing

4. **Commit 4: Create reservations**

    Create reservation model migration and add the reference relation with listing

5. **Commit 5: Create missions**

    Create mission model migration and add the reference relation with listing. As mission has different types, I created also subclass like `FirstCheckin.rb` which is a subclass of mission with a type `FirstCheckin`. This will make the missions with different types separate more clearly.

6. **Commit 6: Service to generates missions.**

    According given booking or reservation, we create correspondant missions.

7. **Commit 7: CRUD on listing / bookings / reservations.**

    API for listing, booking and reservations

8. **Commit 8: Mission API**

    We can list all mission of a booking, a reservation or a listing. If there is no parent, it'll list all of missions.

    So there is a `resource :missions` for every model namespace.

9. **Commit 9: generate missions after creating booking and reservation.**

    Add `after_save` method to booking and reservation model to generate missions after every creation.

10. **Commit 10: fill the database from the backend_test.rb**

    Use `rails db:migrate rails db:seed` or `rails db:reset` to create the database, load the schema, and initialize it with the seed data.
