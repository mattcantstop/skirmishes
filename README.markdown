# README

##### About This Documentation
Big Skirmish follows the pattern outlined by Tom Preston-Warner in his article about the advantages of [README Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html). The application is first outlined in the README file. During the writing of the Readme the assumptions of the application are tested and vetted. After the README file seems accurate tests are written and then code follows the tests.

##### About BigSkirmish.com

Big Skirmish is the one tool you need to track your progress in just about anything. Big Skirmish excels in tracking personal goals and keeping tabs on any competition you have with someone else or yourself. Track how many your ping pong battle with your coworker, the days you have worked out this month, if you or your wife does the dishes more or even the game of H-O-R-S-E you play with your niece. With BigSkirmish tracking anything important to you is easy.

Below is a quick overview of the BigSkirmish architecture:

* `Users` - standard `user` in a web application.
* `Wars` - The competition you have with yourself of other `users`.
* `Battles` - Each "win" during the competition is counted as a `battle` (you may have won the `battle`, but you didn't win the `war`!).
* `Participant` - a `user` involved in a `war`.
* Follower - a `user` who follows a `war`.
* Session - must be acquired to make authentication requests after
  passing username/email and password.

Below each resource will be outlined, along with its API calls:

## User

### Create User

#### Request

URL Endpoint

```
POST /users/
```

URL Example

```
POST https://api.bigskirmish.com/users/
```

Body Format Example

```json
{
  "user":{
    "first_name":"Walter",
    "last_name":"White",
    "username":"Heisenberg",
    "email":"remembermyname@example.com",
    "is_disabled":false
  }
}
```

Body Required Parameters

Field |  Description
--- |  ---
first_name |  255 character limit
last_name |  255 character limit
username |  Unique identifier for the user
email |  must have standard email characters with an "@" symbol and a period preceded and followed by some other letters

> Any fields described in the [Data Spec](/developer/api/data-spec/users.html) may optionally be included.

## War

### Create War

#### Request

URL Endpoint

```
POST /users/:user_id/wars
```

URL Example

```
POST https://api.bigskirmish.com/users/:user_id/wars
```

Body Format Example

```json
{
  "war":{
    "name":"Pie Eating Contest",
    "has_end":true,
    "ending_date":1394502906,
    "ending_score":50,
    "booty":"Winner gets a whole fat stack of quatloos",
    "is_private":false,
    "open_registration":false,
    "is_disabled":false
  }
}

```

Body Required Parameters

Field |  Description
--- |  ---
name |  A text field describing the competition.
has_end |  Should it go on indefinitely or end a predetermined date or amount of wins? Boolean.
is_private |  Can non-participating users see this war? Boolean.
open_registration |  Can anyone join this competition or must they be invited? Boolean.

> Any fields described in the [Data Spec](/developer/api/data-spec/users.html) may optionally be included.
