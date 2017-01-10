# Omits .rb -> it's ok.
# Later on we'll use require instead of require_relative to load external dependencies.
require_relative '../models/entry'

# Describes the Rspec test, it tests the Entry class.
RSpec.describe Entry do
  # We start out by testing the attributes in the Entry class. Saying "describe what do the attributes do"
	 describe "attributes" do
    ### 'let' allows us to define helper methods and store the values they return.
    # Basically here we create a Ruby symbol (an object that is the same throughout the program) 
    # called :entry to store our hash object created by the Entry class.
    let(:entry) { Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com') }
    # Each 'it' method represents a unique test. In each case we test to a different attribute, 
    # by creating a new object in the spot and testing it.
     it "responds to name" do
      # The expect method is used to finish off each unique test case. 
      # There can be one or more expectations for the test. 
       expect(entry).to respond_to(:name)
     end

     it "reports its name" do
       expect(entry.name).to eq('Ada Lovelace')
     end

     it "responds to phone number" do
       expect(entry).to respond_to(:phone_number)
     end

      it "reports its phone_number" do
       expect(entry.phone_number).to eq('010.012.1815')
     end

     it "responds to email" do
       expect(entry).to respond_to(:email)
     end
     it "reports its email" do
       expect(entry.email).to eq('augusta.king@lovelace.com')
     end
   end
   # Here we are testing out if our instance's to_s method works.
   # By putting a # before the method name we are indicating that it is an instance method.
   describe "#to_s" do
     it "prints an entry as a string" do
       entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
       expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"
       expect(entry.to_s).to eq(expected_string)
     end
   end

end


## Start at Entry Initializer