# ABOUT THIS PROJECT
#   Project Owner: Anthony Hand
#   Email: anthony.hand@gmail.com
#   Web Site: http://www.mobileesp.com
#   Source Files: http://code.google.com/p/mobileesp/
#
#   Versions of this code are available for:
#      PHP, JavaScript, Java, and ASP.NET (C#)
#
#   This port was done by Martin Westin based on the Java source.
#   All methods and attributes have been rubyfied and are not 
#   entirely compatible with the official API.
module MobileESP
  # 
  # The DetectSmartPhone class encapsulates information about
  #   a browser's connection to your web site.
  #   You can use it to find out whether the browser asking for
  #   your site's content is probably running on a mobile device.
  #   The methods were written so you can be as granular as you want.
  #   For example, enquiring whether it's as specific as an iPod Touch or
  #   as general as a smartphone class device.
  #   The object's methods return true, or false.
  # 
  class UserAgentInfo
    
    
    # Optional: store values for quickly accessing same info multiple times.
    # Call InitDeviceScan() to initialize these values.
    attr_reader :user_agent, :http_accept, :is_iphone, :is_tier_iphone, :is_tier_rich_css, :is_tier_generic_mobile
    
    
    # Initialize some initial smartphone string variables.
    ENGINE_WEB_KIT = "webkit"
    DEVICE_ANDROID = "android"

    DEVICE_IPHONE = "iphone"
    DEVICE_IPOD = "ipod"
    DEVICE_IPAD = "ipad"
    DEVICE_MAC_PPC = "macintosh" #Used for disambiguation

    DEVICE_SYMBIAN = "symbian"
    DEVICE_S60 = "series60"
    DEVICE_S70 = "series70"
    DEVICE_S80 = "series80"
    DEVICE_S90 = "series90"

    DEVICE_WIN_PHONE7 = "windows phone os 7"
    DEVICE_WIN_MOB = "windows ce"
    DEVICE_WINDOWS = "windows"
    DEVICE_IE_MOB = "iemobile"
    DEVICE_PPC = "ppc" #Stands for PocketPC
    ENGINE_PIE = "wm5 pie" #An old Windows Mobile

    DEVICE_BB = "blackberry"
    VND_RIM = "vnd.rim" #Detectable when BB devices emulate IE or Firefox
    DEVICE_BB_STORM = "blackberry95" #Storm 1 and 2
    DEVICE_BB_BOLD = "blackberry97" #Bold
    DEVICE_BB_TOUR = "blackberry96" #Tour
    DEVICE_BB_CURVE = "blackberry89" #Curve 2
    DEVICE_BB_TORCH = "blackberry 98" #Torch

    DEVICE_PALM = "palm"
    DEVICE_WEB_OS = "webos" #For Palm's new WebOS devices
    ENGINE_BLAZER = "blazer" #Old Palm
    ENGINE_XIINO = "xiino" #Another old Palm

    DEVICE_KINDLE = "kindle" #Amazon Kindle, eInk one.

    DEVICE_NUVIFONE = "nuvifone" #Garmin Nuvifone

    # Initialize variables for mobile-specific content.
    VNDWAP = "vnd.wap"
    WML = "wml"

    # Initialize variables for other random devices and mobile browsers.
    DEVICE_BREW = "brew"
    DEVICE_DANGER = "danger"
    DEVICE_HIPTOP = "hiptop"
    DEVICE_PLAYSTATION = "playstation"
    DEVICE_NINTENDO_DS = "nitro"
    DEVICE_NINTENDO = "nintendo"
    DEVICE_WII = "wii"
    DEVICE_XBOX = "xbox"
    DEVICE_ARCHOS = "archos"

    ENGINE_OPERA = "opera" #Popular browser
    ENGINE_NETFRONT = "netfront" #Common embedded OS browser
    ENGINE_UP_BROWSER = "up.browser" #common on some phones
    ENGINE_OPEN_WEB = "openweb" #Transcoding by OpenWave server
    DEVICE_MIDP = "midp" #a mobile Java technology
    UPLINK = "up.link"
    ENGINE_TELECA_Q = "teleca q" #a modern feature phone browser
    DEVICE_PDA = "pda" #some devices report themselves as PDAs
    MINI = "mini" #Some mobile browsers put "mini" in their names.
    MOBILE = "mobile" #Some mobile browsers put "mobile" in their user agent strings.
    MOBI = "mobi" #Some mobile browsers put "mobi" in their user agent strings.

    # Use Maemo, Tablet, and Linux to test for Nokia"s Internet Tablets.
    MAEMO = "maemo"
    MAEMO_TABLET = "tablet"
    LINUX = "linux"
    QTEMBEDDED = "qt embedded" #for Sony Mylo
    MYLOCOM2 = "com2" #for Sony Mylo also

    # In some UserAgents, the only clue is the manufacturer.
    MANU_SONY_ERICSSON = "sonyericsson"
    MANUERICSSON = "ericsson"
    MANU_SAMSUNG1 = "sec-sgh"
    MANU_SONY = "sony"
    MANU_HTC = "htc" #Popular Android and WinMo manufacturer

    # In some UserAgents, the only clue is the operator.
    SVC_DOCOMO = "docomo"
    SVC_KDDI = "kddi"
    SVC_VODAFONE = "vodafone"

    # Disambiguation strings.
    DIS_UPDATE = "update" #pda vs. update
    
    
    # Initialize the userAgent and httpAccept variables
    # 
    # @param userAgent the User-Agent header
    # @param httpAccept the Accept header
    def initialize(user_agent, http_accept)
      @user_agent = user_agent.downcase || ''
      @http_accept = http_accept.downcase || ''
      # Intialize key stored values.
      init_device_scan()
    end
    
    # Return the lower case HTTP_USER_AGENT
    # Return the lower case HTTP_ACCEPT
    # Return whether the device is an Iphone or iPod Touch
    # Return whether the device is in the Iphone Tier.
    # Return whether the device is an Iphone or iPod Touch
    # Return whether the device is an Iphone or iPod Touch
    #
    # See attr_reader at the top of the class for why these are gone.
    
    
    # Initialize Key Stored Values.
    def init_device_scan
      @is_iphone = is_iphone_or_ipod?
      @is_tier_iphone = is_tier_iphone?
      @is_tier_rich_css = is_tier_rich_css?
      @is_tier_generic_mobile = is_tier_other_phones?
    end
    
    # Detects if the current device is an iPhone.
    def is_iphone?
        # The iPad and iPod touch say they're an iPhone! So let's disambiguate.
        !@user_agent.index(DEVICE_IPHONE).nil? && !is_ipad? && !is_ipod?
    end
    
    # Detects if the current device is an iPod Touch.
    def is_ipod?
        !@user_agent.index(DEVICE_IPOD).nil?
    end
    
    # Detects if the current device is an iPad tablet.
    def is_ipad?
      !@user_agent.index(DEVICE_IPAD).nil? && is_webkit?
    end
    
    # Detects if the current device is an iPhone or iPod Touch.
    def is_iphone_or_ipod?
        # We repeat the searches here because some iPods may report themselves as an iPhone, which would be okay.
        !@user_agent.index(DEVICE_IPHONE).nil? || !@user_agent.index(DEVICE_IPOD).nil?
    end
    
    # Detects if the current device is an Android OS-based device.
    def is_android?
      !@user_agent.index(DEVICE_ANDROID).nil?
    end
    
    # Detects if the current device is an Android OS-based device and
    # the browser is based on WebKit.
    def is_android_webkit?
      is_android? && is_webkit?
    end
    
    # Detects if the current browser is based on WebKit.
    def is_webkit?
      !@user_agent.index(ENGINE_WEB_KIT).nil?
    end
    
    # Detects if the current browser is the S60 Open Source Browser.
    def is_s60_oss_browser?
      is_webkit? && (!@user_agent.index(DEVICE_SYMBIAN).nil? || !@user_agent.index(DEVICE_S60).nil?)
    end
    
    # Detects if the current device is any Symbian OS-based device,
    # including older S60, Series 70, Series 80, Series 90, and UIQ,
    # or other browsers running on these devices.
    def is_symbian_os?
      !@user_agent.index(DEVICE_SYMBIAN).nil? || !@user_agent.index(DEVICE_S60).nil? || !@user_agent.index(DEVICE_S70).nil? || !@user_agent.index(DEVICE_S80).nil? || !@user_agent.index(DEVICE_S90).nil?
    end
    
    # Detects if the current browser is a Windows Phone 7 device.
    def is_windows_phone7?
      !@user_agent.index(DEVICE_WIN_PHONE7).nil?
    end
    
    # Detects if the current browser is a Windows Phone 7 device.
    def is_windows_mobile?
      # Exclude new Windows Phone 7.
      return false if is_windows_phone7?
      
      #Most devices use 'Windows CE', but some report 'iemobile'
      #  and some older ones report as 'PIE' for Pocket IE.
      #  We also look for instances of HTC and Windows for many of their WinMo devices.
      return true if ( !@user_agent.index(DEVICE_WIN_MOB).nil? || 
        !@user_agent.index(DEVICE_IE_MOB).nil? || 
        !@user_agent.index(ENGINE_PIE).nil? || 
        (!@user_agent.index(MANU_HTC).nil? && !@user_agent.index(DEVICE_WINDOWS).nil?) || 
        (is_wap_wml? && !@user_agent.index(DEVICE_WINDOWS).nil?) )
      
      # Test for Windows Mobile PPC but not old Macintosh PowerPC.
      !@user_agent.index(DEVICE_PPC).nil? && @user_agent.index(DEVICE_MAC_PPC).nil?
    end
    
    # Detects if the current browser is a BlackBerry of some sort.
    def is_black_berry?
      !@user_agent.index(DEVICE_BB).nil? || !@http_accept.index(VND_RIM).nil?
    end
    
    # Detects if the current browser is a BlackBerry device AND uses a
    #   WebKit-based browser. These are signatures for the new BlackBerry OS 6.
    #   Examples: Torch
    def is_black_berry_web_kit?
      !@user_agent.index(DEVICE_BB).nil? && !@user_agent.index(ENGINE_WEB_KIT).nil?
    end
    
    # Detects if the current browser is a BlackBerry Touch
    # device, such as the Storm or Torch
    def is_black_berry_touch?
      !@user_agent.index(DEVICE_BB_STORM).nil? || !@user_agent.index(DEVICE_BB_TORCH).nil?
    end
    
    # Detects if the current browser is a BlackBerry device AND
    #   has a more capable recent browser.
    #   Examples, Storm, Bold, Tour, Curve2
    #   Excludes the new BlackBerry OS 6 browser!!
    def is_black_berry_high?
      # Disambiguate for BlackBerry OS 6 (WebKit) browser
      return false if is_black_berry_web_kit?
      
      is_black_berry? && (is_black_berry_touch? || !@user_agent.index(DEVICE_BB_BOLD).nil? || !@user_agent.index(DEVICE_BB_TOUR).nil? || !@user_agent.index(DEVICE_BB_CURVE).nil?)
    end
    
    # Detects if the current browser is a BlackBerry device AND
    #   has an older, less capable browser.
    #   Examples: Pearl, 8800, Curve1
    def is_black_berry_low?
      # Assume that if it's not in the High tier, then it's Low
      is_black_berry? && !is_black_berry_high?
    end
    
    # Detects if the current browser is on a PalmOS device.
    def is_palm_os?
      # Most devices nowadays report as 'Palm', but some older ones reported as Blazer or Xiino.
      # Make sure it's not WebOS first
      !is_palm_web_os? && (!@user_agent.index(DEVICE_PALM).nil? || !@user_agent.index(ENGINE_BLAZER).nil? || !@user_agent.index(ENGINE_XIINO).nil?)
    end
    
    # Detects if the current browser is on a Palm device
    #   running the new WebOS.
    def is_palm_web_os?
      !@user_agent.index(DEVICE_WEB_OS).nil?
    end
    
    # Detects if the current browser is a Garmin Nuvifone.
    def is_garmin_nuvifone?
      !@user_agent.index(DEVICE_NUVIFONE).nil?
    end
    
    # Check to see whether the device is any device
    #   in the 'smartphone' category.
    def is_smartphone?
      ( is_iphone_or_ipod? || 
        is_s60_oss_browser? || 
        is_symbian_os? || 
        is_android? || 
        is_windows_mobile? || 
        is_windows_phone7? || 
        is_black_berry? || 
        is_palm_web_os? || 
        is_palm_os? || 
        is_garmin_nuvifone? )
    end
    
    # Detects whether the device is a Brew-powered device.
    def is_brew_device?
      !@user_agent.index(DEVICE_BREW).nil?
    end
    
    # Detects the Danger Hiptop device.
    def is_danger_hiptop?
      !@user_agent.index(DEVICE_DANGER).nil? || !@user_agent.index(DEVICE_HIPTOP).nil?
    end
    
    # Detects Opera Mobile or Opera Mini.
    def is_opera_mobile?
      !@user_agent.index(ENGINE_OPERA).nil? && (!@user_agent.index(MINI).nil? || !@user_agent.index(MOBI).nil?)
    end
    
    # Detects whether the device supports WAP or WML.
    def is_wap_wml?
      !@http_accept.index(VNDWAP).nil? || !@http_accept.index(WML).nil?
    end
    
    # Detects if the current device is an Amazon Kindle.
    def is_kindle?
      !@user_agent.index(DEVICE_KINDLE).nil?
    end
    
    # The quick way to detect for a mobile device.
    #  Will probably detect most recent/current mid-tier Feature Phones
    #  as well as smartphone-class devices. Excludes Apple iPads.
    def is_mobile_quick?
      # Let's say no if it's an iPad, which contains 'mobile' in its user agent
      return false if is_ipad?
      
      ( is_smartphone? || 
        is_wap_wml? || 
        is_brew_device? || 
        is_opera_mobile? || 
        !@user_agent.index(ENGINE_NETFRONT).nil? || 
        !@user_agent.index(ENGINE_UP_BROWSER).nil? || 
        !@user_agent.index(ENGINE_OPEN_WEB).nil? || 
        is_danger_hiptop? || 
        is_midp_capable? || 
        is_maemo_tablet? || 
        is_archos? || 
        (!@user_agent.index(DEVICE_PDA).nil? && @user_agent.index(DIS_UPDATE).nil?) || # no index found
        !@user_agent.index(MOBILE).nil? )
    end
    
    # Detects if the current device is a Sony Playstation.
    def is_sony_playstation?
      !@user_agent.index(DEVICE_PLAYSTATION).nil?
    end
    
    # Detects if the current device is a Nintendo game device.
    def is_nintendo?
      !@user_agent.index(DEVICE_NINTENDO).nil? || !@user_agent.index(DEVICE_WII).nil? || !@user_agent.index(DEVICE_NINTENDO_DS).nil?
    end
    
    # Detects if the current device is a Microsoft Xbox.
    def is_xbox?
      !@user_agent.index(DEVICE_XBOX).nil?
    end
    
    # Detects if the current device is an Internet-capable game console.
    def is_game_console?
      is_sony_playstation? || is_nintendo? || is_xbox?
    end
    
    # Detects if the current device supports MIDP, a mobile Java technology.
    def is_midp_capable?
      !@user_agent.index(DEVICE_MIDP).nil? || !@http_accept.index(DEVICE_MIDP).nil?
    end
    
    # Detects if the current device is on one of the Maemo-based Nokia Internet Tablets.
    def is_maemo_tablet?
      !@user_agent.index(MAEMO).nil? || (!@user_agent.index(MAEMO_TABLET).nil? && !@user_agent.index(LINUX).nil?)
    end
    
    # Detects if the current device is an Archos media player/Internet tablet.
    def is_archos?
      !@user_agent.index(DEVICE_ARCHOS).nil?
    end
    
    # Detects if the current browser is a Sony Mylo device.
    def is_sony_mylo?
      !@user_agent.index(MANU_SONY).nil? && ( !@user_agent.index(QTEMBEDDED).nil? || !@user_agent.index(MYLOCOM2).nil? )
    end
    
    # The longer and more thorough way to detect for a mobile device.
    #   Will probably detect most feature phones,
    #   smartphone-class devices, Internet Tablets,
    #   Internet-enabled game consoles, etc.
    #   This ought to catch a lot of the more obscure and older devices, also --
    #   but no promises on thoroughness!
    def is_mobile_long?
      return true if is_mobile_quick? || is_game_console? || is_sony_mylo?
      
      # detect older phones from certain manufacturers and operators.
      ( !@user_agent.index(UPLINK).nil? || 
        !@user_agent.index(MANU_SONY_ERICSSON).nil? || 
        !@user_agent.index(MANUERICSSON).nil? || 
        !@user_agent.index(MANU_SAMSUNG1).nil? || 
        !@user_agent.index(SVC_DOCOMO).nil? || 
        !@user_agent.index(SVC_KDDI).nil? || 
        !@user_agent.index(SVC_VODAFONE).nil? )
    end
    
    #*****************************
    # For Mobile Web Site Design
    #*****************************
    
    # The quick way to detect for a tier of devices.
    #   This method detects for devices which can
    #   display iPhone-optimized web content.
    #   Includes iPhone, iPod Touch, Android, Palm WebOS, etc.
    def is_tier_iphone?
      ( is_iphone_or_ipod? || 
        is_android? || 
        is_android_webkit? || 
        is_windows_phone7? || 
        is_black_berry_web_kit? || 
        is_palm_web_os? || 
        is_garmin_nuvifone? || 
        is_maemo_tablet? )
    end
    
    # The quick way to detect for a tier of devices.
    #   This method detects for devices which are likely to be capable
    #   of viewing CSS content optimized for the iPhone,
    #   but may not necessarily support JavaScript.
    #   Excludes all iPhone Tier devices.
    def is_tier_rich_css?
      ( is_mobile_quick? && 
        (is_webkit? || 
          is_s60_oss_browser? || 
          is_black_berry_high? || 
          is_windows_mobile? || 
          !@user_agent.index(ENGINE_TELECA_Q).nil? ))
    end
    
    #  The quick way to detect for a tier of devices.
    #   This method detects for all other types of phones,
    #   but excludes the iPhone and RichCSS Tier devices.
    def is_tier_other_phones?
      is_mobile_quick? && !is_tier_iphone? && !is_tier_rich_css?
    end
    
  end
  
end