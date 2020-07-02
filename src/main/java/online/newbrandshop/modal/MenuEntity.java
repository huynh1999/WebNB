package online.newbrandshop.modal;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "menu")
public class MenuEntity extends BaseEntity{
    @Column(name = "namemenu")
    private String nameMenu;

    @Column(name = "namecategory")
    private String nameCategory;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "type")
    NameTypeEntity type;

    public void setType(NameTypeEntity type) {
        this.type = type;
    }

    public String getNameMenu() {
        return nameMenu;
    }

    public NameTypeEntity getType() {
        return type;
    }

    public void setNameMenu(String nameMenu) {
        this.nameMenu = nameMenu;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

}
