
## Description

This Rails API serves public clinical trial data to the Open-Clinic-API from a postgres database containing a complete record of clinical trials submitted to clinicalTrials.gov as of January 1st, 2017. The underlying database was originally cloned from https://www.ctti-clinicaltrials.org/ and extended to include user authentication and user-owned resources.


## Front End Client for Open-Clinic-Api:
[Open-Clinic-Client](https://github.com/jolavb/open-clinic-client)

## Deployed Heroku End-Point (for studies):
[Open-Clinic-End-Point](https://frozen-mountain-71553.herokuapp.com/studies)


## Technologies Used:
+ Ruby
+ Rails
+ Postgres
+ Grunt

## Future Additions:
The API currently establishes models and relationships for 4 out of 41 available schema tables. Future iterations will include additional relationships and models in order to serve addtional related study information.

## Development Process: 
I intentionally bit off more than I could chew by cloning a large existing database with many tables and relationships from https://www.ctti-clinicaltrials.org/. I have taken small steps and added relationships, models, routes and Controllers for 1 table at a time. I began with the primary table, which all others are related; the studies table. One each route was performing as anticipated, with the correct information serialized, I progressed to the next table. 

## Entity Relationship Diagram:
![ERD](https://i.imgur.com/pAfJgNR.png)


## EndPoints

#### /studies

|Method| Controller Action      | Params          | Description  |
|:---:| :-------------: |:-------------:| :-----:|
|GET| Index      | :phase, :page| Shows studies, paginated by 50 results. If no phase is specified,  returns all studies. |
|GET| Show    | N/A     |   Shows Specific Study by NCT_ID |


#### sponsors

|Method| Controller Action      | Params          | Description  |
| :---:| :-------------: |:-------------:| :-----:|
|GET| Index      | :page | Shows All Sponsors, paginated by 50 results. |
|GET| Show    | :nct_id    |   Shows Specific Sponsor by ID |


#### /responsible_parties

|Method| Controller Action     | Params          | Description  |
| :---:| :-------------: |:-------------:| :-----:|
|GET| Index      | :page | Shows All responsible parties, paginated by 50 results. |
|GET| Show    | :id   |   Shows specific responsible parties by id |

#### /comments

|Method| Controller Action     | Params          | Description  |
| :----:| :-------------: |:-------------:| :-----:|
|GET| Index      | N/A| Shows all user comments|
|GET| Show    | :id  |   Shows specific user comment by comment id |
|POST| Create | :user_id, :nct_id, :text| accepts user id, study id, and text to create new study comment|
|PATCH| Update | :user_id, :nct_id, :text| accepts user id, study id, and text to update existing study comment|
|DELETE| Destroy | :id | comment id and destroys comment|


#### /users

|URL Pattern|Method| Controller Action     | Params  | Description  |
| :---:| :---: | :-------------: |:-------------:| :-----:|
|users/sign-up|POST| signup   | :id  |   creates new user |
|users/sign-in|POST| signin   | :id  |   signs in exisiting user |
|users/change-password|PATCH|changepw|:id| changes user password |
|/users/sign-out/|DELETE| signout  |:id| deletes user session|
|/users|GET| Index  | N/A| Shows all users|
|/users|GET| Show    | :id  |   Shows specific user by id |


## Dependencies:
1.  Install dependencies with `bundle install`.

