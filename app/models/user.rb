class User < ApplicationRecord
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name,:email, presence: true
    before_save {self.email=email.downcase }
    validates:name,presence:true,length: {maximum:50}
    validates :email,length:{maximum:255,message:"Max is 255 characters"},
       format: {with:VALID_EMAIL_REGEX},uniqueness:true
    #validates :check_length_name, if: ->{ name.present? }
    has_secure_password
    validates :password,length:{minimum:6}
    
    # def check_length_name
    #    if name.size > 150
    #     errors.add :name, "Length maximum is 150"    
    #    end
    # end
end
