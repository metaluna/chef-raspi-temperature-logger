# Attributes for temperature_log
default['temperature_log'] = {
    'user' => 'root',
    'group' => 'root',
    'log_dir' => '/var/log/temperature',
    'log_interval' => 5,
    'keep_log_count' => 30
}