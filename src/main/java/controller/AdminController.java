package controller;

import model.Role;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.RoleService;
import service.UserService;


import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Controller
@RequestMapping("/admin/")
public class AdminController {

    private UserService userService;
    private RoleService roleService;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public void setUserService(UserService userService, RoleService roleService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping(value = "/list")
    public ModelAndView allUsers() {
        List<User> users = userService.getAllUsers();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("listPage");
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    @GetMapping(value = "/edit/{id}")
    public ModelAndView getEditPage(@PathVariable("id") Long id) {
        User user = userService.getUserById(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("editUserPage");
        modelAndView.addObject("user", user);
        return modelAndView;
    }

    @PostMapping(value = "/edit")
    public ModelAndView editUser(@ModelAttribute("user") User user,
                                 @RequestParam("role") String role) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/admin/list");
        Set<Role> roles = new HashSet<>();
        roles.add(roleService.getRoleByName(role));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(roles);
        userService.updateUser(user);
        return modelAndView;
    }

    @GetMapping(value = "/add")
    public ModelAndView getAddPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addUserPage");
        return modelAndView;
    }

    @PostMapping(value = "/add")
    public ModelAndView addUser(@ModelAttribute("user") User user,
                                @RequestParam("role") String role) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/admin/list");
        Set<Role> roles = new HashSet<>();
        roles.add(roleService.getRoleByName(role));
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(roles);
        userService.addUser(user);
        return modelAndView;
    }

    @GetMapping(value = "/delete/{id}")
    public ModelAndView deleteUser(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("redirect:/admin/list");
        User userToDelete = userService.getUserById(id);
        userService.deleteUser(userToDelete);
        return modelAndView;
    }
}
