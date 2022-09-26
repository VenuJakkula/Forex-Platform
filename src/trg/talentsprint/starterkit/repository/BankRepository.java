package trg.talentsprint.starterkit.repository;

import java.util.List;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Banks;

@Repository
public interface BankRepository extends JpaRepository<Banks,Integer>{
	
	@Query(value="select * from banks where country=?1",nativeQuery=true)
	List<Banks> getBanksbyCountry(String country);

}
