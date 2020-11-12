package com.gso.jug.service;

import com.gso.jug.model.Raffle;
import com.gso.jug.repository.RaffleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RaffleService {

    private final RaffleRepository raffleRepository;

    public Raffle draw() {

        List<Long> entries = raffleRepository.findAll()
                .stream()
                .filter(e -> !e.isPicked())
                .map(e -> e.getId())
                .collect(Collectors.toList());

        Random random = new Random();
        if(null != entries && !entries.isEmpty()){
            int randomIndex = random.nextInt(entries.size());
            Long pickedValue = entries.get(randomIndex);
            Raffle winner = raffleRepository.findById(pickedValue).orElse(null);
            if(null != winner) {
                winner.setPicked(true);
                raffleRepository.save(winner);
                return winner;
            }
        }
        return defaultWinner();
    }

    private Raffle defaultWinner(){
        Raffle raffle = new Raffle();
        raffle.setFirst_name("Pick");
        raffle.setLast_name("Again");
        raffle.setEmail("email@email.com");
        return raffle;
    }
}
