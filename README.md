
# Active Record Migrations

This branch contains the all practicals of active record migrations. Here I write some of the commands which I used for this practicals. 

### Created Book and Author model 
```
    rails g model Book name:string 'price:decimal{5,2}'
```
```
    rails g model Authors first_name:string last_name:string email:string dob:date
```

###  Added Author Reference to Book
```
    rails g migration AddAuthorRefToBooks author:references
```
### Created Dump of Database
```
    pg_dump -p 5432 db_name>/path/to/file/dump.sql
```
### Created Records in Database
I Created Database Reocrds using two methods using seed.rb file and using migration file.
```
    rails db:seed
```
```
    rails db:migrate
```
