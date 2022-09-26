package trg.talentsprint.starterkit.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Currency;
import trg.talentsprint.starterkit.repository.CurrencyRepository;

@Service
public class CurrencyService {
	
	@Autowired
	private CurrencyRepository cr;
	
	public List<String> getAllCountries(){
		return cr.findUniqueCountries();
	}
	
	public List<Currency> getGraphDatabyCountry(String country){
		return cr.findGraphDatabyCountry(country);
	}
	
	public List<Currency> getCurrencyByCountry(String country,Date date) {
		return cr.findCurrencyByCountry(country,date);
	}
	
	public List<Date> getUniqueDates(){
		return cr.findUniqueDates();
	}

}
