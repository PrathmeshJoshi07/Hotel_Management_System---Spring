package org.example.hotel.service;

import org.example.hotel.model.Room;
import org.example.hotel.repo.RoomRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoomService {
    private final RoomRepository repo;

    public RoomService(RoomRepository repo) { this.repo = repo; }

    public List<Room> list() { return repo.findAll(); }
    public Optional<Room> get(Long id) { return repo.findById(id); }
    public Room save(Room r) { return repo.save(r); }
    public void delete(Long id) { repo.deleteById(id); }
}
