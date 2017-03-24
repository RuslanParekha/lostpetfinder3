package com.com.services;

import com.com.model.Incedent;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by ruslan on 14.03.17.
 */
public interface IncedentService {

    List<Incedent> list();

    List<Incedent> list(long id);

    List<Incedent> listByOwnerId(String ownerId);

    Incedent listSingle(long id);

    void add(Incedent incedent);

    void delete(long id);

    byte[] getPhoto(long id);
}
