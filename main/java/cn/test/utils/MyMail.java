package cn.test.utils;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

//授权码：domzgrbqncelfhfc
public class MyMail {
    public static void sendMail(String address,String code){
        //做链接前的准备工作  也就是参数初始化
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.host","smtp.qq.com");//发送邮箱服务器
            properties.setProperty("mail.smtp.port","465");//发送端口
            properties.setProperty("mail.smtp.auth","true");//是否开启权限控制
            properties.setProperty("mail.debug","true");//true 打印信息到控制台
             properties.setProperty("mail.transport","smtp");//发送的协议是简单的邮件传输协议
             properties.setProperty("mail.smtp.ssl.enable","true"); 
             //建立两点之间的链接

             Session session = Session.getInstance(properties, new Authenticator() {
             @Override
             protected PasswordAuthentication getPasswordAuthentication() {
             return new PasswordAuthentication("你的qq@qq.com","你的授权码");
             }
             });

             //创建邮件对象
             MimeMessage message = new MimeMessage(session);
             try {
             //设置发件人
             message.setFrom(new InternetAddress("你的qq@qq.com"));
             // 设置收件人
             message.setRecipient(Message.RecipientType.TO,new InternetAddress(address));
             message.setSubject("激活账号邮件");
             //设置邮件正文  第二个参数是邮件发送的类型

                 String content = "<html><head></head><body><h1>这是一封激活邮件,激活请点击以下链接</h1><h3><a href='http://localhost:8080/Netpan/Student/active.do?code=" +
                         code + "'>激活账号" +
                 "</a></href></h3></body></html>";
                 Multipart mp = new MimeMultipart(); //创建一个包含HTML内容的MimeBodyPart
                  BodyPart html = new MimeBodyPart(); //设置邮件的内容的格式和字节码
                  html.setContent(content.trim(), "text/html; charset=utf-8");
                 mp.addBodyPart(html);
                 message.setContent(mp);




             //发送一封邮件
             Transport transport = session.getTransport(); 
             transport.connect("你的qq@qq.com","你的授权码");
             Transport.send(message);
             System.out.println("发送成功");
             } catch (MessagingException e) {
             e.printStackTrace();
             }finally {
             }
             }

}
