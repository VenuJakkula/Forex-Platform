package trg.talentsprint.starterkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Banks;
import trg.talentsprint.starterkit.repository.BankRepository;

@Service
public class BankService {
	
	@Autowired
	private BankRepository bank;
	
	public List<Banks> getBanksByCountry(String country){
		return bank.getBanksbyCountry(country);
	}

}
