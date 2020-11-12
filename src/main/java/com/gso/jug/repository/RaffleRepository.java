package com.gso.jug.repository;

import com.gso.jug.model.Raffle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RaffleRepository extends JpaRepository<Raffle, Long> {

    Raffle findByEmail(String email);
}
