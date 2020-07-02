package online.newbrandshop.repository;

import online.newbrandshop.modal.NameTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NameTypeRepository extends JpaRepository<NameTypeEntity,Long> {
    @Query("select p from NameTypeEntity p where p.id=:type")
    NameTypeEntity findFirstByType(int type);
    NameTypeEntity findFirstByNameType(String nameType);
}
