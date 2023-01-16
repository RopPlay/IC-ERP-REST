package de.itchristmann.ICERP.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "ic_firma")
public class Firma {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String bezeichnung;

    @Column(name = "bezeichnung",nullable = false)
    public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }


    @Column(name = "id", nullable = false)
    public Long getId() {
        return id;
    }
}
