package online.newbrandshop.repository;

import online.newbrandshop.modal.MenuEntity;
import online.newbrandshop.modal.PayerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MenuRepository extends JpaRepository<MenuEntity, Long> {
    @Query("select p from MenuEntity p order by p.type.id")
    List<MenuEntity>findAllOrderByType();
    @Query("select p from MenuEntity p where p.nameCategory=:nameCate and p.type.nameType=:nameType")
    MenuEntity findByNameAndType(@Param("nameCate") String nameCate, @Param("nameType") String nameType);
}
