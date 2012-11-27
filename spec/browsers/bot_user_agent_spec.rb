require "user_agent"
require "support/shared_examples_for_friendly"

describe "UserAgent: 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)")
  end

  it { @useragent.should be_bot }

  it_should_behave_like "friend", "Googlebot"
end

describe "UserAgent: 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)")
  end

  it { @useragent.should be_bot }

  it_should_behave_like "friend", "bingbot"
end
