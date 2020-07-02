package online.newbrandshop.modal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "image")
public class ImageEntity extends BaseEntity{
    @Column(name = "link")
    String link;
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
