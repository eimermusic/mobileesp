require 'spec_helper'

describe "MobileESP::UserAgentInfo" do
  
  it "correctly aliases attribute readers" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_0_2 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A400 Safari/6531.22.7",
    "*/*"
    )
    esp.get_is_iphone.should == esp.is_iphone
    esp.get_is_tier_iphone.should ==  esp.is_tier_iphone
    esp.get_is_tier_rich_css.should ==  esp.is_tier_rich_css
    esp.get_is_tier_generic_mobile.should ==  esp.is_tier_generic_mobile
  end
  
  it "correctly aliases methods" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_0_2 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A400 Safari/6531.22.7",
    "*/*"
    )
    esp.detect_iphone.should == esp.is_iphone?
  end
  
  
  it "correctly detects an ipod touch" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPod; U; CPU iPhone OS 4_0_2 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A400 Safari/6531.22.7",
    "*/*"
    )
    esp.is_mobile_quick?.should    be_true
    esp.is_iphone_or_ipod?.should  be_true
    esp.is_iphone?.should          be_false
    esp.is_ipod?.should            be_true
    esp.is_ipad?.should            be_false
  end

  it "correctly detects an iphone 3.1.3" do
    # iphone v3.1.3
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16",
    "*/*"
    )
    esp.is_mobile_quick?.should    be_true
    esp.is_iphone_or_ipod?.should  be_true
    esp.is_iphone?.should          be_true
    esp.is_ipod?.should            be_false
    esp.is_ipad?.should            be_false
  end
  
  it "correctly detects an iphone 4.0.2" do
    # iphone 4.0.2
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_2 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A400 Safari/6531.22.7",
    "*/*"
    )
    esp.is_mobile_quick?.should    be_true
    esp.is_iphone_or_ipod?.should  be_true
    esp.is_iphone?.should          be_true
    esp.is_ipod?.should            be_false
    esp.is_ipad?.should            be_false
  end
  
  it "correctly detects an ipad" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (iPad; U; CPU OS 3_2_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B500 Safari/531.21.10",
    "*/*"
    )
    esp.is_mobile_quick?.should    be_false
    esp.is_iphone_or_ipod?.should  be_false
    esp.is_ipad?.should            be_true
  end


  it "correctly detects a Google Nexus" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (Linux; U; Android 2.1; en-us; Nexus One Build/ERD62) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17",
    ""
    )
    esp.is_mobile_quick?.should    be_true
    esp.is_iphone_or_ipod?.should  be_false
    esp.is_android?.should         be_true
  end
  
  it "correctly detects that a Google Nexus is not a Google TV" do
    esp = MobileESP::UserAgentInfo.new(
    "Mozilla/5.0 (Linux; U; Android 2.1; en-us; Nexus One Build/ERD62) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17",
    ""
    )
    esp.is_android?.should         be_true
    esp.is_google_tv?.should       be_false
  end
  
  # more to be added here... lots more
  
  
end