
# Active Records Basics

## Product Model Created and Updated
Created a Product model using this command
```bash
    rails g model Product name:string price:integer
```
Migrated this Product model to database using this command
```bash
    rails db:migrate
```
Now the table products created in database.Now another column category added to the product model using this command
```bash
    rails g migration add_category_to_products category:string
```
Migration file is created so we again fire this command to apply all migrations to database.
```bash
    rails db:migrate
```

## Basic CRUD Operation on Product model

### CREATE
We can create new record for Product model using this two ways
#### First Way
* Using metohd new and save
```bash
    P = Product.new(name: "Camera",price: 20000,category: "Electronics")
    P.save
```

#### Second way 
* Using method Create
```bash
    P = Product.create(name: "Camera",price: 20000,category: "Electronics")
```

### READ
Here Are some methods for fetching Records

* find 
```bash
    Product.find(3)
```
* find_by
```bash
    Prodcut.find_by(name: "Camera")
```
* where
```bash
    Prodcut.where(name: "Camera",price: 20000)
```
* all
```bash
    Prodcut.all
```
* first
```bash
    Prodcut.first
``` 
* last
```bash
    Prodcut.last
```
### UPDATE
* update
```bash
    Product.first.update(price: 1000)
```
* update_all
```bash
    Product.update_all(category="all")
```
### Delete
* delete
```bash
    Product.first.delete
```
* delete_all
```bash
    Product.delete_all
````
* destroy
```bash
    Product.first.destroy
```
* destroy_all
```bash
    Product.destroy_all
```
## Screenshots
* Database Creation,migration and Product records creation
![Practical1](https://user-images.githubusercontent.com/125335891/222693851-5c49bf2d-3751-422f-9d36-f4e239291d15.png)

* Add Category to Product model
![Practical2](https://user-images.githubusercontent.com/125335891/222694509-ea678798-809b-4e3b-a0fe-6c7437c05f59.png)

* fetching all records from products table
![Practical3](https://user-images.githubusercontent.com/125335891/222694680-5454558b-53b5-4cf0-b1c8-fb766c3ecbd3.png)

* updating all records
![Practical4](https://user-images.githubusercontent.com/125335891/222695753-c22002d0-3abf-403d-9894-43aa313fce0c.png)

* Delete specific product
![Practical5](https://user-images.githubusercontent.com/125335891/222695326-37ce9d3d-e217-490e-a59c-b5421a235be2.png)
