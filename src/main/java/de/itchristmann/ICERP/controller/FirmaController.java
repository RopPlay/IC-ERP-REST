package de.itchristmann.ICERP.controller;

import de.itchristmann.ICERP.entity.Firma;
import de.itchristmann.ICERP.entity.FirmaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class FirmaController {

    @Autowired
    FirmaRepository firmaRepository;

    @GetMapping("/firma")
    public List<Firma> findFirma(@RequestParam(value = "bezeichnung") String bezeichnung){
        List<Firma> firmas = (List<Firma>) firmaRepository.findByBezeichnung(bezeichnung);

        return firmas;
    }

    @RequestMapping(method = RequestMethod.POST, path = "/add",produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public Firma postFirma(@RequestBody Firma firma){
        return firmaRepository.save(firma);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteFirma(@PathVariable final String id){
        Long deletetId = Long.parseLong(id);
        firmaRepository.deleteById(deletetId);
    }


}
