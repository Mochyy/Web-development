package Mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class Mail {
    public static void main(String[] args) {
        Properties pro = new Properties();
        pro.put("mail.smtp.host", "smtp.gmail.com");
        pro.put("mail.smtp.port", "587");
        pro.put("mail.smtp.auth", "true");
        pro.put("mail.smtp.starttls.enable", "true");

        String uname = "lediemmy.hm@gmail.com";
        String pass = "icwvzsryagtceubo";

        Session session = Session.getInstance(pro,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(uname,pass);
                    }
                }
        );
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress("lediemmy.hm@gmail.com", "LeDiemMy"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse("lediemmy.hm@gmail.com "));
            message.setSubject("Testing Subject");
            message.setText("Dear Mail Crawler\n\n No spam to my email, please!");
            Transport.send(message);
            System.out.println("Done");

        }
        catch (MessagingException| UnsupportedEncodingException e){
            e.printStackTrace();
        }

    }
}
