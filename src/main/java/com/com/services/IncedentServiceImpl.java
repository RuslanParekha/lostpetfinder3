package com.com.services;

import com.com.model.Photo;
import com.com.repository.IncedentRepository;
import com.com.model.Incedent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ruslan on 14.03.17.
 */
public class IncedentServiceImpl implements IncedentService {

    public IncedentServiceImpl() {
    }

    @Autowired
    private IncedentRepository incedentRepository;


    @Override
    public List<Incedent> list() {
        return (List<Incedent>) incedentRepository.findAll();
    }

    @Override
    public List<Incedent> list(long id) {

        Incedent incedent = incedentRepository.findById(id);

        String caseType1;
        if (incedent.getCaseType().equals("Lost")) {
            caseType1 = "Found";
            return incedentRepository.listRelevantLost(caseType1, incedent.getPetType(), incedent.getGender(),
                    incedent.getDate(), (incedent.getLatitude() - 00.02f), (incedent.getLatitude() + 00.02f),
                    (incedent.getLongitude() - 00.02f), (incedent.getLongitude() + 00.02f));
        }
        else {
            caseType1 = "Lost";
            return incedentRepository.listRelevantFound(caseType1, incedent.getPetType(), incedent.getGender(),
                    incedent.getDate(), (incedent.getLatitude() - 00.02f), (incedent.getLatitude() + 00.02f),
                    (incedent.getLongitude() - 00.02f), (incedent.getLongitude() + 00.02f));
        }
    }

    @Override
    public Incedent listSingle(long id) {
        return incedentRepository.findById(id);
    }

    @Override
    public List<Incedent> listByOwnerId(String ownerId) {
        return incedentRepository.findByOwnerId(ownerId);
    }

    @Override
    public void add(Incedent incedent) {
        incedentRepository.saveAndFlush(incedent);
    }

    @Override
    public void delete(long id) {
        incedentRepository.delete(id);
    }




    @Override
    @Transactional(readOnly = true)
    public byte[] getPhoto(long id) {
        Photo photo = incedentRepository.findByPhotoId(id).getPhoto();
        return photo.getBody();
    }

    public void setIncedentRepository(IncedentRepository incedentRepository){
        this.incedentRepository=incedentRepository;
    }
}
