# Omits .rb -> it's ok.
# Later on we'll use require instead of require_relative to load external dependencies.
require_relative '../models/entry'

# Describes the Rspec test, it tests the Entry class.
RSpec.describe Entry do
  # We start out by testing the attributes in the Entry class. Saying "describe what do the attributes do"
	 describe "attributes" do
    # Each 'it' method represents a unique test. In each case we test to a different attribute, by creating a new object in the spot and testing it.
     it "responds to name" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      # The expect method is used to finish off each unique test case. There can be one or more expectations for the test. 
       expect(entry).to respond_to(:name)
     end

     it "responds to phone number" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to(:phone_number)
     end
 
     it "responds to email" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expect(entry).to respond_to(:email)
     end
   end

end

## Start at Entry Initializer