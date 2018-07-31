package com.freemind.controller;

import com.freemind.model.Vendors;
import com.freemind.services.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Locale;

@Controller
@RequestMapping("vendors")
public class VendorController {

    @Autowired
    private VendorService vendorService;

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView handelRequest(Model uiModel, HttpServletRequest request) {
        uiModel.addAttribute("vendorList", vendorService.getAllVendorList());
        return new ModelAndView("Vendor/Home");
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView saveVendor(
            @ModelAttribute("vendor") @Valid Vendors vendor,
            BindingResult bindingResult, Model uiModel,
            RedirectAttributes redirectedAttribute,
            HttpServletRequest httpServletRequest, Locale locale) {
        vendorService.save(vendor);
        redirectedAttribute.addFlashAttribute("msgType", "1");
        redirectedAttribute.addFlashAttribute("msg", "Vendor Saved Successfully!!!");
        return new ModelAndView("redirect:/vendors");
    }

    @RequestMapping(method = RequestMethod.GET, value = "update/{id}/{status}")
    public ModelAndView deleteVendor(@PathVariable("id") Integer id,
                                     @PathVariable boolean status, Model uiModel,
                                     HttpServletRequest httpServletRequest,
                                     final RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("msgType", "1");
        if (status == true) {
            vendorService.updateVendorStatus(id, false);
            redirectAttributes.addFlashAttribute("msg", "Vendor De-Activated Successfully!!!");
        } else {
            vendorService.updateVendorStatus(id, true);
            redirectAttributes.addFlashAttribute("msg", "Vendor Activated Successfully!!!");
        }
        return new ModelAndView("redirect:/vendors");
    }
}
