  # spec/requests/contact_forms.rb
  require 'rails_helper'

  describe "ContactForm" do
    it "delivers a valid message" do
      visit "/contacts/new"
      fill_in 'name', :with => 'Aaron Sumner'
      fill_in 'email', :with => 'aaron@everydayrails.com'
      fill_in 'question', :with => 'What a great website.'
      click_button 'Send message'
      page.body.should have_content('Thank you for your message')
      last_email.to.should include('help@everydayrails.com')
      last_email.from.should include('aaron@everydayrails.com')
    end

    it "does not deliver a message with a missing email" do
      visit "/contacts/new"
      fill_in 'name', :with => 'Aaron Sumner'
      fill_in 'email', :with => 'What a great website.'
      click_button 'Send message'
      page.body.should have_content("Email can't be blank")
      last_email.should be_nil
    end

    it "does not deliver spam" do
      pending "This does not appear to render the proper source but passes in a browser."
      visit "/contacts/new"
      fill_in 'name', :with => 'Aaron Sumner'
      fill_in 'email', :with => 'spammer@spammyjunk.com'
      fill_in 'question', :with => "All the junk you'll never need."
      click_button 'Send message'
      page.body.should have_content('this message appears to be spam')
      last_email.should be_nil
    end
  end