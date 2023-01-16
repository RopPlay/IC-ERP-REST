package de.itchristmann.ICERP.controller;

import de.itchristmann.ICERP.entity.Firma;
import de.itchristmann.ICERP.repository.FirmaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class FirmaController {

    @Autowired
    FirmaRepository firmaRepository;

    @GetMapping("/firma")
    public List<Firma> firmaList(){
        List<Firma> firmas = (List<Firma>) firmaRepository.findAll();
        return firmas;
    }

    @RequestMapping(method = RequestMethod.POST, path = "/firma/add",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Firma postFirma(@RequestBody Firma firma){
        return firmaRepository.save(firma);
    }

    @RequestMapping(method = RequestMethod.DELETE,value = "/firma/{id}")
    public void deleteFirma(@PathVariable final String id){
        firmaRepository.deleteById(Long.parseLong(id));
    }


}
