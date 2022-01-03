package fr.sofiane.moscatelli2.users;

import org.springframework.data.repository.CrudRepository;

    public interface IRepositoryUser extends CrudRepository<users, Long> {
        Long countById( Long id);
    }

