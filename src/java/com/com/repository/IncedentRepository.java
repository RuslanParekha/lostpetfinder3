package com.com.repository;

import com.com.model.Incedent;
import com.com.model.Photo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

/**
 * Created by ruslan on 14.03.17.
 */
public interface IncedentRepository extends JpaRepository<Incedent, Long> {

    @Query("SELECT a FROM Incedent a where a.caseType = :caseType and a.petType = :petType and a.gender = :gender " +
            "and a.date >= :date and a.latitude > :latitude1 and a.latitude < :latitude2 and " +
            "a.longitude > :longitude1 and a.longitude < :longitude2 ORDER BY a.date ASC")

    List<Incedent> listRelevantLost(@Param("caseType") String caseType,
                        @Param("petType") String petType,
                        @Param("gender") String gender,
                        @Param("date") Date date,
                        @Param("latitude1") float latitude1,
                        @Param("latitude2") float latitude2,
                        @Param("longitude1") float longitude1,
                        @Param("longitude2") float longitude2);

    @Query("SELECT a FROM Incedent a where a.caseType = :caseType and a.petType = :petType and a.gender = :gender " +
            "and a.date <= :date and a.latitude > :latitude1 and a.latitude < :latitude2 and " +
            "a.longitude > :longitude1 and a.longitude < :longitude2 ORDER BY a.date ASC")

    List<Incedent> listRelevantFound(@Param("caseType") String caseType,
                                    @Param("petType") String petType,
                                    @Param("gender") String gender,
                                    @Param("date") Date date,
                                    @Param("latitude1") float latitude1,
                                    @Param("latitude2") float latitude2,
                                    @Param("longitude1") float longitude1,
                                    @Param("longitude2") float longitude2);

    @Query("Select b from Incedent b where b.id = :id")
    Incedent findById(@Param("id") long id);

    @Query("Select b from Incedent b where b.ownerId = :ownerId")
    List<Incedent> findByOwnerId(@Param("ownerId") String ownerId);

    @Query("Select b from Incedent b where b.photo.id = :id")
    Incedent findByPhotoId(@Param("id") long id);

}
