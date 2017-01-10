class Entry
	# We use attribute accessor to make these attribute readable and changeable for other files.
	attr_accessor :name, :phone_number, :email
	# We initialize the class passing in the 3 attributes.
	def initialize(name, phone_number, email)
		@name = name
    @phone_number = phone_number
    @email = email
  end

  def to_s
     "Name: #{name}\nPhone Number: #{phone_number}\nEmail: #{email}"
   end
   
end