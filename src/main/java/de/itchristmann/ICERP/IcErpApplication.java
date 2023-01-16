package de.itchristmann.ICERP;

import de.itchristmann.ICERP.entity.Firma;
import de.itchristmann.ICERP.entity.FirmaRepository;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class IcErpApplication {

	public static void main(String[] args) {
		ConfigurableApplicationContext applicationContext = SpringApplication.run(IcErpApplication.class, args);

		Firma hausmeister = new Firma();
		hausmeister.setBezeichnung("Hauemeister");

		Firma autohaus = new Firma();
		autohaus.setBezeichnung("Autohaus");

		FirmaRepository firmaRepository = applicationContext.getBean(FirmaRepository.class);

		//firmaRepository.save(hausmeister);
		//firmaRepository.save(autohaus);

	}

}
