# TO DO API

**TO-DO API** is a REST API only aplication using **Ruby on Rails** and **PostgreSQL**. It is an application for managing to-do tasks.

In addition to the basic CRUD functionality of tasks, it has implemented:
- Add a user, logging in and adding user tasks,
- Add task lists and ability to assign tasks to multiple lists
- Ability to customizing a post, by adding a note, setting priority, execution date, adding tags and colors
- Ability to sort tasks by list, priority, tags and color
- Add CRUD subtasks to tasks 
- Add image attachments to tasks
- Add pagination of tasks
- Add daily reminder to schedule yourself for the day

## Installing

### Getting started

Dependencies
To run this project you need to have:

Ruby 2.7.4

Rails 6.1.7

PostgreSQL 13.8

### Setup the project
Clone the project:
``` bash
  $ git clone https://github.com/SzymonB77/To_do_json
```

Enter project folder:
``` bash
  $ cd To_do_json
```

Next, configure your local database in config/database.yml file. Add your database username and password (unless you don't have any).

Install the gems:
``` bash
  $ bundle install
```

Create and seed the database:
``` bash
  $ rails db:create 
  $ rails db:migrate 
  $ rails db:seed
```

### Running the project

Run Rails server:
```bash
$ rails server
```
Open http://localhost:3000

## Examples
Postman example of task in JSON

```json
{
    "id": 61,
    "name": "Make FizzBuzz",
    "note": "make this in Ruby",
    "is_done": false,
    "priority": 2,
    "user_id": 1,
    "execution_date": "2023-10-18",
    "image_url": "http://localhost:3000/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBCZz09IiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--fd4244c40e34231d197aa85ebb5640740581460c/0_LpF0Sh9zk0hscUvw.png",
    "lists": [
        {
            "id": 3,
            "title": "Learn"
            
        }
          {
            "id": 4,
            "title": "Programming"
        }
    ],
    "subtasks": [
        {
            "id": 4,
            "title": "Make Fizz",
            "task_id": 61,
            "created_at": "2022-10-22T17:01:30.180Z",
            "updated_at": "2022-10-22T17:01:30.180Z"
        }
        {
            "id": 5,
            "title": "Make Buzz",
            "task_id": 61,
            "created_at": "2022-10-31T17:59:51.286Z",
            "updated_at": "2022-10-31T17:59:51.286Z"
        }
    ],
    "tag": null,
    "color": "white"
}
```
