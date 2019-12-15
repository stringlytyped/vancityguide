# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def notification_email
    message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sem felis, maximus sed dignissim sit amet, faucibus vel eros. Fusce pretium dignissim aliquet.\n\n"\
    "Cras fringilla ac leo in tristique. Pellentesque non tellus sit amet massa blandit iaculis. Praesent egestas dapibus augue, in ultricies odio convallis ac. Integer tincidunt, justo semper suscipit accumsan, lacus magna pretium elit, vestibulum rhoncus elit nisl sit amet orci. Nam ullamcorper aliquet ex."

    ContactMailer.with( sender_name: "Jane Doe",
                        sender_addr: "jdoe@example.com",
                        message: message ).notification_email
  end
end
