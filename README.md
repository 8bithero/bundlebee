Codename: BundleBee
=========

## Getting The Authentication token
In order for users to begin verifying themselves with an authentication token they will first need to provide their login credentials (email & password).

Login credentials will need to be sent as parameters to the backend server via:

> **POST** /api/v1/login

*Note: You may pass 'email' and 'password' as either request parameters or as URL parameters.*

It is also required to add **Content-Type** as **x-www-form-urlencoded** to the header.

Upon successful authentication a JSON responce - similar to the example below - will be sent back.

    {
        "success": true,
        "auth_token": "pvCXnuWhfPYkD4iDQp3",
        "email": "foo@bar.com"
    }




## Retreiving a list of all Apps
> **GET** /api/v1/apps

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



- - -
- - - 
## User's Sandbox
The user's sandbox is the collection of Apps that the user has added to his account.
All sandbox methods are user specific and so all methods require an authentication token to be sent as a parameter.

### Get a list of all Apps added to a user's sandbox 
> **GET** /api/v1/sandbox?token=token-value-goes-here

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
> **POST** /api/v1/add_to_sandbox/:app_id

*Note: You may pass 'token' as either a request parameter or as a URL parameter.*

**Example return data**

A **successful** response will return a **201** status code and a hash with the following:
    
    {
      "success": true,
      "message": "App-name-goes-here was successfully added to your Sandbox."
    }



### Remove App from Sandbox 
> **DELETE** /api/v1/remove_from_sandbox/:app_id

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


**App exist in sandbox** - response **200** status code and a hash with:

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

- - -
- - - 
## Developers: Adding new Apps to database

> *Note: Currently only working for Google Play.*

### The Process
1. Developers send their bundle_id to BundleBee and the data is pulled from Google Play and sent back to BundleBee mobile app.
2. Developers should be shown the the returned data to ensure it is correct.
3. In order to Add their app to our database a CREATE request will need to be sent back.
  
#### 1 & 2) Retrieving data from Google Play
> **GET** /api/v1/get_android_app_data?bundle_id=:bundle_id

**Example Usage**

    http://bundlbee.herokuapp.com/api/v1/get_android_app_data?bundle_id=com.blyts.greedyspiders2

    **Returns**
    {
      "name": "Greedy Spiders 2",
      "developer": "Blyts",
      "icon_url": "https://lh3.ggpht.com/-y2tDmR1aKEYsOPtvkNMFhdg_m0032BcgSniu_ymDzoE9cHw_UD46XUgz-Tc1rD2kq4=w124",
      "description": "Spiders are back!! More evil, creepy and greedy than ever...",
      "rating": 4
    }

*Note: The rating returned currently uses float - return values are rounded up/down. Will be changed in next release.*

#### 3) Adding app to BundleBee Database
**Available Parameters**
* **bundle_id** - (ID of App as it appears on GooglePlay - Entered by Developer)
* **name** - (Name of Application - i.e. 'Greedy Spiders 2' - pulled from GooglePlay)
* **description** - (Description of app - pulled from GooglePlay)
* **icon_url** - (URL to App icon hosted on GooglePlay - pulled from GooglePlay)
* **points** - (The point value (or tokens) that this app is worth - specified by developer - must be in range: 0 < x < 11.)

> **POST** /api/v1/get_android_app_data?token=:auth_token  
> Additional parameters that can be sent are listed above

**Example Usage**

    > **POST** http://bundlebee.herokuapp.com/api/v1/add_app_to_db

    **Parameters passed:**
      * token: q7gAazqx738aDcGeVcbT
      * bundle_id: com.blyts.greedyspiders2
      * name: Greedy Spiders 2
      * icon_url: https://lh3.ggpht.com/-y2tDmR1aKEYsOPtvkNMFhdg_m0032BcgSniu_ymDzoE9cHw_UD46XUgz-Tc1rD2kq4=w124
      * description: Spiders are back!! More evil, creepy and greedy than ever.
      * rating: 4
      * points: 2


- - -
- - - 
## List of HTTP status response codes that will appear

### Error codes that may appear
* 401 - Unauthorized | Will appear when token is incorrect or user does not have access.
* 404 - Record not found | Send when a record/resource cannot be found - may be sent as http or json.
* 409 - Conflict | Will be sent when record already exists - i.e. trying to add item to sandbox that already exists.
* 500 - Internal Server Error | The generic error that will be sent.


### Success codes that may appear
* 200 - Ok
* 201 - Created | When you resource has successfully been added - i.e. added item to sandbox.