package trg.talentsprint.starterkit.repository;

import java.sql.Date;
import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Currency;

@Repository
public interface CurrencyRepository extends JpaRepository<Currency,Integer>{
	
	@Query(value = "select distinct country from currency", nativeQuery = true)
	List<String> findUniqueCountries();

	@Query(value = "select * from currency where country=?1 and date_of_rec=?2", nativeQuery = true)
	List<Currency> findCurrencyByCountry(String country,Date date);
	
	@Query(value= "select distinct date_of_rec from currency",nativeQuery=true)
	List<Date> findUniqueDates();
	
	@Query(value="select * from currency where country=?1",nativeQuery=true)
	List<Currency> findGraphDatabyCountry(String country);
}
