package de.itchristmann.ICERP.repository;

import de.itchristmann.ICERP.entity.Firma;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FirmaRepository extends CrudRepository<Firma, Long> {
    List<Firma> findByBezeichnung(String bezeichnung);
}
