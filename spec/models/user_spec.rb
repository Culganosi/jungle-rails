require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
      
      it 'should contain input for all fields' do
          @user = User.new(
              fname: 'First',
              lname: 'Last',
              email: 'e@email.com',
              password: 'password',
              password_confirmation: 'password'
          )
          expect(@user).to be_valid
      end

      it 'should not be valid without a first name' do
          @user = User.new(
              fname: nil,
              lname: 'Last',
              email: 'e@email.com',
              password: 'password',
              password_confirmation: 'password'
          )
          expect(@user).to_not be_valid
      end

      it 'should not be valid without an email address' do
          @user = User.new(
              fname: 'First',
              lname: 'Last',
              email: nil,
              password: 'password',
              password_confirmation: 'password'
          )
          expect(@user).to_not be_valid
      end

      it 'should not be valid without a password' do
          @user = User.new(
              fname: 'First',
              lname: 'Last',
              email: 'e@email.com',
              password: nil,
              password_confirmation: 'password'
          )
          expect(@user).to_not be_valid
      end


      it 'should not be valid without password confirmation' do
          @user = User.new(
              fname: 'First',
              lname: 'Last',
              email: 'e@email.com',
              password: 'password',
              password_confirmation: nil
          )
          expect(@user).to_not be_valid
      end

      it 'should not be valid if password and password confirmation do not match' do
          @user = User.new(
              fname: 'First',
              lname: 'Last',
              email: 'e@email.com',
              password: 'password',
              password_confirmation: 'notpassword'
          )
          expect(@user).to_not be_valid
      end
  
    describe '.authenticate_with_credentials' do
      it 'authenticate credentials' do
        @user = User.create(
            fname: 'First',
            lname: 'Last',
            email: 'e@email.com',
            password: 'password',
            password_confirmation: 'password'
        )
        authenticate = User.authenticate_with_credentials(@user.email, @user.password)
        expect(authenticate).to_not be_valid
        end
    
        end
    end
end