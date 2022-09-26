package trg.talentsprint.starterkit.web;

import java.sql.Date;

import java.util.List;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import trg.talentsprint.starterkit.model.Banks;
import trg.talentsprint.starterkit.model.Currency;
import trg.talentsprint.starterkit.model.User;
import trg.talentsprint.starterkit.service.BankService;
import trg.talentsprint.starterkit.service.CurrencyService;
import trg.talentsprint.starterkit.service.SecurityService;
import trg.talentsprint.starterkit.service.UserService;
import trg.talentsprint.starterkit.validator.UserValidator;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private CurrencyService currencyService;
    
    @Autowired
    private BankService bankService;
    
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping({"/","/welcome"})
    public String welcome(Model model,HttpSession session) {
    	List<String> CountryList=currencyService.getAllCountries();
    	List<Date> uniqueDates=currencyService.getUniqueDates();
    	session.setAttribute("uniqueDates", uniqueDates);
    	session.setAttribute("countryList", CountryList);
        return "welcome";
    }
    
    @GetMapping("/converter")
    public String getConverter() {
    	return "converter";
    }

	@GetMapping("/calculator")
    public String getCalculator() {
    	return "calculator";
    }
    
    @GetMapping("/bankExchangeRate")
    public String getBankExchangeRate(HttpSession session) {
		
    	return "bankExchangeRate";
    }
    
    @GetMapping("/tradeView")
    public String getTradeView() {
    	return "tradeView";
    }
    
    @GetMapping("/newsFeed")
    public String getNewsFeed() {
    	return "newsFeed";
    }
    
    @RequestMapping(value="/getCurrency", method = RequestMethod.GET)
    public @ResponseBody float getCurrency(String country,Date date) {
    	System.out.println(date);
    	List<Currency> curencyValueList=currencyService.getCurrencyByCountry(country,date);
    	Currency c=curencyValueList.get(0);
    	return c.getCurrency_value();
    }
    
    @RequestMapping(value="/Banksby",method=RequestMethod.GET)
    public @ResponseBody List<Banks> getBanksByCountry(String country,HttpSession session){
    	System.out.println("entered controller");
    	System.out.println(country);
    	List<Banks> banks=bankService.getBanksByCountry(country);
    	session.setAttribute("banks", banks);
    	return banks;
    }
}
