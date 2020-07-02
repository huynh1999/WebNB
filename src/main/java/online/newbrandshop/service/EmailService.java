package online.newbrandshop.service;

import online.newbrandshop.modal.BillEntity;
import online.newbrandshop.modal.PayerEntity;
import online.newbrandshop.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailService {
    @Autowired
    JavaMailSender sender;
    public void SendMailConfirmBill(BillEntity bill)
    {
        StringBuilder text=new StringBuilder();
        PayerEntity payerEntity=bill.getPayerEntity();
        text.append("<strong>");
        text.append("<p>Dear Mr./Mrs. "+payerEntity.getName()+"</p>");
        text.append("<p>This email for confirm your online order invoices at website newbrandshop.online .</p>");
        text.append("<i>");
        text.append("<p>Customer : "+payerEntity.getName()+"</p>");
        text.append("<p>Phone Number : "+payerEntity.getPhone()+"</p>");
        text.append("<p>Address : "+payerEntity.getAddress()+"</p>");
        text.append("<p>Date : "+payerEntity.getCreatedDate()+"</p>");
        text.append("<p>Bill Code : "+bill.getBillName()+"</p>");
        text.append("</i>");
        text.append("</strong>");
        text.append("<p>For more information about bill please go to : https://newbrandshop.online/bill/"+bill.getBillName()+"</p>");
        text.append("<p>Any question please contact with us.Thanks</p>");

        MimeMessagePreparator message = new MimeMessagePreparator() {
            @Override
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper messageObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageObj.setTo(bill.getPayerEntity().getEmail());
                messageObj.setSubject("NewBrandShopOnline Confirm Bill");
                messageObj.setText(text.toString(), true);
            }
        };
        sender.send(message);
    }
}
