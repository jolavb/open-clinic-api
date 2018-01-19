
Description

This Rails API serves public clinical trial data to the Open-Clinic-API from a postgres database containing a complete record of clinical trials submitted to clinicalTrials.gov as of January 1st, 2017. The underlying database was originally cloned from https://www.ctti-clinicaltrials.org/ and extended to include user authentication and user-owned resources.


Front End Client for Open-Clinic-Api:
[Open-Clinic-Client](https://github.com/jolavb/open-clinic-client)

Deployed Heroku End-Point (for studies):
[Open-Clinic-End-Point](https://frozen-mountain-71553.herokuapp.com/studies)


Technologies Used:
-Ruby
-Rails
-Postgres
-Grunt

Future Additions:
The API currently establishes models and relationships for 4 out of 15 schema tables. Future iterations will include additional relationships and models in order to serve addtional related study information.

Developemnt Process: 
I intentionally bit off more than I could chew by cloning a large existing database with many tables and relationships from https://www.ctti-clinicaltrials.org/. I have taken small steps and added relationships, models, routes and Controllers for 1 table at a time. I began with the primary table, which all others are related; the studies table. One each route was performing as anticipated, with the correct information serialized, I progressed to the next table. 

WireFrames:

