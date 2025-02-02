package com.javatmp.module.event.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.module.event.entity.Event;
import com.javatmp.module.event.repository.EventRepository;
import com.javatmp.module.event.service.EventService;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/calendar")
public class EventOperationController {

    @Autowired
    EventService eventService;

    @Autowired
    EventRepository eventRepository;

    @PostMapping("/addNewEvent")
    public ResponseMessage addNewEvent(Event event, ResponseMessage responseMessage) {

        log.info("Event read from request prior to update [" + (event) + "]");

        event.setCreationDate(new Date());
        event.setStatus(1);
        this.eventRepository.save(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Event id [" + event.getId() + "] Added Successfully");
        return responseMessage;
    }

    @PostMapping("/deleteEvent")
    public ResponseMessage deleteEvent(@RequestBody Event event, HttpServletRequest request, HttpServletResponse response) {
        log.info("Event read from request to be deleted [" + (event) + "]");
        ResponseMessage responseMessage = new ResponseMessage();
        eventRepository.delete(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Object event found [" + event.getId() + "]");
        return responseMessage;
    }

    @PostMapping("/updateEvent")
    public ResponseMessage updateEvent(@RequestBody Event event, ResponseMessage responseMessage) {

        log.info("Event read from request prior to update [" + (event) + "]");

        responseMessage.setOverAllStatus(true);
        Event dbEvent = this.eventRepository.getOne(event.getId());
        dbEvent.setTitle(event.getTitle());
        dbEvent.setStartDate(event.getStartDate());
        dbEvent.setEndDate(event.getEndDate());
        eventRepository.save(event);
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("event update successfully");
        return responseMessage;
    }

    @PostMapping("/populateFakeDatabase")
    public ResponseMessage populateFakeDatabase() {

        this.eventService.initialiseDiary();
        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("DB table 'event' has been successfully populated with Random diary events");
        return responseMessage;
    }

    @GetMapping("/getDiaryEvents")
    public List<Event> getDiaryEvents() {
        List<Event> diaryEvents = this.eventRepository.findAll();
        return diaryEvents;
    }

}
