package de.itchristmann.ICERP.entity;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FirmaRepository extends CrudRepository<Firma, Long> {
    List<Firma> findByBezeichnung(String bezeichnung);
}
