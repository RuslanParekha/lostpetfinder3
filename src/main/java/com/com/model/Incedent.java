package com.com.model;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by ruslan on 14.03.17.
 */
@Entity
@Table(name = "incedents")
public class Incedent {

    @Id
    @GeneratedValue
    private long id;

    private String ownerId;

    private String caseType;

    private String petType;

    private String gender;

    private Date date;

    private String description;

    private float latitude;

    private float longitude;

    @OneToOne(cascade= CascadeType.ALL)
    @JoinColumn(name = "photo_id")
    private Photo photo;

    public Incedent() {
    }

    public Incedent(String ownerId, String caseType, String petType, String gender, Date date, String description, float latitude, float longitude, Photo photo) {
        this.ownerId = ownerId;
        this.caseType = caseType;
        this.petType = petType;
        this.gender = gender;
        this.date = date;
        this.description = description;
        this.latitude = latitude;
        this.longitude = longitude;
        this.photo = photo;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCaseType() {
        return caseType;
    }

    public void setCaseType(String caseType) {
        this.caseType = caseType;
    }

    public String getPetType() {
        return petType;
    }

    public void setPetType(String petType) {
        this.petType = petType;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getLatitude() {
        return latitude;
    }

    public void setLatitude(float latitude) {
        this.latitude = latitude;
    }

    public float getLongitude() {
        return longitude;
    }

    public void setLongitude(float longitude) {
        this.longitude = longitude;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }
}
