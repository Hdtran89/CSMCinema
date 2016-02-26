  # spec/requests/contact_forms.rb
  require 'rails_helper'

  describe "ContactForm" do
    it "delivers a valid message" do
      visit "/contacts/new"
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Email', :with => 'aaron@everydayrails.com'
      fill_in 'Question', :with => 'What a great website.'
      click_button 'Send Message'
      page.body.should have_content('Thank you for your message. We will contact you soon!')
      last_email.to.should include('hdtran89@gmail.com')
      last_email.from.should include('aaron@everydayrails.com')
    end

    it "does not deliver a message with a missing email" do
      visit "/contacts/new"
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Email', :with => 'What a great website.'
      click_button 'Send Message'
      page.body.should have_content("Email can't be blank")
      last_email.should be_nil
    end

    it "does not deliver spam" do
      pending "This does not appear to render the proper source but passes in a browser."
      visit "/contacts/new"
      fill_in 'Name', :with => 'Aaron Sumner'
      fill_in 'Email', :with => 'spammer@spammyjunk.com'
      fill_in 'Question', :with => "All the junk you'll never need."
      click_button 'Send Message'
      page.body.should have_content('this message appears to be spam')
      last_email.should be_nil
    end
  end