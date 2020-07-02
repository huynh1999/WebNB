package online.newbrandshop.modal;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "nametype")
public class NameTypeEntity extends BaseEntity {
    @Column(name = "nametype")
    String nameType;

    @OneToMany(mappedBy = "type",cascade = CascadeType.REMOVE, orphanRemoval=true)
    List<MenuEntity>menuEntities;

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }
    public List<MenuEntity> getMenuEntities() {
        return menuEntities;
    }

    public void setMenuEntities(List<MenuEntity> menuEntities) {
        this.menuEntities = menuEntities;
    }
}
