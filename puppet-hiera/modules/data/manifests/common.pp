# sets the common (across all puppet conf) ntp servers.
class data::common {
  $ntpservers = ['ntp0.example.com', 'ntp1.example.com']
}
