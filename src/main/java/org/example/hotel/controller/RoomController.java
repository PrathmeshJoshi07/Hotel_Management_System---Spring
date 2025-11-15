package org.example.hotel.controller;

import org.example.hotel.model.Room;
import org.example.hotel.service.RoomService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    private final RoomService service;

    public RoomController(RoomService service) {
        this.service = service;
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("rooms", service.list());
        model.addAttribute("roomForm", new Room());
        return "rooms";
    }

    @PostMapping
    public String create(@ModelAttribute("roomForm") @Valid Room room,
                         BindingResult br,
                         Model model) {

        if (br.hasErrors()) {
            model.addAttribute("rooms", service.list());
            return "rooms";
        }

        service.save(room);
        return "redirect:/rooms";
    }

    // ✅ FIX: explicitly specify the name for PathVariable
    @PostMapping("/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
        service.delete(id);
        return "redirect:/rooms";
    }
}
