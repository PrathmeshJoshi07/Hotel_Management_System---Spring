package org.example.hotel.repo;

import org.example.hotel.model.Room;
import org.springframework.stereotype.Repository;

import java.util.*;
import java.util.concurrent.atomic.AtomicLong;

@Repository
public class RoomRepositoryImpl implements RoomRepository {

    private final Map<Long, Room> rooms = new HashMap<>();
    private final AtomicLong idGen = new AtomicLong(1);

    @Override
    public List<Room> findAll() {
        return new ArrayList<>(rooms.values());
    }

    @Override
    public Optional<Room> findById(Long id) {
        return Optional.ofNullable(rooms.get(id));
    }

    @Override
    public Room save(Room room) {
        if (room.getId() == null) {
            room.setId(idGen.getAndIncrement());
        }
        rooms.put(room.getId(), room);
        return room;
    }

    @Override
    public void deleteById(Long id) {
        rooms.remove(id);
    }
}
