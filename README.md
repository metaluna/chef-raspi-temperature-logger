# Log Temperature Cookbook

This cookbook will install a temperature logger on a Raspberry Pi running Raspbian Stretch.

Logs will be written to /var/log/temperature/temperature.log.

This includes a config file for logrotate keeping logs of the last 30 days in /var/log/temperature/archive.

## Requirements

### Platforms

- Raspbian

### Chef

- Chef 12+

### Cookbooks

- none

## Attributes

- `node['temperature_log']['user']` - The owner of the installed files (default: root)
- `node['temperature_log']['group']` - The group of the installed files (default: root)
- `node['temperature_log']['log_dir']` - The path to the log directory (default: /var/log/temperature)
- `node['temperature_log']['log_interval']` - The interval between to logging entries in minutes (default: 5)
- `node['temperature_log']['keep_log_count']` - The number of logs to keep in days (default: 30)

## Templates

- `logrotate.d\temperature.erb` - The logrotate config file. Expects the variables `log_dir`, `log_name`, and `keep_log_count`
- `log_temp.sh` - The actual logging script. Expects the variable `log_path` containing the directory and file name of the log

## Cookbook Files

- none

## Usage

Nothing to note.

## License & Authors

Copyright 2018, Simon Hardijanto ([simon@hardijanto.de](mailto:simon@hardijanto.de))

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.