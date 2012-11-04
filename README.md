Codename: BundleBee
=========

    **Please ignore the content of this block. It is currently not accurate.** 
    BundleBee is build with a REST architecture, where resources follow the CRUD (Create Read Update Delete) paradim.
    This means almost all resources have the following actions/methods available:
    * **Index**: Shows all instances of a resource (url: /apps ) -> via: GET
    * **Show**: Shows a single instance of a resource (url: /apps/:id ) -> via: GET
    * **New/Create**: Creates a new instance of a resource (url: /apps/new ) -> via: POST
    * **Update**: Edits a single instance of a resource (url: /apps/:id/edit ) -> via: UPDATE
    * **Destroy**: Shows all instances of a resource (url: /apps ) -> via: DELETE

## Getting The Authentication token
In order for users to begin verifying themselves with an authentication token they will first need to provide their login credentials (email & password).

Login credentials will need to be sent as parameters to the backend server via:

**POST** /api/v1/login

*Note: You may pass 'email' and 'password' as either request parameters or as URL parameters.*

It is also required to add **Content-Type** as **x-www-form-urlencoded** to the header.

Upon successful authentication a JSON responce - similar to the example below - will be sent back.

    {
        "success": true,
        "auth_token": "pvCXnuWhfPYkD4iDQp3",
        "email": "foo@bar.com"
    }




## Retreiving a list of all Apps
**GET** /api/v1/apps

*Note: May need to append .json to request (i.e. /api/v1/apps.json)*

This will give you a complete list off all Apps available on the system.
No authentication token is required. This list can be viewed by anyone, including non-logged in users.

**Example return data**

A **successful** response will return an array of hashes containing the individual App's parameters.

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




## User's Sandbox
The user's sandbox is the collection of Apps that the user has added to his account.
All sandbox methods are user specific and so all methods require an authentication token to be sent as a parameter.

### Get a list of all Apps added to a user's sandbox 
**GET** /api/v1/sandbox?token=token-value-goes-here

*Note: May need to append .json to request (i.e. /api/v1/sandbox.json?token=token-value-goes-here)*

**Example return data**

A **successful** response will return an array of hashes containing the individual App's parameters.
    
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




### Add App to Sandbox 
**POST** /api/v1/add_to_sandbox/:app_id

*Note: You may pass 'token' as either a request parameter or as a URL parameter.*

**Example return data**

A **successful** response will return a **201** status code and a hash with the following:
    
    {
      "success": true,
      "message": "App-name-goes-here was successfully added to your Sandbox."
    }



### Remove App from Sandbox 
**DELETE** /api/v1/remove_from_sandbox/:app_id

*Note: You may pass 'token' as either a request parameter or as a URL parameter.*

**Example return data**

A **successful** delete will return a **200** status code and a hash with the following:
    
    {
      "success": true,
      "message": "App was successfully removed from your Sandbox."
    }


### Check app exists in Sandbox 
**GET** /api/v1/has_app/:app_id?token=token-value-goes-here

**Example return data**


**App exist in sandbox** - response **200** status code and a hash with a:
    {
      "bundle_id": "com.rovio.angry_birds",
      "created_at": "2012-11-03T21:21:20Z",
      "developer_id": null,
      "id": 1,
      "name": "Angry Birds",
      "updated_at": "2012-11-03T21:21:20Z"
    }


**App DOES NOT exist in sandbox** - response **404** status code and a hash with the following:
    {
      "success": false,
      "message": "The App you were looking for could not be found in your Sandbox"
    }



## List of HTTP status response codes that will appear

### Error codes that may appear
* 401 - Unauthorized | Will appear when token is incorrect or user does not have access.
* 404 - Record not found | Send when a record/resource cannot be found - may be sent as http or json.
* 409 - Conflict | Will be sent when record already exists - i.e. trying to add item to sandbox that already exists.
* 500 - Internal Server Error | The generic error that will be sent.


### Success codes that may appear
* 200 - Ok
* 201 - Created | When you resource has successfully been added - i.e. added item to sandbox.