codename: bundlebee
=========

BundleBee is build with a REST architecture, where resources follow the CRUD (Create Read Update Delete) paradim.
This means almost all resources have the following actions/methods available:
* **Index**: Shows all instances of a resource (url: /apps ) -> via: GET
* **Show**: Shows a single instance of a resource (url: /apps/:id ) -> via: GET
* **New/Create**: Creates a new instance of a resource (url: /apps/new ) -> via: POST
* **Update**: Edits a single instance of a resource (url: /apps/:id/edit ) -> via: UPDATE
* **Destroy**: Shows all instances of a resource (url: /apps ) -> via: DELETE

## Getting The Authentication token
In order for users to begin verifying themselves with an authentication token they will first need to provide their login credentials (email & password).

Login credentials will need to be sent as parameters to the backend server via a POST request to:
http://www.my-url-here.com/api/v1/users/sign_in

It is also required to add 'Content-Type' as 'x-www-form-urlencoded' to the header.

Upon successful authentication a JSON responce - similar to the example below - will be sent back.

    {
        "success": true,
        "auth_token": "pvCXnuWhfPYkD4iDQp3",
        "email": "foo@bar.com"
    }


## Retreiving a list of all Apps
http://www.my-url-here.com/api/v1/