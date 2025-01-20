package com.dangs.sw;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetDTO {
    private int petId;
    private String userId;
    private String petName;
    private String petType;
    private String petPhoto;
    private String petSize;
    private Date petBirth;
    private String petGender;
    private String petDescription;
}