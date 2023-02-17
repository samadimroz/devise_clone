class User < ApplicationRecord
    # attr_accessor :password
    has_one_attached :image

    validates :email_id, uniqueness: true, length: {in: 5..50}
    validates :password, presence: true, confirmation: true, length: {in: 5..50}

    before_save :encrypt_password

    def self.authenticate_user(email,password)
        user= find_by_email_id(email)
        return user if user && user.check_password(password)
    end

    def check_password(password)
        encrypt(password)==self.password
    end

    protected
    def encrypt_password
        self.password = encrypt(password)
    end

    def encrypt(string)
        Digest::SHA1.hexdigest(string)
    end

    # def encrypt_password
    #     self.encrypted_password= Digest::SHA1.hexdigest(self.password)
    # end

end
