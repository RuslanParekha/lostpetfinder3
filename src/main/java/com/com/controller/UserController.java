package com.com.controller;


import com.com.model.Incedent;
import com.com.model.Photo;
import com.com.model.User;
import com.com.services.IncedentService;
import com.com.services.SecurityService;
import com.com.services.UserService;
import com.com.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ruslan on 10.03.17.
 */
@Controller
public class UserController {

    @Autowired
    private IncedentService incedentService;

    @RequestMapping(value = {"/","/welcome"}, method = RequestMethod.GET)
    public ModelAndView listIncedents(Model model) {
        return new ModelAndView("index", "incedents", incedentService.list());

    }

    @RequestMapping(value = "/admin_cases", method = RequestMethod.GET)
    public ModelAndView listIncedentsAdmin(Model model) {
        return new ModelAndView("index4admin", "incedents", incedentService.list());
    }
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String incedentAdd(Model model) {
        return "add";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(value = "id") long id) {
        incedentService.delete(id);
        return new ModelAndView("index4admin", "incedents", incedentService.list());
    }

    @RequestMapping("/image/{file_id}")
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable("file_id") long fileId) {
        try {
            byte[] content = incedentService.getPhoto(fileId);
            response.setContentType("image/png");
            response.getOutputStream().write(content);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping("/show")
    public ModelAndView show(@RequestParam(value = "id") long id) {
        return new ModelAndView("single", "incedent", incedentService.listSingle(id));

    }
   @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addIncedent(@RequestParam(value = "caseType" ) String caseType,
                                    @RequestParam(value = "petType") String petType,
                                    @RequestParam(value = "gender") String gender,
                                    @RequestParam(value = "date",required=false)Date date,
                                    @RequestParam(value = "description",required=false) String description,
                                    @RequestParam(value = "latitude",required=false) float latitude,
                                    @RequestParam(value = "longitude",required=false) float longitude,
                                    @RequestParam(value = "photo", required=false) MultipartFile photo,
                                    @RequestParam(value = "ownerId") String ownerId)
    {
        try{ Incedent incedent = new Incedent(ownerId, caseType, petType, gender, date, description, latitude, longitude,
                photo.isEmpty() ? null : new Photo(photo.getOriginalFilename(), photo.getBytes()));

            incedentService.add(incedent);
            return new ModelAndView("single_search", "incedent", incedentService.listSingle(incedent.getId()));
        }
        catch (IOException ex) {
            return new ModelAndView("error");
        }
    }

    @RequestMapping("/relevant_search")
    public ModelAndView relevantSearch(@RequestParam(value = "id") long id) {
        return new ModelAndView("relevant_search", "incedents", incedentService.list(id));
    }
    @RequestMapping("/user_case")
    public ModelAndView showUserCase(@RequestParam(value = "id") String id) {
        return new ModelAndView("single_personal", "incedents", incedentService.listByOwnerId(id));
    }

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model){
        model.addAttribute("userForm", new User());

        return "registration";
    }
    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {return "registration";}
        userService.save(userForm);
        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");}
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }
        return "login";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public ModelAndView deleteUser(@RequestParam(value = "id") long id) {
        userService.remove(id);
        return new ModelAndView("admin", "users", userService.listUsers());
    }
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public ModelAndView listOfUsers(Model model) {
        return new ModelAndView("admin", "users", userService.listUsers());
    }
}
