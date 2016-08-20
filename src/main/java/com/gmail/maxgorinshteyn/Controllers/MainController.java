package com.gmail.maxgorinshteyn.Controllers;

import com.gmail.maxgorinshteyn.Entities.Schedule;
import com.gmail.maxgorinshteyn.Entities.Ticket;
import com.gmail.maxgorinshteyn.Entities.User;
import com.gmail.maxgorinshteyn.Entities.enums.UserRole;
import com.gmail.maxgorinshteyn.Service.Service;
import com.gmail.maxgorinshteyn.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/")
public class MainController {

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");

    @Autowired
    private Service bookingService;
    @Autowired
    private UserService userService;

    @Autowired
    private ShaPasswordEncoder shaPasswordEncoder;

    @RequestMapping("/")
    public String index(Model model) {
        bookingService.addNewRate();
        model.addAttribute("departure", bookingService.listDepartureFullNames());
        return "index";
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchSchedule(@RequestParam String from,
                                 @RequestParam String to,
                                 @RequestParam String date,
                                 Model model) {

        LocalDate scheduleDate = LocalDate.parse(date, formatter);
        model.addAttribute("schedule", bookingService.list(from, to, scheduleDate));
        return "search";
    }

    @RequestMapping(value = "/quicksearch", method = RequestMethod.POST)
    public String searchSchedule(@RequestParam String optradio,
                                 @RequestParam(value = "date") String date,
                                 Model model) {
        LocalDate quickScheduleDate = LocalDate.parse(date, formatter);
        switch (optradio) {
            case ("1"):
                model.addAttribute("schedule", bookingService.list("Kyiv", "Odesa", quickScheduleDate));
                break;
            case ("2"):
                model.addAttribute("schedule", bookingService.list("Kyiv", "Lviv", quickScheduleDate));
                break;
            case ("3"):
                model.addAttribute("schedule", bookingService.list("Kyiv", "Kharkiv", quickScheduleDate));
                break;
            case ("4"):
                model.addAttribute("schedule", bookingService.list("Kyiv", "Dnipro", quickScheduleDate));
                break;
            case ("5"):
                model.addAttribute("schedule", bookingService.list("Kyiv", "Uzhorod", quickScheduleDate));
                break;
        }
        return "search";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        return "registration";
    }


    @RequestMapping(value = "/userpage", method = RequestMethod.GET)
    public String userPage(Model model) {
        org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getUserByLogin(u.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("ticket", bookingService.listTicketForUser(user, false));
        return "userpage";
    }

    @RequestMapping(value = "/unauthorized", method = RequestMethod.GET)
    public String unauthorized(Model model) {
        return "unauthorized";
    }

    @RequestMapping(value = "/add_new_user", method = RequestMethod.POST)
    public String addUser(@RequestParam String name,
                          @RequestParam String login,
                          @RequestParam String email,
                          @RequestParam String password,
                          @RequestParam String confirmPassword,
                          Model model) {
        if (!password.equals(confirmPassword)) {
            model.addAttribute("code", "510");
            return "registration";
        }

        List<User> users = bookingService.listAllUsers();
        for (User userDB : users) {
            if (userDB.getLogin().equals(login)) {
                model.addAttribute("code", "520");
                return "registration";
            }
            if (userDB.getEmail().equals(email)) {
                model.addAttribute("code", "530");
                return "registration";
            }
        }

        String encodePassword = shaPasswordEncoder.encodePassword(password, null);
        User newUser = new User(name, login, encodePassword, UserRole.ROLE_USER, email);
        bookingService.addNewUser(newUser);
        return "login";
    }

    @RequestMapping(value = "/add_new_ticket", method = RequestMethod.POST)
    public String addUser(@RequestParam(value = "id", required = false) long id, Model model) {
        org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getUserByLogin(u.getUsername());
        Schedule schedule = bookingService.findScheduleById(id);
        Ticket ticket = new Ticket(user, schedule, LocalDate.now(), false);
        bookingService.addNewTicket(ticket);
        return "redirect:/userpage";
    }

    @RequestMapping(value = "/delete_ticket", method = RequestMethod.POST)
    public ResponseEntity<Void> delete(@RequestParam(value = "checkedArray[]", required = false) long[] checkedArray, Model model) {
        if (checkedArray != null) {
            bookingService.deleteTicket(checkedArray);
        }
        org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getUserByLogin(u.getUsername());
        model.addAttribute("ticket", bookingService.listTicketForUser(user, false));
        return new ResponseEntity<Void>(HttpStatus.OK);
    }

    @RequestMapping(value = "/submit_ticket", method = RequestMethod.POST)
    public String submitTicket(@RequestParam(value = "checkedArray[]", required = false) long[] checkedArray, Model model) {
        if (checkedArray != null) {
            bookingService.submitTicket(checkedArray);
        }
        return "redirect:/submitpage";
    }

    @RequestMapping(value = "/submitpage", method = RequestMethod.GET)
    public String submitPage(Model model) {
        org.springframework.security.core.userdetails.User u = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userService.getUserByLogin(u.getUsername());
        model.addAttribute("user", user);
        model.addAttribute("subticket", bookingService.listTicketForUser(user, true));
        return "submitpage";
    }
}
