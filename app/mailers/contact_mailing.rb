class ContactMailing < ApplicationMailer
    
    def contact uid, text
        @p = Professor.find(uid)
        @message = text 
        layout 'contact'
        mail(to: @p.email, subject: 'Mail de contacto')
      end
end
