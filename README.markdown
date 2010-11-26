This is a quick port of Mobile ESP to Ruby.
-------------------------------------------

All detection methods are renamed
detectIphone -> detect_iphone?

All constants are underscored and uppercase
e.g. DEVICE_IPHONE

Public attributes and getter methods are attribute readers
e.g. user_agent

Getters are still there as attribute readers
getIsIphone -> is_iphone (without the ?)
They may be removed and replaced by caching detection results

I have kept sort of the same code-structure in the methods to make it easier to update.

Usage example in rails
----------------------

    ua = MobileESP::UserAgentInfo.new(request.user_agent, request.accept)
    if ua.is_tier_iphone?
      # You get hignend mobile layout
    elsif ua.detect_mobile_quick?
      # You get lowend mobile layout
    elsif ua.detect_ipad?
      # You probably still get the computer layout
    end


Quick list of detection methods
-------------------------------

    # Reader methods to keep as much consistency as possible with the original api
    # These are a bit quicker than the raw methods below
    ua.is_iphone
    ua.is_tier_iphone
    ua.is_tier_rich_css
    ua.is_tier_generic_mobile
    
    # All detection methods
    ua.detect_iphone?
    ua.detect_ipod?
    ua.detect_ipad?
    ua.detect_iphone_or_ipod?
    ua.detect_android?
    ua.detect_android_webkit?
    ua.detect_webkit?
    ua.detect_s60_oss_browser?
    ua.detect_symbian_os?
    ua.detect_windows_phone7?
    ua.detect_windows_mobile?
    ua.detect_black_berry?
    ua.detect_black_berry_web_kit?
    ua.detect_black_berry_touch?
    ua.detect_black_berry_high?
    ua.detect_black_berry_low?
    ua.detect_palm_os?
    ua.detect_palm_web_os?
    ua.detect_garmin_nuvifone?
    ua.detect_smartphone?
    ua.detect_brew_device?
    ua.detect_danger_hiptop?
    ua.detect_opera_mobile?
    ua.detect_wap_wml?
    ua.detect_kindle?
    ua.detect_mobile_quick?
    ua.detect_sony_playstation?
    ua.detect_nintendo?
    ua.detect_xbox?
    ua.detect_game_console?
    ua.detect_midp_capable?
    ua.detect_maemo_tablet?
    ua.detect_archos?
    ua.detect_sony_mylo?
    ua.detect_mobile_long?
    ua.detect_tier_iphone?
    ua.detect_tier_rich_css?
    ua.detect_tier_other_phones?



See the following sites for more details on the project
http://www.mobileesp.com/
http://code.google.com/p/mobileesp/


Don't you wish there were an easy way to detect whether your web site visitor is connecting with a desktop PC or a mobile device of some sort? With this code, it's easy to integrate mobile device detection into your site so you can offer, for example, an iPhone optimized version for modern touchscreen devices (including Android & WebOS) and/or a leaner, faster-loading site without Flash, AJAX, or fancy JavaScript for the widest array of mobile devices.

The MobileESP project seeks to provide web site developers an easy-to-use and lightweight API for detecting whether visitors are using a mobile device, and if so, what kind. The APIs provide simple boolean results for popular individual device OS categories (such as iPhone, BlackBerry, Symbian S60, and Windows Mobile), device capabilities (e.g., J2ME), and broad classes of devices, such as "iPhone Tier" (iPhone/Android/WebOS) and smartphones.

This project maintains and extends the original code created by Anthony Hand of Hand Interactive ( http://www.hand-interactive.com/ ). The code library has been ported to: PHP, Java, and APS.NET (C#) for server-side detection, and JavaScript for more limited client-side detection. The APIs are designed to be consistent across code languages.

The MobileESP project is easy to use, install, and customize. This project is not meant to replace other, more detailed projects, such as WURFL or HandsetDetection.com.

The official web site of the MobileESP project is: http://www.mobileesp.com

