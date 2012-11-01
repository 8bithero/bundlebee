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

It is also required to add **Content-Type** as **x-www-form-urlencoded** to the header.

Upon successful authentication a JSON responce - similar to the example below - will be sent back.

    {
        "success": true,
        "auth_token": "pvCXnuWhfPYkD4iDQp3",
        "email": "foo@bar.com"
    }


## Retreiving a list of all Apps
**GET** http://www.my-url-here.com/api/v1/apps

This will give you a complete list off all Apps available on the system.
No authentication token is required. This list can be viewed by anyone, including non-logged in users.

**Example return data**
A successful response will return an array of hashes containing the individual App's parameters.
    
    [
        {
            "bundle_id": "com.rovio.angry_birds",
            "created_at": "2012-10-26T09:10:19Z",
            "developer_id": null,
            "id": 1,
            "name": "Angry Birds",
            "updated_at": "2012-10-26T09:10:19Z"
        },
        {
            "bundle_id": "com.mobelux.instapaper",
            "created_at": "2012-10-26T09:14:50Z",
            "developer_id": null,
            "id": 2,
            "name": "Instapaper",
            "updated_at": "2012-10-26T09:14:50Z"
        }
    ]


## User Sandbox
The user's sandbox is the collection of Apps that the user has added to his account.
All sandbox methods are user specific and so all methods require an authentication token to be sent as a parameter.

### Get a list of all Apps added to a user's sandbox 
**GET** http://www.my-url-here.com/api/v1/sandbox?token=NQVmFHpsizHSnXDASeys

**Example return data**
A successful response will return an array of hashes containing the individual App's parameters.
    
    [
        {
            "app_id": 1,
            "created_at": "2012-11-01T11:10:56Z",
            "id": 1,
            "updated_at": "2012-11-01T11:10:56Z",
            "user_id": 1
        },
        {
            "app_id": 2,
            "created_at": "2012-11-01T11:13:49Z",
            "id": 2,
            "updated_at": "2012-11-01T11:13:49Z",
            "user_id": 1
        }
    ]