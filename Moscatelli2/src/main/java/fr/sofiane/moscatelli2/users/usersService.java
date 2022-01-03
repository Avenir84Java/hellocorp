package fr.sofiane.moscatelli2.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class usersService {

    @Autowired
    private IRepositoryUser repo;
    public List<users> listeUsers() {
        return (List<users>) repo.findAll();
    }


}
