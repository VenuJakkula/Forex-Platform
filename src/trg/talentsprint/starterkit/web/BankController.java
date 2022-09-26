package trg.talentsprint.starterkit.web;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import trg.talentsprint.starterkit.model.Banks;
import trg.talentsprint.starterkit.model.Currency;
import trg.talentsprint.starterkit.service.BankService;
import trg.talentsprint.starterkit.service.CurrencyService;

@RestController
public class BankController {
	
	@Autowired
	private BankService bankService;
	
	@Autowired
	private CurrencyService currencyService;
	
	@ResponseBody
	@RequestMapping(value="/BanksbyCountry",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<Banks> getBanksbyCountry(String country) {
		List<Banks> banks=bankService.getBanksByCountry(country);
    	return banks;
	}
	
	@ResponseBody
	@RequestMapping(value="/getGraph",produces=MediaType.APPLICATION_JSON_VALUE)
	public List<Currency> getGraphDetails(String country) {
		List<Currency> graphData=currencyService.getGraphDatabyCountry(country);
    	return graphData;
	}

}
