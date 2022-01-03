package fr.sofiane.moscatelli2.users;

import javax.persistence.*;

@Entity
@Table
public class users {
    public enum niveau {
        Administrateur, Magasinier, Visiteur
    }

    //////////////////////////////////////// DECLARATIONS DES VARIABLES
    @Id // Clé de la table
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 70)
    private String nom;

    @Column(nullable = false, length = 70)
    private String prenom;

    @Column(nullable = false, length = 70, unique = true)
    private String email;

    @Column(nullable = false, length = 255)
    private String mdp;

    @Column(nullable = false, length = 70)
    private String telephone;

    @Column(nullable = false, length = 70)
    private String niveau;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMdp() {
        return mdp;
    }

    public void setMdp(String mdp) {
        this.mdp = mdp;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public users(Long id, String nom, String prenom, String email, String mdp, String telephone, String niveau) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.mdp = mdp;
        this.telephone = telephone;
        this.niveau = niveau;
    }

    public users(String nom, String prenom, String email, String mdp, String telephone, String niveau) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.mdp = mdp;
        this.telephone = telephone;
        this.niveau = niveau;
    }

    public users() {
    }
}
