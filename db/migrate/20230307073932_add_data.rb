class AddData < ActiveRecord::Migration[7.0]
  def change
    5.times do |i|
      Author.create(first_name:"auth#{i}",last_name:"david",dob:"07-07-200#{i}",email:"authp#{i}@gmail.com")
    end
    5.times do |i|
      Book.create(name:"Book#{i}",price:i*100,author_id:Author.first.id)
    end
  end
end
