class MyCallbacks
  def after_initialize(record)
    puts 'Hi i am callback after initialize'
  end

  def after_find(record)
    puts 'Hi i am callback after find'
  end

  def before_create(record)
    puts 'Hi i am callback before create.'
  end

  def after_create(record)
    puts 'Hi i am callback after create.'
    puts 'Email Validated!'
  end

  def before_update(record)
    puts 'Hi i am callback before update'
  end

  def after_update(record)
    puts 'Hi i am callback after update'
  end

  def before_destroy(record)
    puts 'Hi i am callback before destroy'
  end

  def after_destroy(record)
    puts 'Hi i am callback after destroy'
  end

  def after_touch(record)
    puts 'Hi i am callback after touch'
  end

end
