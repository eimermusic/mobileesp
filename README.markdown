This is a quick port of Mobile ESP to Ruby.
-------------------------------------------

All detection methods are renamed
detectIphone -> is_iphone?

All constants are underscored and uppercase
e.g. DEVICE_IPHONE

Public attributes and getter methods are attribute readers
e.g. user_agent

Getters are still there although very close to the detection methods in name
getIsIphone -> is_iphone (without the ?)
They may be removed and replaced by caching detection results

I have kept sort of the same code-structure in the methods to make it easier to update.

Usage example in rails
----------------------

    ua = MobileESP::UserAgentInfo.new(request.user_agent, request.accept)
    if ua.is_tier_iphone?
      # You get hignend mobile layout
    elsif ua.is_mobile_quick?
      # You get lowend mobile layout
    elsif ua.is_ipad?
      # You probably still get the computer layout
    end


See the following sites for more details on the project
http://www.mobileesp.com/
http://code.google.com/p/mobileesp/


Don't you wish there were an easy way to detect whether your web site visitor is connecting with a desktop PC or a mobile device of some sort? With this code, it's easy to integrate mobile device detection into your site so you can offer, for example, an iPhone optimized version for modern touchscreen devices (including Android & WebOS) and/or a leaner, faster-loading site without Flash, AJAX, or fancy JavaScript for the widest array of mobile devices.

The MobileESP project seeks to provide web site developers an easy-to-use and lightweight API for detecting whether visitors are using a mobile device, and if so, what kind. The APIs provide simple boolean results for popular individual device OS categories (such as iPhone, BlackBerry, Symbian S60, and Windows Mobile), device capabilities (e.g., J2ME), and broad classes of devices, such as "iPhone Tier" (iPhone/Android/WebOS) and smartphones.

This project maintains and extends the original code created by Anthony Hand of Hand Interactive ( http://www.hand-interactive.com/ ). The code library has been ported to: PHP, Java, and APS.NET (C#) for server-side detection, and JavaScript for more limited client-side detection. The APIs are designed to be consistent across code languages.

The MobileESP project is easy to use, install, and customize. This project is not meant to replace other, more detailed projects, such as WURFL or HandsetDetection.com.

The official web site of the MobileESP project is: http://www.mobileesp.com

