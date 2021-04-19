class BookmarkManager
  # this is a CLASS INSTANCE variable
  @list = ["https://www.bbc.co.uk/news","https://www.google.com/","https://www.codewars.com/dashboard"]

  # this is a GETTER method for the CLASS INSTANCE VARIABLE (@list)
  # attr_reader is only an instance variable kind of thing. This getter does a
  # similar thing, but this is the format we need if it's
  # re: a CLASS INSTANCE variable (not an instance variable).

  def self.list_all
    @list
  end

  # def self.abc
  # end

end
