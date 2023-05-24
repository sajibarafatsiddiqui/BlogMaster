require 'test_helper'

WINDOWS_HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'`.strip
CHROMEDRIVER_URL = "http://#{WINDOWS_HOST}:9515/".freeze
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
